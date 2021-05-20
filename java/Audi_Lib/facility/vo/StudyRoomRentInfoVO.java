package Audi_Lib.facility.vo;

import java.util.List;

public class StudyRoomRentInfoVO {
	private String memberCode;
	private String isRent;
	private int rentStu;
	private String roomRentMember;
	private String studyRoomCode;
	private String rentDate;
	private String fullRentDate;
	private String rentTimeToString;
	List<String> rentTime;
	StudyRoomInfoVO studyRoomInfoVO;
	
	
	
	public String getFullRentDate() {
		return fullRentDate;
	}
	public void setFullRentDate(String fullRentDate) {
		this.fullRentDate = fullRentDate;
	}
	public String getRentTimeToString() {
		return rentTimeToString;
	}
	public void setRentTimeToString(String rentTimeToString) {
		this.rentTimeToString = rentTimeToString;
	}
	public List<String> getRentTime() {
		return rentTime;
	}
	public void setRentTime(List<String> rentTime) {
		this.rentTime = rentTime;
	}
	public StudyRoomInfoVO getStudyRoomInfoVO() {
		return studyRoomInfoVO;
	}
	public void setStudyRoomInfoVO(StudyRoomInfoVO studyRoomInfoVO) {
		this.studyRoomInfoVO = studyRoomInfoVO;
	}
	public String getRentDate() {
		return rentDate;
	}
	public void setRentDate(String rentDate) {
		this.rentDate = rentDate;
	}
	
	public String getMemberCode() {
		return memberCode;
	}
	public void setMemberCode(String memberCode) {
		this.memberCode = memberCode;
	}
	public String getIsRent() {
		return isRent;
	}
	public void setIsRent(String isRent) {
		this.isRent = isRent;
	}
	public int getRentStu() {
		return rentStu;
	}
	public void setRentStu(int rentStu) {
		this.rentStu = rentStu;
	}
	public String getRoomRentMember() {
		return roomRentMember;
	}
	public void setRoomRentMember(String roomRentMember) {
		this.roomRentMember = roomRentMember;
	}
	public String getStudyRoomCode() {
		return studyRoomCode;
	}
	public void setStudyRoomCode(String studyRoomCode) {
		this.studyRoomCode = studyRoomCode;
	}
	@Override
	public String toString() {
		return "StudyRoomRentInfoVO [memberCode=" + memberCode + ", isRent=" + isRent + ", rentStu=" + rentStu
				+ ", roomRentMember=" + roomRentMember + ", studyRoomCode=" + studyRoomCode + ", rentDate=" + rentDate
				+ ", rentTime=" + rentTime + ", studyRoomInfoVO=" + studyRoomInfoVO + "]";
	}
	
	
	
}
