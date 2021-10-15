package user.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import user.model.UserDao;
import user.model.UserVo;

@Controller
public class UserFindController {
	final String command = "/find.ur";
	final String idFind = "/idFind.ur";
	final String passwdFind = "/passwdFind.ur";
	final String getPage = "find";
	final String gotoPage = "redirect:/login.ur";
	
	@Autowired
	private UserDao uDao;
	
	@RequestMapping(value = command,method = RequestMethod.GET)
	public ModelAndView doAction(ModelAndView mav){
		
		mav.setViewName(getPage);
		return mav;
	}

	@RequestMapping(value = idFind)
	@ResponseBody
	public String idFind(@RequestParam(value = "name") String name,
						@RequestParam(value = "email") String email) {
		String result = "";
		Map<String,String> map = new HashMap<String,String>();
		
		if(name == ""||email == "") {
			result = "empty";
			return result;
		}
		
		map.put("name", name);
		map.put("email", email);
		
		UserVo uVo = uDao.findUserId(map);
		
		if(uVo != null) {
			String id = uVo.getId();
			int idSize = id.length();
			if(idSize > 8) {
				result = id.substring(0,idSize-4)+"****";
			}else {
				result = id.substring(0,idSize-3)+"***";
			}
		}
		
		return result;
	}
	
	@RequestMapping(value = passwdFind)
	@ResponseBody
	public String passwdFind(@RequestParam(value = "id") String id,
							@RequestParam(value = "name") String name,
							@RequestParam(value = "email") String email) {
		String result = "";
		Map<String,String> map = new HashMap<String,String>();
		
		if(name == ""||email == ""||id == "") {
			result = "empty";
			return result;
		}
		
		map.put("id", id);
		map.put("name", name);
		map.put("email", email);
		
		UserVo uVo = uDao.findUserPasswd(map);
		
		if(uVo != null) {
			String passwd = uVo.getPasswd();
			int passwdSize = passwd.length();
			if(passwdSize > 10) {
				result = passwd.substring(0,passwdSize-4)+"****";
			}else {
				result = passwd.substring(0,passwdSize-3)+"***";
			}
		}
		
		return result;
	}
}
