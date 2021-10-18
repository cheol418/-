package admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import admin.model.ClubBean;
import admin.model.ClubDao;

@Controller
public class ClubInsertController {
	
	@Autowired
	ClubDao cdao;
	
	private final String command = "clubInsert.ad";
	private final String getPage = "clubInsertForm";
	private final String gotoPage = "redirect:clubList.ad";
	
	@RequestMapping(value=command)
	public ModelAndView insertForm(ModelAndView mav) {
		
		mav.setViewName(getPage);
		return mav;
	}
	
	@RequestMapping(value=command,method = RequestMethod.POST)
	public ModelAndView updateClub(ModelAndView mav,
			ClubBean bean) {
		
		int cnt= -1;
		System.out.println("name:"+bean.getName());
		cnt = cdao.insertClub(bean);
		
		mav.setViewName(gotoPage);
		return mav;
	}

	
	
}
