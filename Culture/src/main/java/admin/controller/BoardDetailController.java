package admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import admin.model.BoardBean;
import admin.model.BoardDao;
import admin.model.MemberBean;
import admin.model.MemberDao;

@Controller
public class BoardDetailController {
	
	@Autowired
	private BoardDao bdao;
	
	private final String command = "boardDetail.ad";
	private final String getPage = "boardDetailForm";
	
	@RequestMapping(value=command,method = RequestMethod.GET)
	public ModelAndView detailForm(
			ModelAndView mav,
			@RequestParam("num") int num,
			@RequestParam("pageNumber") int pageNumber) {
		
		
		BoardBean bean = bdao.getBoard(num);
		
		System.out.println("cate:"+bean.getCategory());
		
		bdao.updateReadCount(num);

		mav.addObject("pageNumber", pageNumber);
		mav.addObject("bean", bean);
		mav.setViewName(getPage);
		
		return mav;
	}
}
