package user.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import user.model.UserDao;
import user.model.UserVo;

@Controller
public class UserEditController {
	final String command = "/userEdit.ur";
	final String getPage = "userEdit";
	final String gotoPage = "redirect:/mypage.ur";
	final String main = "redirect:/main.do";

	@Autowired
	ServletContext servletContext;
	@Autowired
	private UserDao uDao;
	UserLoginController loginC = new UserLoginController();
	
	@RequestMapping(value = command,method = RequestMethod.GET)
	public ModelAndView doAction(ModelAndView mav, HttpSession session){
		Object loginInfo = session.getAttribute("loginInfo");
		
		if(loginInfo == null) {
			mav.setViewName(main);
			return mav;
		}
		
		mav.setViewName(getPage);
		return mav;
	}
	
	@RequestMapping(value = command,method = RequestMethod.POST)
	public ModelAndView doAction(ModelAndView mav, HttpSession session,
								@Valid @ModelAttribute("user") UserVo uvo,BindingResult result){
		Object loginInfo = session.getAttribute("loginInfo");
		
		if(loginInfo == null) {
			mav.setViewName(main);
			return mav;
		}
		
		String uploadPath = servletContext.getRealPath("/resources/userImg");
		
		if(result.hasErrors()) {
			mav.setViewName(getPage);
			return mav;
		}
		MultipartFile multi = uvo.getImgFile();
		
		int cnt = 0;
		cnt = uDao.updateUserData(uvo);
		
		if(cnt > 0) {
			File destination = new File(uploadPath+"\\"+uvo.getImage());
			File delFile = new File(uploadPath+"\\"+uvo.getOldImage());
			if(uvo.getImage() != uvo.getOldImage() && !uvo.getImage().equals("")) {
				try {
					
					File dir = new File(uploadPath);
					if(!dir.exists()) {
						dir.mkdir();
					}
					
					if(!uvo.getOldImage().equals("")) {
						delFile.delete();
					}
					multi.transferTo(destination);
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					
					e.printStackTrace();
				}
			}
			Map<String,String> map = new HashMap<String,String>();
			map.put("id", uvo.getId());
			map.put("passwd", uvo.getPasswd());
			
			UserVo userInfo = uDao.getUserData(map);
			
			session.setAttribute("loginInfo", userInfo);
			
			mav.setViewName(gotoPage);
		}else {
			mav.setViewName(getPage);
		}
		return mav;
	}
}
