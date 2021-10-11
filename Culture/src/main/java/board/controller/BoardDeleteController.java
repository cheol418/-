package board.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import board.model.BoardBean;
import board.model.BoardDao;
import board.model.BoardReplyBean;
import board.model.BoardReplyDao;

@Controller
public class BoardDeleteController {
	
	@Autowired
	private BoardDao bDao;
	
	@Autowired
	private BoardReplyDao brDao;
	
	/*
	@RequestMapping(value = "/boardDelete.bd" ,method = RequestMethod.GET)
	public ModelAndView doAction(@RequestParam(value = "pageNumber") int pageNumber,
								@RequestParam(value = "category") String category,
								@RequestParam(value = "num") int num,
								ModelAndView mav) {
		System.out.println("DELDELDEL");
		
		mav.addObject("pageNumber",pageNumber);
		mav.addObject("fCategory",category);
		mav.addObject("num",num);
		mav.setViewName("boardDeleteForm");
		return mav;
	}
	*/
	
	@RequestMapping(value = "/boardDelete.bd")
	public ModelAndView doAction2(@RequestParam(value = "num") int num,
			@RequestParam(value = "category") String category,
			@RequestParam(value = "pageNumber") int pageNumber,
			ModelAndView mav) throws IOException {		
		
			System.out.println("DELDELDEL:" + num);
			System.out.println("DELDELDEL:" + category);
			System.out.println("DELDELDEL:" + pageNumber);
			
			brDao.deleteBoardReplyData(num);			
			bDao.deleteBoardData(num);

			
			mav.setViewName("redirect:/"+category+"BoardList.bd?pageNumber="+pageNumber);	
			
		return mav;
	}
}
