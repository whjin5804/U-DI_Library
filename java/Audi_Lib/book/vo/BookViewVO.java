package Audi_Lib.book.vo;

import java.sql.Date;
import java.util.List;

public class BookViewVO {
	private String bookCode;
	private String bookTitle;
	private String publisher;
	private String author;
	private int bookPublicationDate;
	private Date acquisitionDate;
	private String bookPreview;
	private String bookImageName;
	private int bookClass;
	private String bookClassName;
	private int bookClassRentCount;
	private String isAvailable;
	//검색을 위한 변수 keyword 와 condition / 세터 게터
	private String keyword;
	private String condition;
	
	
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getCondition() {
		return condition;
	}
	public void setCondition(String condition) {
		this.condition = condition;
	}
	//카테고리별 정리를 위해 만든 list변수와 세터 게터
	private List<BookViewVO> bookInfoList;
	
	public List<BookViewVO> getBookInfoList() {
		return bookInfoList;
	}
	public void setBookInfoList(List<BookViewVO> bookInfoList) {
		this.bookInfoList = bookInfoList;
	}
	//----------------------------------------
	//통합 검색의 페이징을 위한 변수와 세터 게터
	private int start;
	private int end;
	
	
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}
	//-----------------------------------------
	public String getBookCode() {
		return bookCode;
	}
	public void setBookCode(String bookCode) {
		this.bookCode = bookCode;
	}
	public String getBookTitle() {
		return bookTitle;
	}
	public void setBookTitle(String bookTitle) {
		this.bookTitle = bookTitle;
	}
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public int getBookPublicationDate() {
		return bookPublicationDate;
	}
	public void setBookPublicationDate(int bookPublicationDate) {
		this.bookPublicationDate = bookPublicationDate;
	}
	public Date getAcquisitionDate() {
		return acquisitionDate;
	}
	public void setAcquisitionDate(Date acquisitionDate) {
		this.acquisitionDate = acquisitionDate;
	}
	public String getBookPreview() {
		return bookPreview;
	}
	public void setBookPreview(String bookPreview) {
		this.bookPreview = bookPreview;
	}
	public String getBookImageName() {
		return bookImageName;
	}
	public void setBookImageName(String bookImageName) {
		this.bookImageName = bookImageName;
	}
	public int getBookClass() {
		return bookClass;
	}
	public void setBookClass(int bookClass) {
		this.bookClass = bookClass;
	}
	public String getBookClassName() {
		return bookClassName;
	}
	public void setBookClassName(String bookClassName) {
		this.bookClassName = bookClassName;
	}
	public int getBookClassRentCount() {
		return bookClassRentCount;
	}
	public void setBookClassRentCount(int bookClassRentCount) {
		this.bookClassRentCount = bookClassRentCount;
	}
	public String getIsAvailable() {
		return isAvailable;
	}
	public void setIsAvailable(String isAvailable) {
		this.isAvailable = isAvailable;
	}
	
	
}
