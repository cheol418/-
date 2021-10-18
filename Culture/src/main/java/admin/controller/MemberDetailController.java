package admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import admin.model.MemberBean;
import admin.model.MemberDao;

@Controller
public class MemberDetailController {
	
	@Autowired
	private MemberDao mdao;
	
	private final String command = "memberDetail.ad";
	private final String getPage = "memberDetailForm";
	
	@RequestMapping(value=command,method = RequestMethod.GET)
	public ModelAndView detailForm(
			ModelAndView mav,
			@RequestParam("num") int num,
			@RequestParam("pageNumber") int pageNumber) {
		
		MemberBean bean = mdao.getMember(num);
		
		mav.addObject("pageNumber", pageNumber);
		mav.addObject("bean", bean);
		mav.setViewName(getPage);
		
		return mav;
	}
}
