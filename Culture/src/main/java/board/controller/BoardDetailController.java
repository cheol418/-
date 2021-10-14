package board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import board.model.BoardBean;
import board.model.BoardDao;
import board.model.BoardReplyBean;
import board.model.BoardReplyDao;

@Controller
public class BoardDetailController {	
	@Autowired
	private BoardDao bDao; 
	
	@Autowired
	private BoardReplyDao brDao;
	
	@RequestMapping(value = "/boardDetail.bd")
	public ModelAndView doAction(@RequestParam(value = "pageNumber") int pageNumber,
								@RequestParam(value = "num") int num,
								ModelAndView mav, Model model, BoardReplyBean replybean, @Valid BoardBean bean,BindingResult result) throws IOException {
		bDao.updateReadCount(num);
		BoardBean board = bDao.getBoardData(num);
		System.out.println("brDaoGetNUm: " + bean.getNum());
	
		
		List<BoardReplyBean> boardReplyLists = brDao.getTotalBoardReplyList(bean.getNum());
		model.addAttribute("boardReplyLists", boardReplyLists); 
		
		mav.addObject("board",board);
		mav.addObject("pageNumber",pageNumber);
		mav.setViewName("boardDetailForm");
		return mav;
	}
	
	@RequestMapping(value="/replyWrite.bd", method = RequestMethod.POST)
	public ModelAndView replyWrite(@RequestParam(value = "pageNumber") int pageNumber,
									BoardReplyBean replybean,		
									BoardBean bean,
									ModelAndView mav,	
									HttpServletRequest request) throws Exception {
		
		
		System.out.println("239128732189379");
		System.out.println("brDaoGetNUm: " + replybean.getBno());
		System.out.println("brDaoGetNUm: " + replybean.getRno());
		System.out.println("brDaoGetNUm: " + replybean.getWriter());
		System.out.println("brDaoGetNUm: " + replybean.getContent());
		
		System.out.println("---------------");
		String url = request.getHeader("REFERER");
		String CT = null;
		if(url.contains("notice")) {
			CT = "notice";
		}else if (url.contains("qna")) {
			CT= "qna";
		}else if (url.contains("free")) {
			CT= "free";
		}
		else {
			CT="ERROR";
		}
		
		int cnt = -1;
		cnt = brDao.writeReply(replybean);
		
		System.out.println("bdasdjklasjdlks");
		
				
		mav.addObject("CT",CT);
		mav.addObject("pageNumber",pageNumber);
		mav.setViewName("redirect:/boardDetail.bd?num="+replybean.getBno()+"&category="+CT+"&pageNumber"+pageNumber);
		return mav;
		
		
	}
}
