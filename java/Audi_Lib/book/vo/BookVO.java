package Audi_Lib.book.vo;

import java.sql.Date;

public class BookVO {
	private String bookCode;
	private String categoryCode;
	private String bookTitle;
	private String publisher;
	private String author;
	private int bookPublicationDate;
	private Date acquisitionDate;
	private String bookPreview;
	private String bookImageName;
	private int bookClass;
	private String isAvailable;
	
	//검색용
	private String condition;
	private String keyword;
	
	
	public String getCondition() {
		return condition;
	}
	public void setCondition(String condition) {
		this.condition = condition;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getBookCode() {
		return bookCode;
	}
	public void setBookCode(String bookCode) {
		this.bookCode = bookCode;
	}
	public String getCategoryCode() {
		return categoryCode;
	}
	public void setCategoryCode(String categoryCode) {
		this.categoryCode = categoryCode;
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
	public String getIsAvailable() {
		return isAvailable;
	}
	public void setIsAvailable(String isAvailable) {
		this.isAvailable = isAvailable;
	}
	
}
