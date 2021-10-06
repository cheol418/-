package board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import board.model.BoardBean;
import board.model.BoardDao;

@Controller
public class BoardDetailController {	
	@Autowired
	private BoardDao bDao; 
	
	@RequestMapping(value = "/boardDetail.bd")
	public ModelAndView doAction(@RequestParam(value = "pageNumber") int pageNumber,
								@RequestParam(value = "num") int num,
								ModelAndView mav) {
		bDao.updateReadCount(num);
		BoardBean board = bDao.getBoardData(num);
		mav.addObject("board",board);
		mav.addObject("pageNumber",pageNumber);
		mav.setViewName("boardDetailForm");
		return mav;
	}
}
