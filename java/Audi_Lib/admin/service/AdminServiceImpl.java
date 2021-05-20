package Audi_Lib.admin.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import Audi_Lib.book.vo.BookVO;
import Audi_Lib.book.vo.BookViewVO;
import Audi_Lib.facility.vo.LectureVO;
import Audi_Lib.facility.vo.ParkingViewVO;
import Audi_Lib.facility.vo.StudyRoomViewVO;
import Audi_Lib.home.vo.PagingVO;
import Audi_Lib.member.vo.MemberVO;



@Service("adminService")
public class AdminServiceImpl implements AdminService {
	@Autowired
	private SqlSessionTemplate sqlSession;

	//회원목록조회
	@Override
	public List<MemberVO> selectMemberList(MemberVO memberVO) {
		return sqlSession.selectList("selectMemberList", memberVO);
	}

	//회원 정보 수정
	@Override
	public int updateMemberInfoOfAdmin(MemberVO memberVO) {
		return sqlSession.update("updateMemberInfoOfAdmin", memberVO);
	}
	
	//회원 정보 삭제
	@Override
	public int deleteMemberInfoOfAdmin(MemberVO memberVO) {
		return sqlSession.delete("deleteMemberInfoOfAdmin", memberVO);
	}

	//회원 관리자로 등록
	@Override
	public int updateMemberToAdmin(MemberVO memberVO) {
		return sqlSession.update("updateMemberToAdmin", memberVO);
	}
	//도서 목록 조회
	@Override
	public List<BookVO> selectBookListForAdmin(BookVO bookVO) {
		return sqlSession.selectList("selectBookListForAdmin", bookVO);
	}

	//도서 등록
	@Override
	public int insertBookForAdmin(BookVO bookVO) {
		return sqlSession.insert("insertBookForAdmin", bookVO);
	}

	//도서 삭제
	@Override
	public int deleteBookInfo(BookVO bookVO) {
		return sqlSession.delete("deleteBookInfo", bookVO);
	}

	//도서 수정
	@Override
	public int updateBookInfo(BookViewVO bookViewVO) {
		return sqlSession.update("updateBookInfo", bookViewVO);
	}

	//페이징 처리
	//게시물 총 갯수
	@Override
	public int countBoardForAdmin(BookVO bookVO) {
		return sqlSession.selectOne("countBoardForAdmin", bookVO);
	}

	//페이징 처리 게시글 조회
	@Override
	public List<BookVO> selectBookForAdmin(PagingVO pagingVO) {
		return sqlSession.selectList("selectBookForAdmin", pagingVO);
	}

	//멤버 총 인원수
	@Override
	public int countMemberForAdmin(BookVO bookVO) {
		return sqlSession.selectOne("countMemberForAdmin", bookVO);
	}
	
	//페이징 처리 멤버 조회
	@Override
	public List<MemberVO> selectMemberForAdmin(PagingVO pagingVO) {
		return sqlSession.selectList("selectMemberForAdmin", pagingVO);
	}
	
	//스터디룸 예약 현황 조회
	@Override
	public List<StudyRoomViewVO> selectStudyRoomInfoList(StudyRoomViewVO studyRoomViewVO) {
		return sqlSession.selectList("selectStudyRoomInfoList", studyRoomViewVO);
	}

	//스터디룸 예약 취소
	@Override
	public int cancelStudyRoom(StudyRoomViewVO studyRoomViewVO) {
		return sqlSession.delete("deleteRoomReservation", studyRoomViewVO);
	}

	//주차장 예약 현황 조회
	@Override
	public List<ParkingViewVO> selectParkingInfoList(ParkingViewVO parkingViewVO) {
		return sqlSession.selectList("selectParkingInfoList", parkingViewVO);
	}

	//강연 추가
	@Override
	public int insertLecture(LectureVO lectureVO) {
		return sqlSession.insert("insertLecture", lectureVO);
	}

	//행사 총 갯수
	@Override
	public int countLectureForAdmin(BookVO bookVO) {
		return sqlSession.selectOne("countLectureForAdmin", bookVO);
	}

	//페이징 처리 행사 조회
	@Override
	public List<LectureVO> selectLectureInfoForAdmin(PagingVO pagingVO) {
		return sqlSession.selectList("selectLectureInfoForAdmin", pagingVO);
	}

	//행사 수정
	@Override
	public int updateLectureInfoOfAdmin(LectureVO lectureVO) {
		return sqlSession.update("updateLectureInfoOfAdmin", lectureVO);
	}

	//행사 삭제
	@Override
	public int deleteLectureInfoOfAdmin(LectureVO lectureVO) {
		return sqlSession.delete("deleteLectureInfoOfAdmin", lectureVO);
	}


	


	
}
