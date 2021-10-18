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
public class BoardWriteController {

	@Autowired
	private BoardDao bdao;
	@Autowired 
	ServletContext servletContext; //웹서버 프로젝트 경로 접근하기 위해 사용

	private final String command = "boardWrite.ad";
	private final String getPage = "boardWriteForm";
	private final String gotoPage = "redirect:boardList.ad";

	@RequestMapping(value=command,method = RequestMethod.GET)
	public ModelAndView insertForm(
			ModelAndView mav,
			HttpServletRequest request) {

		mav.setViewName(getPage);
		return mav;

	}

	@RequestMapping(value=command,method = RequestMethod.POST)
	public ModelAndView boardWrite(ModelAndView mav,
			@Valid BoardBean bean, BindingResult result) {
		
		String uploadPath = servletContext.getRealPath("/resources/board");
		
		if(result.hasErrors()) {
			System.out.println("유효성 검사 오류입니다.");

			mav.setViewName(getPage);

		}//유효성검사 오류
		else {

			int cnt = -1;
			cnt = bdao.write(bean);
			MultipartFile multi =  bean.getUpload();

			if(cnt!=-1) { //sql삽입 성공

				File destination = new File(uploadPath+"\\"+bean.getImage()); // uploadPath가 화일경로 문자가 아닌 실제 폴더가 된다.

				try {
					multi.transferTo(destination);

				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}

				mav.setViewName(gotoPage);
			}else { //삽입실패
				mav.setViewName(getPage);
			}
		}//유효성 검사 성공
		
		return mav;

	}//post
	
}//class
