package concert.controller;

import java.io.IOException;
import java.lang.reflect.Type;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.json.XML;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

@Controller
public class ConcertMainController {
	final String command = "/main.do";
	final String getPage = "main";
	
	@RequestMapping(value = command)
	public ModelAndView doAction(ModelAndView mav,
			HttpSession session) throws JsonParseException, JsonMappingException, IOException {
		ConcertApi api = new ConcertApi();
		List<Map<String,Object>> concertList = api.getCultureList(1,5);
		session.setAttribute("concertList", concertList);
		mav.addObject("concertList", concertList);
		mav.setViewName(getPage);
		return mav;
	}
}
