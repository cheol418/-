package admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import admin.model.BoardBean;
import admin.model.BoardDao;
import utility.Paging;

@Controller
public class BoardListController {
	private final String command = "/boardList.ad";
	private final String getPage = "boardList";
	
	@Autowired
	private BoardDao bDao; 
	
	@RequestMapping(value = command)
	public ModelAndView doAction(@RequestParam(value = "whatColumn",required = false) String whatColumn,
								@RequestParam(value = "keyword",required = false) String keyword,
								@RequestParam(value = "pageNumber",required = false) String pageNumber,
								@RequestParam(value = "category",required = false) String category,
								ModelAndView mav,HttpServletRequest request) {
		
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("keyword", keyword);
		map.put("whatColumn", whatColumn);
		map.put("category", category);

		int totalCount = bDao.getTotalBoardCount(map);
		String url = request.getContextPath()+command;

		Paging pageInfo = new Paging(pageNumber,null,totalCount,url,whatColumn,keyword,null); 
		
		
		System.out.println("cate:"+category);
		
		List<BoardBean> boardLists = bDao.getBoardList(pageInfo,map);
		mav.addObject("boardLists",boardLists);
		mav.addObject("pageInfo",pageInfo);
		mav.addObject("category",category);
		
		mav.setViewName(getPage);
		return mav;
		
	}
}