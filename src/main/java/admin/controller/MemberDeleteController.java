package admin.controller;

import java.io.File;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import admin.model.MemberDao;

@Controller
public class MemberDeleteController {

	@Autowired
	private MemberDao mdao;

	@Autowired //객체주입
	ServletContext servletContext; //웹서버 프로젝트 경로 접근하기 위해 사용 ->자바에서 사용

	private final String command = "memberDelete.ad";
	private final String gotoPage = "redirect:memberList.ad";

	@RequestMapping(value=command)
	public ModelAndView deleteMember(
			ModelAndView mav,
			@RequestParam("num") int num,
			@RequestParam("pageNumber") int pageNumber,
			HttpServletRequest request
			) {


		String deletePath = servletContext.getRealPath("/resources/images"); 
		System.out.println("Path:"+deletePath);

		File delFile = new File(deletePath+"\\"+mdao.getMember(num).getImage()); 
		// Path가 화일경로 문자가 아닌 실제 폴더가 된다.
		delFile.delete(); //파일 삭제

		int cnt = -1; 
		cnt = mdao.deleteMember(num); //테이블 레코드 삭제
		
		if(cnt!=-1) {
			System.out.println("회원삭제성공");
			
		}else {
			System.out.println("회원삭제실패");
			
		}

		mav.addObject("pageNumber",pageNumber);
		mav.setViewName(gotoPage);
		return mav;
	}

}
