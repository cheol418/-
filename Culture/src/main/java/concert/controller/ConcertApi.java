package concert.controller;

import java.lang.reflect.Type;
import java.util.List;
import java.util.Map;

import org.json.JSONArray;
import org.json.JSONObject;
import org.json.XML;
import org.springframework.web.client.RestTemplate;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

public class ConcertApi {
	// openApi 주소 : http://data.seoul.go.kr/dataList/OA-2269/S/1/datasetView.do 
	// http://openapi.seoul.go.kr:8088/757762615a746f6539337672695949/xml/ListPublicReservationCulture/1/5
	RestTemplate restT = new RestTemplate();
	
	final String apiUrl = "http://openapi.seoul.go.kr:8088/";
	final String key = "757762615a746f6539337672695949/";
	final String type = "ListPublicReservationCulture/";
	String fullApiUrl = apiUrl+key+"xml/"+type;
	
	//�Һз��� ������
	public List<Map<String,Object>> getCultureList(int first,int last) {
		Object xml = restT.getForObject(fullApiUrl+first+"/"+last, String.class);
		List<Map<String,Object>> concertList = null;
		String xmlStr = xml.toString();
		
		// xml to json
		JSONObject jObj = XML.toJSONObject(xmlStr);
		JSONArray jsonarr = null;
		try {
			jsonarr = jObj.getJSONObject("ListPublicReservationCulture").getJSONArray("row");
		}catch (Exception e) {
			return concertList;
		}
		Gson gson = new Gson();
		
		Type listType = new TypeToken<List<Map<String,Object>>>(){}.getType();
		concertList = gson.fromJson(jsonarr.toString(), listType);
		return concertList;
	}
	
	//�Һз��� ����
	public List<Map<String,Object>> getCultureList(int first,int last,String sub) {
		Object xml = restT.getForObject(fullApiUrl+first+"/"+last+"/"+sub, String.class);
		List<Map<String,Object>> concertList = null;
		String xmlStr = xml.toString();
		
		// xml to json
		JSONObject jObj = XML.toJSONObject(xmlStr);
		JSONArray jsonarr = null;
		try {
			jsonarr = jObj.getJSONObject("ListPublicReservationCulture").getJSONArray("row");
		}catch (Exception e) {
			return concertList;
		}
		
		Gson gson = new Gson();
		
		Type listType = new TypeToken<List<Map<String,Object>>>(){}.getType();
		concertList = gson.fromJson(jsonarr.toString(), listType);
		return concertList;
	}

}
