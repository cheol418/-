package board.controller;

import java.io.IOException;
import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import board.model.BoardBean;
import board.model.BoardDao;

@Controller
public class BoardReplyController {
	private final String command = "/boardReply.bd";
	private final String getPage = "boardReplyForm";
	private final String gotoPage = "redirect:/boardList.bd";

	@Autowired
	private BoardDao bDao; 

	@RequestMapping(value = "/boardReply.bd", method = RequestMethod.GET)
	public ModelAndView doActionGet(@RequestParam(value = "pageNumber") int pageNumber,
									@RequestParam(value = "category") String category,
								BoardBean bean,ModelAndView mav) {
		System.out.println("fCATE222: " + category);
		mav.addObject("board",bean);
		mav.addObject("pageNumber",pageNumber);
		mav.addObject("fCategory",category);
		mav.setViewName("boardReplyForm");
		return mav;
	}
	
	@RequestMapping(value = "/boardReply.bd",method = RequestMethod.POST)
	public ModelAndView doActionPost(@RequestParam(value = "pageNumber") int pageNumber, 
									@RequestParam(value = "category") String category, ModelAndView mav,
								HttpServletResponse response, HttpServletRequest request,
								@ModelAttribute("board") @Valid BoardBean bean,BindingResult result){
		if(result.hasErrors()) {
			mav.addObject("pageNumber",pageNumber);
			mav.setViewName("boardReplyForm");
			return mav;
		}
		
		bean.setRegdate(new Timestamp(System.currentTimeMillis()));
		
		bDao.insertReplyBoard(bean);
		
		mav.addObject("pageNumber",pageNumber);
		mav.setViewName("redirect:/"+category+"BoardList.bd"); 
		
		return mav;
	}
}
