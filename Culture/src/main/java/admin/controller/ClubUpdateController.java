package admin.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import admin.model.ClubBean;
import admin.model.ClubDao;

@Controller
public class ClubUpdateController {

	@Autowired
	private ClubDao cdao;
	
	private final String command = "clubUpdate.ad";
	private final String getPage = "clubUpdateForm";
	private final String gotoPage = "redirect:clubList.ad";
	
	@RequestMapping(value=command,method = RequestMethod.GET)
	public ModelAndView updateForm(
			ModelAndView mav,
			@RequestParam("num") int num,
			@RequestParam("pageNumber") int pageNumber,
			HttpServletRequest request) {
				
		
		ClubBean bean = cdao.getClub(num);
		
		mav.addObject("pageNumber", pageNumber);
		mav.addObject("bean", bean);
		mav.setViewName(getPage);
		
		return mav;
		
	}
	
	@RequestMapping(value=command,method = RequestMethod.POST)
	public ModelAndView updateClub(ModelAndView mav,
			ClubBean bean,
			@RequestParam("pageNumber") int pageNumber) {
		
		int cnt = -1;
		System.out.println("num:"+bean.getNum());
		System.out.println("name:"+bean.getName());
		
		cnt = cdao.updateClub(bean);
	
		mav.addObject("pageNumber", pageNumber);
		mav.setViewName(gotoPage);
		return mav;
	}
	
}
