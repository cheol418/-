package concert.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import concert.model.ConcertDao;

@Controller
public class ConcertListController {
	final String command = "/list.do";
	final String getPage = "list";
	
	@Autowired
	private ConcertDao cdao;
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public ModelAndView doAction(ModelAndView mav, HttpSession session, 
								@RequestParam(value = "pageNumber")int pageNumber)  {
		ConcertApi api = new ConcertApi();
		int startNum;
		
		if(pageNumber == 1) {
			startNum = 1;
		}else {
			//한줄 5개 , 4줄 출력
			startNum = pageNumber*20+1;
		}
		
		List<Map<String,Object>> concertList = api.getCultureList(startNum,startNum+19);
		
		session.setAttribute("concertList", concertList);
		mav.addObject("concertList", concertList);
		mav.setViewName(getPage);
		return mav;
	}
}
