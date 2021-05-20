package Audi_Lib.bookRent.service;

import java.util.List;

import Audi_Lib.bookRent.vo.BookRentVO;
import Audi_Lib.bookRent.vo.BookRentViewVO;
import Audi_Lib.member.vo.MemberLevelVO;
import Audi_Lib.member.vo.MemberVO;

public interface BookRentService {
	//실제 책을 대여하는 프로시져
	void insertRentBookProcedure(BookRentVO bookRentVO);
	
	//해당 회원이 현재 대여한 책 목록 조회(반납하지 않은 책)
	List<BookRentViewVO> selectRentedBookListForMember(MemberVO memberVO);
	
	//대여한 책을 반납하는 서비스
	void updateRentedBookReturn(BookRentVO bookRentVO);
	
	//해당 회원이 대여한 모든 책의 목록을 조회
	List<BookRentViewVO> allRentedBookListForMember(MemberVO memberVO);
	
	//대여시 안내를 위한 memberLevel 정보 리스트 조회
	List<MemberLevelVO> memberLevelList();
	
	//로그인한 회원의 레벨정보 표시
	MemberLevelVO selectMemberLevelInfo(MemberVO memberVO);
	
	//로그인한 회원이 빌린 책의 갯수 표시
	int countRentedBook(MemberVO memberVO);
}
