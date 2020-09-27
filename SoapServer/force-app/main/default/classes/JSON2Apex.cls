public class JSON2Apex {
    
    public String accountId;
	public String sensorid;
	public List<Integer> line;

	
	public static JSON2Apex parse(String json) {
		return (JSON2Apex) System.JSON.deserialize(json, JSON2Apex.class);
       
	}


}