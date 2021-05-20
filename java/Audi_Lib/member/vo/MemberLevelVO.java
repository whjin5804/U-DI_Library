package Audi_Lib.member.vo;

public class MemberLevelVO {
	private int memberLevel;
	private int availableRentDate;
	private String levelName;
	private int availableRentBookNumber;
	
	public int getAvailableRentBookNumber() {
		return availableRentBookNumber;
	}
	public void setAvailableRentBookNumber(int availableRentBookNumber) {
		this.availableRentBookNumber = availableRentBookNumber;
	}
	public int getMemberLevel() {
		return memberLevel;
	}
	public void setMemberLevel(int memberLevel) {
		this.memberLevel = memberLevel;
	}
	public int getAvailableRentDate() {
		return availableRentDate;
	}
	public void setAvailableRentDate(int availableRentDate) {
		this.availableRentDate = availableRentDate;
	}
	public String getLevelName() {
		return levelName;
	}
	public void setLevelName(String levelName) {
		this.levelName = levelName;
	}
	
	
}

