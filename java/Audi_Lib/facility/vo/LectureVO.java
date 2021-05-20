package Audi_Lib.facility.vo;

import java.sql.Date;
import java.sql.Timestamp;

public class LectureVO {

	private String lectureCode;
	private String lectureName;
	private Timestamp lectureDate;
	private Date lectureDate1;
	private int lectureTime;
	private String lecturer;
	private int lectureState;
	private String lecturePlace;
	private String facilityCode;
	private String startDate;
	private String endDate;
	private String searchName;
	private String studyRoomName;
	private int seq;
	private int rownum;
	
	
	
	public String getStudyRoomName() {
		return studyRoomName;
	}
	public void setStudyRoomName(String studyRoomName) {
		this.studyRoomName = studyRoomName;
	}
	public Date getLectureDate1() {
		return lectureDate1;
	}
	public void setLectureDate1(Date lectureDate1) {
		this.lectureDate1 = lectureDate1;
	}
	public int getRownum() {
		return rownum;
	}
	public void setRownum(int rownum) {
		this.rownum = rownum;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getSearchName() {
		return searchName;
	}
	public void setSearchName(String searchName) {
		this.searchName = searchName;
	}
	public String getLectureCode() {
		return lectureCode;
	}
	public void setLectureCode(String lectureCode) {
		this.lectureCode = lectureCode;
	}
	public String getLectureName() {
		return lectureName;
	}
	public void setLectureName(String lectureName) {
		this.lectureName = lectureName;
	}
	public Timestamp getLectureDate() {
		return lectureDate;
	}
	public void setLectureDate(Timestamp lectureDate) {
		this.lectureDate = lectureDate;
	}
	public int getLectureTime() {
		return lectureTime;
	}
	public void setLectureTime(int lectureTime) {
		this.lectureTime = lectureTime;
	}
	public String getLecturer() {
		return lecturer;
	}
	public void setLecturer(String lecturer) {
		this.lecturer = lecturer;
	}
	public int getLectureState() {
		return lectureState;
	}
	public void setLectureState(int lectureState) {
		this.lectureState = lectureState;
	}
	public String getLecturePlace() {
		return lecturePlace;
	}
	public void setLecturePlace(String lecturePlace) {
		this.lecturePlace = lecturePlace;
	}
	public String getFacilityCode() {
		return facilityCode;
	}
	public void setFacilityCode(String facilityCode) {
		this.facilityCode = facilityCode;
	}
	
	
	
	
}
