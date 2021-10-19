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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import board.model.BoardBean;
import board.model.BoardDao;
import board.model.BoardReplyBean;
import board.model.BoardReplyDao;
import concert.controller.ConcertApi;
import concert.controller.ConcertMainController;
import concert.model.*;
import user.controller.UserloginController;
import user.model.UserDao;
import user.model.UserVo;



@Controller
public class CboardListController {

	@Autowired
	private BoardDao bDao;
	
	@Autowired
	private BoardReplyDao brDao;		
	
				 
	@RequestMapping(value= "/clubBoardList.bd")
	public ModelAndView doActionList(
						Model model,
						ModelAndView mav,		
						@RequestParam(value="uid",required=false) String uid,
						HttpSession session,
						HttpServletRequest request){
	
		UserVo uVo =  (UserVo)session.getAttribute("loginInfo");
	
	
		
		ConcertApi api = new ConcertApi();
		List<Map<String,Object>> concertList = api.getCultureList(1,15);
		session.setAttribute("concertList", concertList);
		
		List<BoardReplyBean> clubBoardChatLists = brDao.getClubBoardChatLists();
		model.addAttribute("clubBoardChatLists", clubBoardChatLists); 
		
		int num=2;
		List<BoardReplyBean> boardReplyLists = brDao.getTotalBoardReplyList(num);
		model.addAttribute("boardReplyLists", boardReplyLists);		
		
		mav.addObject("uid",uid);
		mav.setViewName("clubBoardList");
		return mav;
	}
	
	@RequestMapping(value= "/ownedClubBoardList.bd")
	public ModelAndView doActionListOwned(
						Model model,
						ModelAndView mav,						
						HttpSession session, 
						@RequestParam(value="uid",required=false) String uid,						
						HttpServletRequest request){
		
		ConcertApi api = new ConcertApi();
		List<Map<String,Object>> concertList = api.getCultureList(1,15);
		session.setAttribute("concertList", concertList);
		
		List<BoardReplyBean> clubBoardChatLists = brDao.getClubBoardChatLists(); 
		mav.addObject("clubBoardChatLists", clubBoardChatLists);
		
		int num=3;
		List<BoardReplyBean> boardReplyLists = brDao.getTotalBoardReplyList(num);
		model.addAttribute("boardReplyLists", boardReplyLists);		
		
		
		mav.addObject("uid",uid);
		mav.setViewName("clubBoardList");
		return mav;
	}
	
}
