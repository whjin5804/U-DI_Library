package Audi_Lib.board.vo;

public class BoardVO {
	private String boardCode;
	private String boardTitle;
	private String boardContent;
	private String regMember;
	private String regDate;
	private int isSecurity;
	private int isNotice;
	private String fileName;
	private int readCnt;
	private int seq;
	private int rn;
	private String memberName;
	private String searchName;
	private String isAdmin;
	
	

	public String getIsAdmin() {
		return isAdmin;
	}
	public void setIsAdmin(String isAdmin) {
		this.isAdmin = isAdmin;
	}
	public int getIsNotice() {
		return isNotice;
	}
	public void setIsNotice(int isNotice) {
		this.isNotice = isNotice;
	}
	public String getSearchName() {
		return searchName;
	}
	public void setSearchName(String searchName) {
		this.searchName = searchName;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public int getReadCnt() {
		return readCnt;
	}
	public void setReadCnt(int readCnt) {
		this.readCnt = readCnt;
	}
	public int getRn() {
		return rn;
	}
	public void setRn(int rn) {
		this.rn = rn;
	}
	public String getBoardCode() {
		return boardCode;
	}
	public void setBoardCode(String boardCode) {
		this.boardCode = boardCode;
	}
	public String getBoardTitle() {
		return boardTitle;
	}
	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}
	public String getBoardContent() {
		return boardContent;
	}
	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}
	public String getRegMember() {
		return regMember;
	}
	public void setRegMember(String regMember) {
		this.regMember = regMember;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public int getIsSecurity() {
		return isSecurity;
	}
	public void setIsSecurity(int isSecurity) {
		this.isSecurity = isSecurity;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	
	
	
}
