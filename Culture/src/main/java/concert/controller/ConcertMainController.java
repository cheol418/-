package concert.controller;

import java.io.IOException;
import java.lang.reflect.Type;
import java.util.List;
import java.util.Map;

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
	// openApi аж╪р : http://data.seoul.go.kr/dataList/OA-2269/S/1/datasetView.do 
	RestTemplate restT = new RestTemplate();
	
	final String apiUrl = "http://openapi.seoul.go.kr:8088/";
	final String key = "757762615a746f6539337672695949/";
	final String type = "ListPublicReservationCulture/";
	String fullApiUrl = apiUrl+key+"xml/"+type;
	
	final String command = "/main.do";
	final String getPage = "main";
	
	@RequestMapping(value = command)
	public ModelAndView doAction(ModelAndView mav) throws JsonParseException, JsonMappingException, IOException {
		Object xml = restT.getForObject(fullApiUrl+"1/5", String.class);
		String xmlStr = xml.toString();
		
		// xml to json
		JSONObject jObj = XML.toJSONObject(xmlStr);
		JSONArray jsonarr = jObj.getJSONObject("ListPublicReservationCulture").getJSONArray("row");
		
		Gson gson = new Gson();
		
		Type listType = new TypeToken<List<Map<String,Object>>>(){}.getType();
		List<Map<String,Object>> concertList = gson.fromJson(jsonarr.toString(), listType);
		mav.addObject("concertList",concertList);
		mav.setViewName(getPage);
		return mav;
	}
}
