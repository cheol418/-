package admin.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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

@Controller
public class BoardReplyController {

	private final String command = "boardReply.ad";
	private final String getPage = "boardReplyForm";
	private final String gotoPage = "redirect:/boardList.ad";

	@Autowired
	private BoardDao bdao;
	@Autowired 
	ServletContext servletContext;

	@RequestMapping(value = command, method = RequestMethod.GET)
	public ModelAndView doAction(@RequestParam(value = "pageNumber") int pageNumber,
			BoardBean bean, ModelAndView mav) {

		System.out.println("bean.cate:" + bean.getCategory());
		System.out.println("ref:" + bean.getRef());
		System.out.println("relevel:" + bean.getRelevel());
		System.out.println("restep" + bean.getRestep());
		// System.out.println("cate:"+category);

		mav.addObject("bean", bean);
		mav.addObject("pageNumber", pageNumber);
		// mav.addObject("category",category);
		mav.setViewName(getPage);
		return mav;
	}

	
	 @RequestMapping(value = command, method = RequestMethod.POST) public
	 ModelAndView doAction(@RequestParam(value = "pageNumber") int pageNumber,
	 ModelAndView mav,HttpServletResponse response, HttpServletRequest request,
	 @Valid BoardBean bean,BindingResult result){
	  
	 if(result.hasErrors()) { 
		 System.out.println("유효성 검사 오류입니다.");
		 mav.addObject("pageNumber",pageNumber);
		 mav.setViewName(getPage);
		 
	 }else {
		 String uploadPath = servletContext.getRealPath("/resources/board");
		
		 bdao.writeReplyBoard(bean);
		 MultipartFile multi =  bean.getUpload();

		File destination = new File(uploadPath+"\\"+bean.getImage()); // uploadPath가 화일경로 문자가 아닌 실제 폴더가 된다.

		try {
				multi.transferTo(destination);

		} catch (IllegalStateException e) {
				e.printStackTrace();
		} catch (IOException e) {
				e.printStackTrace();
		}
		 	mav.addObject("pageNumber",pageNumber);
			mav.setViewName(gotoPage);
	
	 }

	 return mav;
	 
	 }

}
