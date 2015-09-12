package com.searchmytraining.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;


public class SendSMSUtility {

	
    public static int SmsSending(String ContactNumber, String Msg) {
   

        //Your authentication key
       String authkey = "57229Ac266mMN0yF552cd8aa";
      
        //Multiple mobiles numbers seperated by comma
        String mobiles = ContactNumber;
        //Sender ID,While using route4 sender id should be 6 characters long.
        String senderId = "CASRPA";// for CAPARKALE
        String message = Msg;
        //define route
        String route = "route-4";
        URLConnection myURLConnection = null;
        URL myURL = null;
        BufferedReader reader = null;
//encoding message 
        @SuppressWarnings("deprecation")
		String encoded_message = URLEncoder.encode(message);

//Send SMS API
        String mainUrl = "http://t.cloudtechnoindia.com/sendhttp.php?";

//Prepare parameter string 
        StringBuilder sbPostData = new StringBuilder(mainUrl);
        sbPostData.append("authkey=" + authkey);
        sbPostData.append("&mobiles=" + mobiles);
        sbPostData.append("&message=" + encoded_message);
        sbPostData.append("&route=" + route);
        sbPostData.append("&sender=" + senderId);

//final string
        mainUrl = sbPostData.toString();
        
        try {
        	
            myURL = new URL(mainUrl);
            myURLConnection = myURL.openConnection();
            myURLConnection.connect();
            reader = new BufferedReader(new InputStreamReader(myURLConnection.getInputStream()));
            //reading response
            String response;
            while ((response = reader.readLine()) != null) //print response 
            {
            	System.out.println(response);
            }
            reader.close();
        } catch (IOException e) {
        	e.printStackTrace();
        }
        return 0;
        }

    public static void main(String[] args) {
    	/*String msg = "Lonkar wasti,%0ANear shree krushna lawns";*/
    	String msg1 = "hi Ninad%0Ahello%0Dhi";
        SendSMSUtility.SmsSending("+918007941691", msg1);
//        %0D%0A For New Line
    }
}

