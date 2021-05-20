package Audi_Lib.bookRent.vo;

import java.sql.Date;

public class BookRentViewVO {

	private String bookCode;
	private String bookTitle;
	private String publisher;
	private String author;
	private int bookPublicationDate;
	private Date acquisitionDate;
	private String bookImageName;
	private int bookClass;
	private String bookClassName;
	private String rentCode;
	private Date rentDate;
	private Date returnDate;
	private String isReturn;
	private String rentMember;
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
	public String getRentCode() {
		return rentCode;
	}
	public void setRentCode(String rentCode) {
		this.rentCode = rentCode;
	}
	public Date getRentDate() {
		return rentDate;
	}
	public void setRentDate(Date rentDate) {
		this.rentDate = rentDate;
	}
	public Date getReturnDate() {
		return returnDate;
	}
	public void setReturnDate(Date returnDate) {
		this.returnDate = returnDate;
	}
	public String getIsReturn() {
		return isReturn;
	}
	public void setIsReturn(String isReturn) {
		this.isReturn = isReturn;
	}
	public String getRentMember() {
		return rentMember;
	}
	public void setRentMember(String rentMember) {
		this.rentMember = rentMember;
	}
	
	
}
