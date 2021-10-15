package admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import admin.model.ClubBean;
import admin.model.ClubDao;
import utility.Paging;

@Controller
public class ClubListController {

	@Autowired
	private ClubDao cdao;
	
	private final String command = "/clubList.ad";
	private final String getPage = "clubList";
	
	@RequestMapping(value=command)
	public ModelAndView doAction(
			@RequestParam(value="whatColumn",required = false) String whatColumn,
			@RequestParam(value="keyword",required = false) String keyword,
			@RequestParam(value="pageNumber",required = false) String pageNumber,
			ModelAndView mav,HttpServletRequest request) {
		
		Map<String,String> map = new HashMap<String, String>();
		map.put("whatColumn", whatColumn); 
		map.put("keyword", "%"+keyword+"%");
		
		int totalClubCount = cdao.getTotalClubCount(map);
		String url = request.getContextPath() + command ;

		Paging pageInfo = new Paging(pageNumber,null,totalClubCount,url,whatColumn,keyword, null );

		List<ClubBean> lists = cdao.getClubList(pageInfo, map);
		mav.addObject("lists", lists);
		mav.addObject("totalCount", totalClubCount);
		mav.addObject("pageInfo", pageInfo);
		
		mav.setViewName(getPage);
		return mav;
	}
	
}
