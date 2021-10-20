package board.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
import user.model.UserVo;

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
			@RequestParam(value = "wid") String wid,
			@RequestParam(value = "category") String category,
			@RequestParam(value = "pageNumber") int pageNumber,
			HttpSession session,
			HttpServletResponse response,
			HttpServletRequest request,
			ModelAndView mav) throws IOException {		
		

		if(session.getAttribute("loginInfo")==null) {
			session.setAttribute("destination", "/boardInsert.bd"); // session설정해두면 아무데서나 쓸 수 있다. 목적지 설정해둔것.			
			mav.setViewName("redirect:/login.ur"); // login.ur
			return mav;
		}//login null
		else {
			UserVo uVo =  (UserVo)session.getAttribute("loginInfo");
			if(wid.equals(uVo.getId())){
				System.out.println("니꺼야");
				brDao.deleteBoardReplyData(num);			
				bDao.deleteBoardData(num);
				mav.setViewName("redirect:/"+category+"BoardList.bd?pageNumber="+pageNumber);
				return mav;
			}else {
				System.out.println("니꺼아니야");
				mav.setViewName("redirect:/"+category+"BoardList.bd?pageNumber="+pageNumber);
				return mav;
			}
			
		}
			
			

			
				
			
		
	}
}
