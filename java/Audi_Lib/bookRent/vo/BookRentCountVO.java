package Audi_Lib.bookRent.vo;

public class BookRentCountVO {
	private String bookCode;
	private int rentCountInMonth;
	private int rentCountTotal;
	
	public String getBookCode() {
		return bookCode;
	}
	public void setBookCode(String bookCode) {
		this.bookCode = bookCode;
	}
	public int getRentCountInMonth() {
		return rentCountInMonth;
	}
	public void setRentCountInMonth(int rentCountInMonth) {
		this.rentCountInMonth = rentCountInMonth;
	}
	public int getRentCountTotal() {
		return rentCountTotal;
	}
	public void setRentCountTotal(int rentCountTotal) {
		this.rentCountTotal = rentCountTotal;
	}
	
	
}
