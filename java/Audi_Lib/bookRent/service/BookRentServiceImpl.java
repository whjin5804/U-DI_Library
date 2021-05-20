package Audi_Lib.bookRent.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import Audi_Lib.bookRent.vo.BookRentVO;
import Audi_Lib.bookRent.vo.BookRentViewVO;
import Audi_Lib.member.vo.MemberLevelVO;
import Audi_Lib.member.vo.MemberVO;

@Service("bookRentService")
public class BookRentServiceImpl implements BookRentService{
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//실제 책을 대여하는 프로시져
	@Transactional
	@Override
	public void insertRentBookProcedure(BookRentVO bookRentVO) {
		//책을 대여하는 프로시져 실행
		sqlSession.insert("insertRentBookProcedure", bookRentVO);
		//빌리는 사람의 책 빌림 COUNT 증가
		sqlSession.update("updateMemberRentCount", bookRentVO);
		//빌리는 사람의 책 빌림 COUNT를 체크해서 레벨을 결정
		sqlSession.update("updateMemberLevelProcedure", bookRentVO);
		//BOOK_RENT_COUNT에 월간 + TOTAL 빌린수 증가
		sqlSession.insert("insertRentCount", bookRentVO);
		//CLASS별 RENT_COUNT 빌린수 증가
		sqlSession.update("updateClassRentCount", bookRentVO);
		//빌리는 책 비활성화 IS_AVAILABLE -> 'N'
		sqlSession.update("updateBookInfoForRent", bookRentVO);
	}
	
	//해당 회원이 현재 대여한 책 목록 조회(반납하지 않은 책)
	@Override
	public List<BookRentViewVO> selectRentedBookListForMember(MemberVO memberVO) {
		return sqlSession.selectList("selectRentedBookListForMember", memberVO);
	}
	
	//대여한 책을 반납
	@Transactional
	@Override
	public void updateRentedBookReturn(BookRentVO bookRentVO) {
		sqlSession.update("updateRentedBookReturn", bookRentVO);
		sqlSession.update("updateBookInfoForReturn", bookRentVO);
	}

	//해당 회원이 대여한 모든 책의 목록을 조회
	@Override
	public List<BookRentViewVO> allRentedBookListForMember(MemberVO memberVO) {
		return sqlSession.selectList("allRentedBookListForMember", memberVO);
	}
	
	//대여시 안내를 위한 memberLevel 정보 리스트 조회
	@Override
	public List<MemberLevelVO> memberLevelList() {
		return sqlSession.selectList("memberLevelList");
	}
	
	//로그인한 회원의 레벨정보 표시
	@Override
	public MemberLevelVO selectMemberLevelInfo(MemberVO memberVO) {
		return sqlSession.selectOne("selectMemberLevelInfo", memberVO);
	}

	//로그인한 회원의 빌린 책의 갯수 표시
	@Override
	public int countRentedBook(MemberVO memberVO) {
		return sqlSession.selectOne("countRentedBook", memberVO);
	}
}

