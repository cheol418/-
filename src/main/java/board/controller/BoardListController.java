package board.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
		
		int totalCount = bDao.getNoticeTotalCount(map);
		String url = request.getContextPath()+"/noticeBoardList.bd";
		String CT = null;
		if(url.contains("notice")) {
			CT = "notice";
		}else if (url.contains("qna")) {
			CT= "qna";
		}else if (url.contains("free")) {
			CT="free";
		}else {
			CT="ERROR";
		}
		
				
		Paging pageInfo = new Paging(pageNumber,null,totalCount,url,whatColumn,keyword,null); 
		
		List<BoardBean> boardLists = bDao.getNoticeBoardList(pageInfo,map);		
		mav.addObject("boardLists",boardLists);
		mav.addObject("pageInfo",pageInfo);
		mav.addObject("CT", CT);
		mav.setViewName("noticeBoardList");
		
		return mav;
	}
	
	@RequestMapping(value= "/qnaBoardList.bd")
	public ModelAndView doActionQna(@RequestParam(value="whatColumn",required=false) String whatColumn,
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
		
		int totalCount = bDao.getQnaTotalCount(map);
		String url = request.getContextPath()+"/qnaBoardList.bd";
		String CT = null;
		if(url.contains("notice")) {
			CT = "notice";
		}else if (url.contains("qna")) {
			CT= "qna";
		}else if (url.contains("free")) {
			CT="free";
		}else {
			CT="ERROR";
		}
		
				
		Paging pageInfo = new Paging(pageNumber,null,totalCount,url,whatColumn,keyword,null); 
		
		List<BoardBean> boardLists = bDao.getQnaBoardList(pageInfo,map);		
		mav.addObject("boardLists",boardLists);
		mav.addObject("pageInfo",pageInfo);
		mav.addObject("CT", CT);
		mav.setViewName("qnaBoardList");
		
		return mav;
	}
	
	@RequestMapping(value= "/freeBoardList.bd")
	public ModelAndView doActionFree(@RequestParam(value="whatColumn",required=false) String whatColumn,
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
		
		int totalCount = bDao.getFreeTotalCount(map);
		String url = request.getContextPath()+"/freeBoardList.bd";
		String CT = null;
		if(url.contains("notice")) {
			CT = "notice";
		}else if (url.contains("qna")) {
			CT= "qna";
		}else if (url.contains("free")) {
			CT="free";
		}else {
			CT="ERROR";
		}
		
				
		Paging pageInfo = new Paging(pageNumber,null,totalCount,url,whatColumn,keyword,null); 
		
		List<BoardBean> boardLists = bDao.getFreeBoardList(pageInfo,map);		
		mav.addObject("boardLists",boardLists);
		mav.addObject("pageInfo",pageInfo);
		mav.addObject("CT", CT);
		mav.setViewName("freeBoardList");
		
		return mav;
	}
	
	
	@RequestMapping(value= "/totalBoardList.bd")
	public ModelAndView doActionTotal(@RequestParam(value="whatColumn",required=false) String whatColumn,
									@RequestParam(value="keyword",required=false) String keyword,
									@RequestParam(value="pageNumber",required=false) String pageNumber,
									ModelAndView mav, Model model, HttpServletRequest request) {
	
		System.out.println("여기 오긴 오냐, BdListCont");		
		System.out.println("여기 오긴 오냐, what  " + whatColumn);		
		System.out.println("여기 오긴 오냐, key  " + keyword);		
		System.out.println("여기 오긴 오냐, pageNum  " + pageNumber);		
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("keyword", keyword);
		map.put("whatColumn", whatColumn);
		
		int totalCount = bDao.getTotalCount(map);
		String url = request.getContextPath()+"/totalBoardList.bd";
		
		Paging pageInfo = new Paging(pageNumber,null,totalCount,url,whatColumn,keyword,null); 
		
		List<BoardBean> boardLists = bDao.getTotalBoardList(pageInfo,map);		
		mav.addObject("boardLists",boardLists);
		mav.addObject("pageInfo",pageInfo);
		mav.setViewName("totalBoardList");
		
		return mav;
	}
	
}
