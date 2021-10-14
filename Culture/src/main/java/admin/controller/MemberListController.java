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

import admin.model.MemberBean;
import admin.model.MemberDao;
import utility.Paging;


@Controller
public class MemberListController {
	
	@Autowired
	private MemberDao mdao;
	
	private final String command = "/memberList.ad";
	private final String getPage = "memberList";
	
	@RequestMapping(value=command)
	public ModelAndView doAction(
			@RequestParam(value="whatColumn",required = false) String whatColumn,
			@RequestParam(value="keyword",required = false) String keyword,
			@RequestParam(value="pageNumber",required = false) String pageNumber,
			ModelAndView mav,
			HttpServletRequest request) {
		
		Map<String,String> map = new HashMap<String, String>();
		map.put("whatColumn", whatColumn); 
		map.put("keyword", "%"+keyword+"%");
		
		int totalCount = mdao.getTotalCount(map);
		String url = request.getContextPath() + command ;

		Paging pageInfo = new Paging(pageNumber,null,totalCount,url,whatColumn,keyword, null );

		List<MemberBean> lists = mdao.getMemberList(pageInfo, map);
		mav.addObject("lists", lists);
		mav.addObject("totalCount", totalCount);
		mav.addObject("pageInfo", pageInfo);
		
		mav.setViewName(getPage);
		return mav;
	}
	
}
