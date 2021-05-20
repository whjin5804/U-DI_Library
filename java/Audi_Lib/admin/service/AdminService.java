package Audi_Lib.admin.service;

import java.util.List;

import Audi_Lib.book.vo.BookVO;
import Audi_Lib.book.vo.BookViewVO;
import Audi_Lib.facility.vo.LectureVO;
import Audi_Lib.facility.vo.ParkingViewVO;
import Audi_Lib.facility.vo.StudyRoomViewVO;
import Audi_Lib.home.vo.PagingVO;
import Audi_Lib.member.vo.MemberVO;


public interface AdminService {
	//회원 목록 조회
	List<MemberVO> selectMemberList(MemberVO memberVO);
	
	//회원 정보 수정
	int updateMemberInfoOfAdmin(MemberVO memberVO);
	
	//회원 정보 삭제
	int deleteMemberInfoOfAdmin(MemberVO memberVO);
	
	//도서 목록 조회
	List<BookVO> selectBookListForAdmin(BookVO bookVO);
	
	//도서 등록
	int insertBookForAdmin(BookVO bookVO);
	
	//도서 삭제
	int deleteBookInfo(BookVO bookVO);
	
	//도서 수정
	int updateBookInfo(BookViewVO bookViewVO);
	
	//페이징 처리
	//게시물 총 갯수
	public int countBoardForAdmin(BookVO bookVO);
	
	//페이징 처리 게시글 조회
	List<BookVO> selectBookForAdmin(PagingVO pagingVO);
	
	//멤버 총 인원수
	public int countMemberForAdmin(BookVO bookVO);
	
	//행사 총 갯수
	public int countLectureForAdmin(BookVO bookVO);

	//페이징 처리 멤버 조회
	List<MemberVO> selectMemberForAdmin(PagingVO pagingVO);
	
	//스터디룸 예약 현황 조회
	List<StudyRoomViewVO> selectStudyRoomInfoList(StudyRoomViewVO studyRoomViewVO);

	//스터디룸 예약 취소
	int cancelStudyRoom(StudyRoomViewVO studyRoomViewVO);

	//주차장 예약 현황 조회
	List<ParkingViewVO> selectParkingInfoList(ParkingViewVO parkingViewVO);

	//행사 등록
	int insertLecture(LectureVO lectureVO);

	//회원 등록
	int updateMemberToAdmin(MemberVO memberVO);

	//페이징 처리 행사 목록 조회
	List<LectureVO> selectLectureInfoForAdmin(PagingVO pagingVO);

	//행사 수정
	int updateLectureInfoOfAdmin(LectureVO lectureVO);

	//행사 삭제
	int deleteLectureInfoOfAdmin(LectureVO lectureVO);

	
}
