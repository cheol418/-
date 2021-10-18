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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import admin.model.BoardBean;
import admin.model.BoardDao;
import admin.model.MemberBean;
import admin.model.MemberDao;

@Controller
public class BoardUpdateController {

	@Autowired
	private BoardDao bdao;
	@Autowired 
	ServletContext servletContext; //웹서버 프로젝트 경로 접근하기 위해 사용

	private final String command = "boardUpdate.ad";
	private final String getPage = "boardUpdateForm";
	private final String gotoPage = "redirect:boardList.ad";

	@RequestMapping(value=command,method = RequestMethod.GET)
	public  @ResponseBody ModelAndView updateForm(
			ModelAndView mav,
			@RequestParam(value = "pageNumber") String pageNumber,
			@RequestParam("num") int num,
			HttpServletRequest request) {

		BoardBean bean = bdao.getBoard(num);
		
		mav.addObject("bean",bean);
		mav.setViewName(getPage);
		return mav;

	}

	@RequestMapping(value=command,method = RequestMethod.POST)
	public ModelAndView updateBoard(ModelAndView mav,
			@Valid BoardBean bean, BindingResult result) {
		
		String uploadPath = servletContext.getRealPath("/resources/member");
		
		if(result.hasErrors()) {
			System.out.println("유효성 검사 오류입니다.");

			mav.setViewName(getPage);

		}//유효성검사 오류
		else {
			System.out.println("유효성 검사 통과.");

			int cnt = -1;
			cnt = bdao.updateBoard(bean); 
			
			if(cnt!=-1) { 

				String dataPath =  servletContext.getRealPath("/resources/board"); 
				MultipartFile multi = bean.getUpload();

				File upFile = new File(dataPath+ File.separator + bean.getImage()); 
				File delFile = new File(dataPath+"\\"+ bean.getUpload_old());

				delFile.delete(); 
				
				try {
					multi.transferTo(upFile);
					
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
		
				System.out.println("삽입성공");
				mav.setViewName(gotoPage);
			}else { //삽입실패
				System.out.println("삽입실패");
				mav.setViewName(getPage);

			}

		}//유효성 검사 성공
		
		return mav;

	}//post
	
}//class
