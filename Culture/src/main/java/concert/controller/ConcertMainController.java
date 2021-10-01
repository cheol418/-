package concert.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;

import board.model.BoardBean;
import concert.model.ConcertDao;

@Controller
public class ConcertMainController {
	final String command = "/main.do";
	final String getPage = "main";
	
	@Autowired
	private ConcertDao cdao;
	
	@RequestMapping(value = command)
	public ModelAndView doAction(ModelAndView mav,
			HttpSession session) throws JsonParseException, JsonMappingException, IOException {
		ConcertApi api = new ConcertApi();
		List<Map<String,Object>> concertList = api.getCultureList(1,15);
		
		List<BoardBean> noticeList = cdao.getBoardNotice();
		List<BoardBean> boardList = cdao.getBoard();
		
		session.setAttribute("concertList", concertList);
		mav.addObject("noticeList", noticeList);
		mav.addObject("boardList", boardList);
		mav.addObject("concertList", concertList);
		mav.setViewName(getPage);
		return mav;
	}
}
