package board.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import board.model.BoardBean;
import board.model.BoardDao;
import utility.Paging;

@Controller
public class BoardListController {
	
	@Autowired
	private BoardDao bDao;
		
	
	@RequestMapping(value= "/noticeBoardList.bd")
	public ModelAndView doActionNotice(@RequestParam(value="whatColumn",required=false) String whatColumn,
									@RequestParam(value="keyword",required=false) String keyword,
									@RequestParam(value="pageNumber",required=false) String pageNumber,
									ModelAndView mav, HttpServletRequest request) {
	
		System.out.println("여기 오긴 오냐, BdListCont");		
		System.out.println("여기 오긴 오냐, what  " + whatColumn);		
		System.out.println("여기 오긴 오냐, key  " + keyword);		
		System.out.println("여기 오긴 오냐, pageNum  " + pageNumber);		
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("keyword", keyword);
		map.put("whatColumn", whatColumn);
		
		//int totalCount = bDao.getNoticeTotalCount(map);
		String url = request.getContextPath()+"/noticeBoardList.bd";
		int totalCount = 1;
		Paging pageInfo = new Paging(pageNumber,null,totalCount,url,whatColumn,keyword,null); 
		
		List<BoardBean> boardLists = bDao.getNoticeBoardList(pageInfo,map);
		mav.addObject("boardLists",boardLists);
		mav.addObject("pageInfo",pageInfo);
		mav.setViewName("noticeBoardList");
		
		return mav;
	}
	
	@RequestMapping(value= "/totalBoardList.bd")
	public ModelAndView doActionTotal(@RequestParam(value="whatColumn",required=false) String whatColumn,
									@RequestParam(value="keyword",required=false) String keyword,
									@RequestParam(value="pageNumber",required=false) String pageNumber,
									ModelAndView mav, HttpServletRequest request) {
	
		System.out.println("여기 오긴 오냐, BdListCont");		
		System.out.println("여기 오긴 오냐, what  " + whatColumn);		
		System.out.println("여기 오긴 오냐, key  " + keyword);		
		System.out.println("여기 오긴 오냐, pageNum  " + pageNumber);		
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("keyword", keyword);
		map.put("whatColumn", whatColumn);
		
		//int totalCount = bDao.getNoticeTotalCount(map);
		String url = request.getContextPath()+"/totalBoardList.bd";
		int totalCount = 1;
		Paging pageInfo = new Paging(pageNumber,null,totalCount,url,whatColumn,keyword,null); 
		
		List<BoardBean> boardLists = bDao.getTotalBoardList(pageInfo,map);
		mav.addObject("boardLists",boardLists);
		mav.addObject("pageInfo",pageInfo);
		mav.setViewName("totalBoardList");
		
		return mav;
	}
	
}
