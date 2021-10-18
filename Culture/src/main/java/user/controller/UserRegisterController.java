package user.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import user.model.UserDao;
import user.model.UserVo;

@Controller
public class UserRegisterController {
	final String command = "/register.ur";
	final String getPage = "register";
	final String gotoPage = "redirect:/login.ur";
	final String ajax = "/idchack.ur";
	
	@Autowired
	ServletContext servletContext;
	@Autowired
	private UserDao uDao;
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public ModelAndView doAction(ModelAndView mav, HttpSession session)  {
		if(session.getAttribute("userInfo")!=null) {
			mav.setViewName(gotoPage);
			return mav;
		}
		
		mav.setViewName(getPage);
		return mav;
	}
	
	@RequestMapping(value = ajax)
	@ResponseBody
	public String idCheck(@RequestParam(value = "id") String id) {
		String result = "";
		
		if(id == "") {
			result = "empty";
			return result;
		}
		
		int cnt = uDao.checkIdDuplicate(id);
		
		if(cnt == 0) {
			result = "N";
		}else if(cnt == 1){
			result = "Y";
		}
		return result;
	}

	@RequestMapping(value = command, method = RequestMethod.POST)
	public ModelAndView doAction(ModelAndView mav, @Valid @ModelAttribute("user") UserVo uvo,
								BindingResult result)  {
		String uploadPath = servletContext.getRealPath("/resources/userImg");
		
		if(result.hasErrors()) {
			mav.setViewName(getPage);
			return mav;
		}
		
		MultipartFile multi = uvo.getImgFile();
		
		int cnt = 0;
		cnt = uDao.insertUserData(uvo);
		
		if(cnt > 0) {
			File destination = new File(uploadPath+"\\"+uvo.getImage());
			try {
				multi.transferTo(destination);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			mav.setViewName(gotoPage);
		}else {
			mav.setViewName(getPage);
		}
		return mav;
	}
}
