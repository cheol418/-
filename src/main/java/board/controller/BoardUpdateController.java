package board.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
	public ModelAndView doAction(@RequestParam(value = "pageNumber") int pageNumber,
			@RequestParam(value = "num") int num,
			ModelAndView mav) {
		BoardBean board = bDao.getBoardData(num);
		mav.addObject("board",board);
		mav.addObject("pageNumber",pageNumber);
		mav.setViewName("boardUpdateForm");
		return mav;
	}

	@RequestMapping(value = command,method = RequestMethod.POST)
	public ModelAndView doAction(@RequestParam(value = "pageNumber") int pageNumber, 
			@RequestParam(value = "category") String category,			
			ModelAndView mav,
			HttpServletResponse response, HttpServletRequest request,
			@ModelAttribute("board") @Valid BoardBean bean,BindingResult result) throws IOException {

		
		
		String uploadPath = servletContext.getRealPath("/resources");
		
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
