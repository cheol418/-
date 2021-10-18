package admin.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import admin.model.BoardBean;
import admin.model.BoardDao;
import admin.model.MemberBean;
import admin.model.MemberDao;

@Controller
public class BoardDeleteController {

	@Autowired
	private BoardDao bdao;
	@Autowired 
	ServletContext servletContext; //웹서버 프로젝트 경로 접근하기 위해 사용

	private final String command = "boardDelete.ad";
	private final String gotoPage = "redirect:boardList.ad";

	@RequestMapping(value=command,method = RequestMethod.GET)
	public ModelAndView insertForm(
			ModelAndView mav,
			@RequestParam("num") int num,
			@RequestParam("pageNumber") int pageNumber,
			HttpServletRequest request) {

		String deletePath = servletContext.getRealPath("/resources/board"); 
		File delFile = new File(deletePath+"\\"+bdao.getBoard(num).getImage()); 
		delFile.delete(); //파일 삭제

		int cnt=-1;
		cnt=bdao.deleteBoard(num);
		
		if(cnt!=-1) {
			System.out.println("회원삭제성공");
			
		}else {
			System.out.println("회원삭제실패");
			
		}
		
		mav.addObject("pageNumber",pageNumber);
		mav.setViewName(gotoPage);
		return mav;

	}

	
	
}//class
