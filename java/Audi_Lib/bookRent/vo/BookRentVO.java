package Audi_Lib.bookRent.vo;

import java.sql.Date;

public class BookRentVO {
	private String rentCode;
	private String rentMember;
	private String rentBookCode;
	private Date rentDate;
	private Date returnDate;
	private String isReturn;
	private int lateDay;
	
	
	public String getRentCode() {
		return rentCode;
	}
	public void setRentCode(String rentCode) {
		this.rentCode = rentCode;
	}
	public String getRentMember() {
		return rentMember;
	}
	public void setRentMember(String rentMember) {
		this.rentMember = rentMember;
	}
	public String getRentBookCode() {
		return rentBookCode;
	}
	public void setRentBookCode(String rentBookCode) {
		this.rentBookCode = rentBookCode;
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
	public int getLateDay() {
		return lateDay;
	}
	public void setLateDay(int lateDay) {
		this.lateDay = lateDay;
	}
	
	
}
