package net.deepdragon.util;

import java.io.Serializable;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class OrderGenerator {
	
	public static final OrderGenerator DEFAULT = new OrderGenerator();
			
	public Serializable generate() {
		
		StringBuffer buffer=new StringBuffer();
		
		DateFormat df=new SimpleDateFormat("yyMMdd-HH:mm:ss-SSS"); 
		String dateString=df.format(new Date());
		String[] template=dateString.split("-");
		buffer.append(template[0]);
		String[] second=template[1].split(":");
		buffer.append(Integer.parseInt(second[0])*60*60+Integer.parseInt(second[1])*60+Integer.parseInt(second[2]));
		String nanoTime=String.valueOf(System.nanoTime());
		buffer.append(nanoTime.substring(nanoTime.length()-6,nanoTime.length()));
		
		return buffer;
	}
	
	public static final String generator() {
		return String.valueOf(OrderGenerator.DEFAULT.generate()).substring(1);
	}


	public static void main(final String[] args) {
	}
}
