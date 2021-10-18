package admin.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import admin.model.MemberBean;
import admin.model.MemberDao;

@Controller
public class MemberUpdateController {
	
	@Autowired
	private MemberDao mdao;
	@Autowired //객체주입
	ServletContext servletContext;
	
	private final String command = "memberUpdate.ad";
	private final String getPage = "memberUpdateForm";
	private final String gotoPage = "redirect:memberList.ad";
	
	@RequestMapping(value=command,method = RequestMethod.GET)
	public ModelAndView updateForm(
			ModelAndView mav,
			@RequestParam("num") int num,
			@RequestParam("pageNumber") int pageNumber,
			HttpServletRequest request) {
				
		
		MemberBean bean = mdao.getMember(num);
		
		mav.addObject("pageNumber", pageNumber);
		mav.addObject("bean", bean);
		mav.setViewName(getPage);
		
		return mav;
		
	}
	
	@RequestMapping(value=command,method = RequestMethod.POST)
	public @ResponseBody ModelAndView updateMember(ModelAndView mav,
			@RequestParam(value = "pageNumber") String pageNumber,
			@ModelAttribute("bean") @Valid MemberBean bean ,BindingResult result) {
		
		if(result.hasErrors()) {
			System.out.println("유효성 검사 오류입니다.");
			
			mav.setViewName(getPage);
		}
		else {
			int cnt = -1;
			cnt = mdao.updateMember(bean);
			
			if(cnt != -1) {
				
				String dataPath =  servletContext.getRealPath("/resources/member"); 
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

				mav.setViewName(gotoPage);
				
			}
			else {
				mav.setViewName(getPage);
			}
			
		}
		
		mav.addObject("pageNumber", pageNumber);
		return mav;
	}


	
}
