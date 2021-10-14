package user.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import user.model.UserDao;
import user.model.UserVo;

@Controller
public class UserPageController {
	final String command = "/mypage.ur";
	final String attend = "/attendChk.ur";
	final String getPage = "myPage";
	final String main = "redirect:/main.do";
	
	@Autowired
	private UserDao uDao;
	UserloginController loginC = new UserloginController();
	
	@RequestMapping(value = command)
	public ModelAndView doAction(ModelAndView mav,HttpSession session){
		UserVo uVo =  (UserVo)session.getAttribute("loginInfo");
		boolean attend;
		if(uVo == null) {
			mav.setViewName(main);
			return mav;
		}
		
		int cnt = uDao.checkAttend(uVo.getNum());
		if(cnt==0) {
			attend = true;
		}else {
			attend = false;
		}
		
		mav.addObject("attend", attend);
		mav.setViewName(getPage);
		return mav;
	}
	
	@RequestMapping(value = attend)
	public ModelAndView doAttend(ModelAndView mav,HttpSession session,HttpServletResponse response){
		UserVo uVo =  (UserVo)session.getAttribute("loginInfo");
		
		int chkCnt = uDao.checkAttend(uVo.getNum());
		
		if(chkCnt == 0) {
			int cnt = uDao.insertAttend(uVo.getNum());
			
			try {
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter pw = response.getWriter();
				if(cnt == 1) {
					pw.println("<script type='text/javascript'>alert('5포인트를 획득하였습니다.')</script>");
				}else {
					pw.println("<script type='text/javascript'>alert('오류발생')</script>");
				}
				pw.flush();
			} catch (IOException e) {
				e.printStackTrace();
			}
		
			uDao.updateUserPoint(uVo.getNum());
		}
		
		Map<String,String> map = new HashMap<String,String>();
		map.put("id", uVo.getId());
		map.put("passwd", uVo.getPasswd());
		
		UserVo userInfo = uDao.getUserData(map);
		
		session.setAttribute("loginInfo", userInfo);
		
		mav.setViewName(getPage);
		return mav;
	}
}
