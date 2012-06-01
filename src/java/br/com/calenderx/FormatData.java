package br.com.calenderx;

public class FormatData {
    
    public String formatJSON(String p_data){
        String[] strDateTime = p_data.split(" ");

        String strFormat = String.format("%sT%s00+00:00", strDateTime[0], strDateTime[1]);      
        return strFormat;
    }
    
    public static String formatDateTime(String p_data, String p_time){
        String[] strDate = p_data.split("/");
        
        String strFormat = String.format("%s-%s-%s %s", strDate[2],strDate[1],strDate[0], p_time);
        return strFormat;
    }
    
    public String returnDate(String p_data){
        String[] strDateTime = p_data.split(" ");
        String[] strData = strDateTime[0].split("-");
        
        String strFormat = String.format("%s/%s/%s", strData[2],strData[1],strData[0]);     
        return strFormat;
    }
    
    public String returnTime(String p_data){
        String[] strDateTime = p_data.split(" ");
        String[] strData = strDateTime[1].split(":");
        
        String strFormat = String.format("%s:%s", strData[0],strData[1]);     
        return strFormat;
    }    
    
}
