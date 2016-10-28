package com.cisoft.utils;

import java.io.StringReader;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.DOMException;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;

import com.cisoft.model.Commodity;
import com.cisoft.model.CommoditySort;


public class Parsexml {
    //解析xml 
	public Commodity fzcommodiyt(String xmlStr){
		if(xmlStr!=null){
			Commodity commodity=new Commodity();
		  try
	        {
	            DocumentBuilderFactory factory = DocumentBuilderFactory .newInstance();
	            DocumentBuilder builder = factory.newDocumentBuilder(); 
	            Document doc = builder.parse(new InputSource(new StringReader(xmlStr)));
	            Element root = doc.getDocumentElement();
	            NodeList optionNodeList = root.getChildNodes();
	            if(optionNodeList!=null)
	            {
	                int totalNode = optionNodeList.getLength();
	                for (int i=0;i<totalNode;i++)
	                {
	                    Node optionNode = optionNodeList.item(i);
	                    
	                }
	                return commodity;
	            }
	        }
	        catch(Exception e)
	        {
	        	System.out.println(e.getMessage());
	        }
	}
		
		return null;
	}
	
	
	

}
