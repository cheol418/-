package board.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import board.model.BoardBean;
import board.model.BoardDao;
import user.model.UserVo;

@Controller
public class BoardUpdateController {
	private final String command = "/boardUpdate.bd";
	private final String getPage = "boardUpdateForm";
	private final String gotoPage = "redirect:/boardList.bd";

	@Autowired
	private BoardDao bDao; 

	@Autowired
	ServletContext servletContext;

	@RequestMapping(value = "/boardUpdate.bd",method = RequestMethod.GET)
	public ModelAndView doAction(
			@RequestParam(value = "wid") String wid,			
			@RequestParam(value = "pageNumber") int pageNumber,
			@RequestParam(value = "num") int num,
			HttpSession session,
			HttpServletResponse response,
			HttpServletRequest request,
			ModelAndView mav)throws Exception {
		
		System.out.println("야발!");
		
		if(session.getAttribute("loginInfo")==null) {
			session.setAttribute("destination", "/boardInsert.bd"); // session설정해두면 아무데서나 쓸 수 있다. 목적지 설정해둔것.			
			mav.setViewName("redirect:/login.ur"); // login.ur
			return mav;
		}//login null
		else {
			BoardBean board = bDao.getBoardData(num);
			UserVo uVo =  (UserVo)session.getAttribute("loginInfo");
			System.out.println("와우"+uVo);
			System.out.println(wid + "   " + uVo.getId());
			String pid = wid;
			System.out.println(pid + "   " + uVo.getId() + "   " + board.getWriter());
			
			if(wid == uVo.getId()){
				System.out.println("제발 좀");				
			}else {
				System.out.println("족 같네");				
			}
			mav.addObject("wid",wid);
			mav.addObject("uVoID",uVo.getId());
			mav.addObject("board",board);
			mav.addObject("pageNumber",pageNumber);
			mav.setViewName("boardUpdateForm");
			return mav;
			/*
			if(pid == uid) {
				
				System.out.println("헐랭");
				
				m
				return mav;
			}// wid == uVo.getId
			else {
				System.out.println("헐랭2");
				//mav.setViewName("redirect:/login.ur"); // login.ur
				return mav;
			}// wid == uVo.getId else
			*/			
		}//login null else
		
	}//doAction
	
		
		
		
		
	

	@RequestMapping(value = command,method = RequestMethod.POST)
	public ModelAndView doAction(@RequestParam(value = "pageNumber") int pageNumber, 
			@RequestParam(value = "category") String category,			
			ModelAndView mav,
			HttpServletResponse response, HttpServletRequest request,
			@ModelAttribute("board") @Valid BoardBean bean,BindingResult result) throws IOException {

		
		
		String uploadPath = servletContext.getRealPath("/resources/images");
		
		if(result.hasErrors()) {
			mav.addObject("pageNumber",pageNumber);
			mav.setViewName("boardUpdateForm");
			return mav;
		}
		else {
			bean.setRegdate(new Timestamp(System.currentTimeMillis()));
			int cnt= -1;
			cnt = bDao.updateBoard(bean);
			if(cnt != -1  ) {
							
				MultipartFile multi = bean.getPic();	
				System.out.println("multi: " + multi);

				//String del = bean.getPic_del();
				//System.out.println("del is: " + del);
				File destination = new File(uploadPath+"\\"+bean.getImage());
				File delFile = new File(uploadPath+"\\"+bean.getPic_old());
				
				
				System.out.println("destinaion: " + destination );				
				System.out.println("delFile: " + delFile);
				
				if(destination != delFile) {
					delFile.delete();
					try {
						multi.transferTo(destination);						
					} catch (IllegalStateException e) {
						e.printStackTrace();
					} catch (IOException e) {
						e.printStackTrace();
					}
				}

				mav.addObject("pageNumber",pageNumber);
				mav.addObject("category",category);
				mav.setViewName("redirect:/"+category+"BoardList.bd");
			}
		}
		return mav;
	}
}
