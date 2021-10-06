package user.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.http.HttpResponse;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import user.model.UserDao;
import user.model.UserVo;

@Controller
public class UserloginController {
	final String command = "/login.ur";
	final String command2 = "/logout.ur";
	final String getPage = "login";
	final String gotoPage = "redirect:/main.do";
	
	@Autowired
	private UserDao uDao;
	
	@RequestMapping(value = command,method = RequestMethod.GET)
	public ModelAndView doAction(ModelAndView mav, HttpSession session){
		Object loginInfo = session.getAttribute("loginInfo");
		
		if(loginInfo != null) {
			mav.setViewName(gotoPage);
			return mav;
		}
		
		mav.setViewName(getPage);
		return mav;
	}
	
	@RequestMapping(value = command,method = RequestMethod.POST)
	public ModelAndView doLogin(ModelAndView mav, HttpSession session, HttpServletResponse response,
							@RequestParam(value = "id",required = false) String id,
							@RequestParam(value = "passwd",required = false) String passwd) throws IOException{
		String msg = "";
		response.setContentType("text/html;charset=UTF-8");

		PrintWriter pw = response.getWriter();
		Map<String,String> map = new HashMap<String,String>();
		
		if(id == "" || id == null) {
			msg = "<script type='text/javascript'> alert('아이디를 입력해주세요.');</script>.";
			pw.println(msg);
			pw.flush();
			mav.setViewName(getPage);
			return mav;
		}else if(passwd == "" || passwd == null) {
			msg = "<script type='text/javascript'> alert('비밀번호를 입력해주세요.');</script>.";
			pw.println(msg);
			pw.flush();
			mav.setViewName(getPage);
			return mav;
		}
		
		map.put("id", id);
		map.put("passwd", passwd);
		
		UserVo uVo = uDao.getUserData(map);
		
		if(uVo == null) {
			msg = "<script type='text/javascript'> alert('일치하는 정보가 없습니다.');</script>.";
			pw.println(msg);
			pw.flush();
			mav.setViewName(getPage);
			return mav;
		}
		
		session.setAttribute("loginInfo", uVo);
		
		mav.setViewName(gotoPage);
		return mav;
	}
	
	@RequestMapping(value = command2)
	public ModelAndView doLogout(ModelAndView mav, HttpSession session){
		
		session.removeAttribute("loginInfo");
		
		mav.setViewName(gotoPage);
		return mav;
	}
}
