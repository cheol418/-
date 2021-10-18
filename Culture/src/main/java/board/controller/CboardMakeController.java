package board.controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import board.model.BoardBean;
import board.model.BoardDao;
import board.model.BoardReplyBean;
import board.model.BoardReplyDao;

import concert.controller.ConcertMainController;
import concert.model.*;



@Controller
public class CboardMakeController {
	@Autowired
	private BoardDao bDao;
	
	@Autowired
	private BoardReplyDao brDao;		
	
	@RequestMapping(value = "/clubBoardMakeForm.bd",method = RequestMethod.GET)
	public ModelAndView doActionMakeFormGet(@RequestParam(value = "uid") String uid,
								@RequestParam(value = "SVCID") String svcid,
								ModelAndView mav, 
								Model model, 
								HttpSession session,								
								@Valid BoardBean bean,BindingResult result) throws IOException {
		
		ConcertMainController CMC = new ConcertMainController();
		ModelAndView concertList = CMC.doAction(mav, session);	
		session.setAttribute("concertList", concertList);
		
		mav.addObject("uid",uid);
		mav.addObject("SVCID", svcid);		
		mav.setViewName("clubBoardMakeForm");
		return mav;
	}
	
	@RequestMapping(value = "/clubBoardMakeForm.bd",method = RequestMethod.POST)
	public ModelAndView doActionMakeFormPost(
								ModelAndView mav, 
								Model model, 
								HttpSession session,	
								HttpServletRequest request,
								@ModelAttribute("board") @Valid BoardBean bean,BindingResult result) 
								throws IOException {
		
		bean.setRegdate(new Timestamp(System.currentTimeMillis()));
		
		int cnt = -1;
		cnt = bDao.insertClubData(bean);
		
		
		
		
		mav.setViewName("redirect:/clubBoardList.bd");							
		return mav;
	}
}