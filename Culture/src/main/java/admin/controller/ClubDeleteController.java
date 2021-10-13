package admin.controller;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import admin.model.ClubDao;

@Controller
public class clubDeleteController {

	@Autowired
	private ClubDao cdao;
	
	private final String command = "/clubDelete.ad";
	private final String gotoPage = "redirect:clubList.ad";
	
	@RequestMapping(value=command)
	public ModelAndView deleteClub(ModelAndView mav, HttpServletResponse response,
			@RequestParam("num") int num,
			@RequestParam("pageNumber") int pageNumber) {
		
		int cnt = -1;
		cnt=cdao.deleteClub(num);
		
		if(cnt!=-1) {
			
		}else {
			
		}
		
		mav.setViewName(gotoPage);
		mav.addObject("pageNumber",pageNumber);
		return mav;
	}
	
}
