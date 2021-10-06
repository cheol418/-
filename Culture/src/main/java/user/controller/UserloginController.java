package user.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.http.HttpResponse;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class UserloginController {
	final String command = "/login.ur";
	final String getPage = "login";
	final String gotoPage = "redirect:/main.do";
	
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
	public ModelAndView doAction(ModelAndView mav, HttpSession session, HttpServletResponse response,
							@RequestParam("id") String id,@RequestParam("passwd") String passwd) throws IOException{
		String msg = "";
		PrintWriter pw = response.getWriter();
		
		
		mav.setViewName(getPage);
		return mav;
	}
}
