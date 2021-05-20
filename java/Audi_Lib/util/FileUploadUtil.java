package Audi_Lib.util;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Iterator;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public class FileUploadUtil {
	//현재의 날짜 및 시간을 문자열로 리턴
	public static String getNowDateTime() {
		String nowDateTime = "";
		Calendar cal = Calendar.getInstance();
		nowDateTime += cal.get(Calendar.YEAR);
		nowDateTime += String.format("%02d", cal.get(Calendar.MONTH)+1);
		nowDateTime += String.format("%02d", cal.get(Calendar.DATE));
		nowDateTime += String.format("%02d", cal.get(Calendar.HOUR_OF_DAY));
		nowDateTime += String.format("%02d", cal.get(Calendar.MINUTE));
		nowDateTime += String.format("%02d", cal.get(Calendar.SECOND));
		nowDateTime += String.format("%03d", cal.get(Calendar.MILLISECOND));
		return nowDateTime;
	}
	
	//파일 첨부 사전 준비 코드(첨부될 파일명을 리스트 형태로 리턴)
	public static List<String> prepareFileUpload(MultipartHttpServletRequest multi) {
		
		//input 태그중 타입이file인 태그의 name 속성을 가져 온다.
		Iterator<String> files = multi.getFileNames();
		
		//첨부될 파일명이 들어갈 객체
		List<String> list = new ArrayList<>();
		
		//files에 데이터가 있는 만큼 반복
		while(files.hasNext()) {
			//input 태그의 name속성
			String inputTagName = files.next();
			
			MultipartFile file = multi.getFile(inputTagName);
			String fileName = "";
		
			fileName = getNowDateTime() + "_" + file.getOriginalFilename();
			
			//생성된 파일명을 리스트에 저장
			list.add(fileName);
		}
		
		return list;
	}
	
	//파일 업로드 기능 수행
	public static void flieUpload(MultipartHttpServletRequest multi, List<String> fileNameList) {
		//input 태그중 타입이file인 태그의 name 속성을 가져 온다.
		Iterator<String> files = multi.getFileNames();
		//저장 경로 지정
		String path = "D:\\workspaceSTS\\Audi_Lib\\src\\main\\webapp\\resources\\image\\";
		
		int index = 0;
		//files에 데이터가 있는 만큼 반복
		while(files.hasNext()) {
			//input 태그의 name속성
			String inputTagName = files.next();
			
			MultipartFile file = multi.getFile(inputTagName);
			String fileName = "";
		
			fileName = fileNameList.get(index++);
			
			try {
				file.transferTo(new File(path + fileName));
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	//단일 파일 첨부를 위한 사전 준비 - file이름을 생성한다
	public static String prepareOneFileUpload(MultipartHttpServletRequest multi) {
		MultipartFile mf = multi.getFile("bookImageFile");
		
		String originFileName = mf.getOriginalFilename(); //원본 파일 이름
		
		String fileName = "";
		if(originFileName != null && !originFileName.equals("")) {
			fileName = getNowDateTime() + "_" + originFileName;
		}
		else {
			fileName = "no_image.jpg";
		}
		
		return fileName;
	}
	
	//단일 파일 업로드 수행
	public static void oneFileUpload(MultipartHttpServletRequest multi, String fileName) {
		MultipartFile mf = multi.getFile("bookImageFile");
		
		String path = "D:\\workspaceSTS\\Audi_Lib\\src\\main\\webapp\\resources\\image\\book\\";
		
		try {
			mf.transferTo(new File(path + fileName));
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
