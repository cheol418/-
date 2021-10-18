package board.controller;

import java.io.IOException;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import board.model.BoardBean;
import board.model.BoardDao;
import board.model.BoardReplyBean;
import board.model.BoardReplyDao;
import concert.controller.ConcertApi;
import concert.controller.ConcertMainController;
import concert.model.*;

@Controller
public class ClubBoardDetailForm {

	@Autowired
	private BoardDao bDao;
	
	@Autowired
	private BoardReplyDao brDao;		
	
	@RequestMapping(value= "/clubBoardDetailForm.bd")
	public ModelAndView doActionListGet(
						Model model,
						ModelAndView mav,						
						@RequestParam(value="uid",required=false) String uid,						
						@RequestParam(value="chatnum",required=false) int chatnum,
						HttpSession session){
		
		ConcertApi api = new ConcertApi();
		List<Map<String,Object>> concertList = api.getCultureList(1,15);
		session.setAttribute("concertList", concertList);
		
		List<BoardReplyBean> clubBoardChatLists = brDao.getClubBoardChatLists();
		model.addAttribute("clubBoardChatLists", clubBoardChatLists); 
		
		//int num=2;
		List<BoardReplyBean> boardReplyLists = brDao.getTotalBoardReplyList(chatnum);
		model.addAttribute("boardReplyLists", boardReplyLists);		
		
		mav.addObject("uid",uid);		
		mav.addObject("chatnum",chatnum);		
		mav.setViewName("clubBoardDetailCardForm");
		return mav;
	}
	
	
	@RequestMapping(value="/replyClubWrite.bd", method = RequestMethod.POST)
	public ModelAndView replyWrite(							
									@RequestParam(value="bno",required=false) int chatnum,
									BoardReplyBean replybean,		
									BoardBean bean,
									ModelAndView mav,	
									HttpServletRequest request) throws Exception {
		
		
		System.out.println("239128732189379");
		System.out.println("brDaoGetNUm: " + replybean.getBno());
		System.out.println("brDaoGetNUm: " + replybean.getRno());
		System.out.println("brDaoGetNUm: " + replybean.getWriter());
		System.out.println("brDaoGetNUm: " + replybean.getContent());	
		
		int cnt = -1;
		cnt = brDao.writeReply(replybean);		
		
		
		mav.addObject("bno",chatnum);
		
		mav.setViewName("redirect:/clubBoardDetailForm.bd?uid="+replybean.getWriter()+"&chatnum="+replybean.getBno());	
				
		return mav;
	}
}