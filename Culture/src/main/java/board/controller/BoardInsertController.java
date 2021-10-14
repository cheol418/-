package board.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
public class BoardInsertController {
	
	
	@Autowired
	ServletContext servletContext;
	
	@Autowired
	private BoardDao bDao; 
	
	/* 나중에 회원 가입 부분 추가할 때를 대비해서 미리 넣어둠.
	@RequestMapping(value="/boardInsert.bd", method=RequestMethod.GET)
	public ModelAndView insertForm(HttpSession session, ModelAndView mav) {
		if(session.getAttribute("loginInfo")==null) {
			
			session.setAttribute("destination", "redirect:/insert.prd"); // session설정해두면 아무데서나 쓸 수 있다. 목적지 설정해둔것.
			mav.setViewName("redirect:/loginForm.me"); // insertForm.jsp
			return mav;
		}else { //loing 했었다.
			mav.setViewName(getPage);
			return mav;			
		}		
		
	}
	*/

	@RequestMapping(value = "/boardInsert.bd",method = RequestMethod.GET)
	public ModelAndView doActionGet(@RequestParam(value = "pageNumber") int pageNumber,
								@RequestParam(value = "category") String category,								
								@RequestParam(value = "writer") String writer,
								ModelAndView mav) {
		
		System.out.println("페이지넘버..."+pageNumber);
		
		mav.addObject("pageNumber",pageNumber);
		mav.addObject("fCategory",category);
		mav.setViewName("boardInsertForm");
		return mav;
	}
	
	
	@RequestMapping(value = "/boardInsert.bd",method = RequestMethod.POST)
	public ModelAndView doActionPost(@RequestParam(value = "pageNumber") int pageNumber,
								@RequestParam(value = "category") String category,
								ModelAndView mav, HttpServletRequest request,
								@ModelAttribute("board") @Valid BoardBean bean,BindingResult result) {
		
		System.out.println("getRealPath(/)"+servletContext.getRealPath("/resources"));
		// H:\000_GetTheJob\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\making_board\resources
		
		String uploadPath = servletContext.getRealPath("/resources");

		System.out.println(bean.getImage()); // 여기서 Null값이 터지는 중... 뭐지? 왜지?
		
		bean.setRegdate(new Timestamp(System.currentTimeMillis()));
		
		System.out.println("result.hasErrors():" + result.hasErrors());
		if(result.hasErrors()) {
			mav.addObject("pageNumber",pageNumber);
			mav.setViewName("boardInsertForm");
			return mav;
		}
		
		MultipartFile multi = bean.getPic();	
				
		int cnt = -1;
		cnt = bDao.insertData(bean);
				
		mav.addObject("pageNumber",pageNumber);
		mav.addObject("fCategory",category);
		//mav.setViewName("redirect:/"+category+"BoardList.bd");
		//return mav;
		
		if(cnt != -1) { // 삽입성공
			System.out.println("going to: "+category+"BoardList.bd");
			mav.setViewName("redirect:/"+category+"BoardList.bd"); 
			
			File destination = new File(uploadPath+"\\"+bean.getImage());
			
			try {
				multi.transferTo(destination);
				
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			return mav;
		}
		else {
			mav.setViewName("boardInsertForm");
			return mav;
			
		}
	}
}
