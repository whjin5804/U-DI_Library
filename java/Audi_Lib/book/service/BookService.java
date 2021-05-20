package Audi_Lib.book.service;

import java.util.List;

import Audi_Lib.book.vo.BookClassVO;
import Audi_Lib.book.vo.BookVO;
import Audi_Lib.book.vo.BookViewVO;
import Audi_Lib.book.vo.MonthlyBookRankVO;

public interface BookService {
	//책을 등록하기 위해
	int insertBook(BookVO bookVO);
	
	//모든 카테고리 리스트(0 - 총류....)를 select
	List<BookClassVO> selectBookClassAll();
	
	//신착 도서를 위한 책 10개 select
	List<BookViewVO> selectBookListToTime();
	
	//페이징 처리를 한 통합검색 리스트 select
	List<BookViewVO> selectBookList(BookViewVO bookViewVO);
	
	//책카테고리를 대여 많은순으로 정리해서 출력
	List<BookClassVO> selectClassListToCount();
	
	//해당하는 책 카테고리에서 최근에 들어온 순으로 5개 정렬 
	List<BookViewVO> selectBookListToClass(BookClassVO bookClassVO);
	
	//검색기능을 위해 해당조건을 만족하는 책의 총 수를 셈
	int countBookForPaging(BookViewVO bookViewVO);
	
	//책 자세히 보기
	BookViewVO selectBookDetail(BookViewVO bookViewVO);
	
	//월간 랭크 등록을 위해 BOOK_RENT_COUNT 테이블에서 월간 대여순으로 정렬하여 최대 9개의 BOOK_CODE를 받아옴
	List<String> selectBookForInsertRank();
	
	//월간 랭크를 실제로 등록
	void insertBookRank(MonthlyBookRankVO monthlyBookRankVO);
	
	//월간 랭킹 주간을 선택하기 위한 리스트 목록
	List<MonthlyBookRankVO> selectRankedMonth();
	
	//선택한 월의 랭킹을 받아옴
	MonthlyBookRankVO selectRankedBookVOToMonth(String rankMonth);
	
	//리스트로 들어간 bookCode들의 정보 목록
	List<BookViewVO> selectThisMonthRankedBookInfoList(MonthlyBookRankVO monthlyBookRankVO);
}
