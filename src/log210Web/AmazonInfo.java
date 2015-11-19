package log210Web;

import java.util.HashMap;
import java.util.Map;

public class AmazonInfo {
	
	private String code = "";
	private String type = "";
	private String asin = "";

	public AmazonInfo(){}
	
	public AmazonInfo(String code, String type){
		this.code = code;
		this.type = type;
	}
	
	public AmazonInfo(String asin){
		this.asin = asin;
	}
	
	public String callForSign(){
		final Map<String, String> myMap;
	    {
	        myMap = new HashMap<String, String>();
	        myMap.put("a", "b");
	    }
	    
		SignedRequestsHelper s = new SignedRequestsHelper();
		
		return s.sign(myMap,this.code, this.type);
	}
	
	public String callForPrice(){
		final Map<String, String> myMap;
	    {
	        myMap = new HashMap<String, String>();
	        myMap.put("a", "b");
	    }
	    
		SignedRequestsHelper s = new SignedRequestsHelper();
		
		return s.signForPrice(myMap,this.asin);
	}
}
