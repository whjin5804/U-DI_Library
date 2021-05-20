package Audi_Lib.util;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class DateUtil {
	public static final String PRIMARY_DATE_FORMAT = "yyyy-MM-dd";
	public static final String PRIMARY_DATE_TIME_FORMAT = "yyyy-MM-dd HH:mm:ss";
	public static final String PRIMARY_MONTH_FORMAT = "yyyy-MM";
	
	//현재날짜를 문자열로 가져오기(yyyy-mm-dd)
	public static String getNowDateToString() {
		Calendar cal = Calendar.getInstance();
		//현재 날짜 및 시간
		Date date = cal.getTime();//20210331164850
		
		//날짜의 포맷(형식)을 지정하는 클래스
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		
		return format.format(date);
	}
	//현재 날짜를 문자열로 가져오기 (포맷지정가능)
	public static String getNowDateToString(String dateFormat) {
		Calendar cal = Calendar.getInstance();
		//현재 날짜 및 시간
		Date date = cal.getTime();//20210331164850
		
		//날짜의 포맷(형식)을 지정하는 클래스
		SimpleDateFormat format = new SimpleDateFormat(dateFormat);
		
		return format.format(date);
	}
	//현재 날짜 및 시간 가져오기
	public static String getNowDateTimeToString() {
		Calendar cal = Calendar.getInstance();
		//현재 날짜 및 시간
		Date date = cal.getTime();//20210331164850
		
		//날짜의 포맷(형식)을 지정하는 클래스
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		return format.format(date);
	}
	//현재 날짜 및 시간 가져오기(포맷 지정 가능)
	public static String getNowDateTimeToString(String dateTimeFormat) {
		Calendar cal = Calendar.getInstance();
		//현재 날짜 및 시간
		Date date = cal.getTime();//20210331164850
		
		//날짜의 포맷(형식)을 지정하는 클래스
		SimpleDateFormat format = new SimpleDateFormat(dateTimeFormat);
		
		return format.format(date);
	}
	//현재 달의 1일을 문자열로 리턴하는 메소드
	public static String getNowDateFirstDayToString() {
		Calendar cal = Calendar.getInstance();
		//현재 날짜 및 시간
		Date date = cal.getTime();//20210331164850
		
		//날짜의 포맷(형식)을 지정하는 클래스
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM");
		
		return format.format(date) + "-01";
	}
	//지난 달을 문자열로 리턴하는 메소드
	public static String getLastMonthToString() {
		//현재날짜 추출
		Calendar cal = Calendar.getInstance();
		cal.add(cal.MONTH, -1);
		//현재 날짜 및 시간
		Date date = cal.getTime();//20210331164850
		
		//날짜의 포맷(형식)을 지정하는 클래스
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM");
		
		return format.format(date);
	}
}
