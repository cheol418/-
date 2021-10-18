package concert.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ConcertDetailController {
	final String command = "/concertDetail.do";
	final String getPage = "concertDetail";
	
	@RequestMapping(value = command)
	public ModelAndView doAction(ModelAndView mav,@RequestParam(value = "svcid") String svcid,
								@RequestParam(value = "pageNumber") String pageNumber,
								@RequestParam(value = "miniclass") String miniclass,
								HttpSession session){
		List<Map<String,Object>> concertList = (List<Map<String,Object>>)session.getAttribute("concertList");
		Map<String,Object> concert = new HashMap<String,Object>();
		
		for(Map<String,Object> obj : concertList) {
			if(obj.get("SVCID").equals(svcid)) {
				concert = obj;
				break;
			}
		}
		
		mav.addObject("pageNumber",pageNumber);
		mav.addObject("miniclass",miniclass);
		mav.addObject("concert",concert);
		mav.setViewName(getPage);
		return mav;
	}
}
