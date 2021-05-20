package Audi_Lib.book.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import Audi_Lib.book.vo.BookClassVO;
import Audi_Lib.book.vo.BookVO;
import Audi_Lib.book.vo.BookViewVO;
import Audi_Lib.book.vo.MonthlyBookRankVO;

@Service("bookService")
public class BookServiceImpl implements BookService{
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//책을 등록하기 위해
	@Override
	public int insertBook(BookVO bookVO) {
		return sqlSession.insert("insertBook", bookVO);
	}
	
	//모든 카테고리 리스트(0 - 총류....)를 select
	@Override
	public List<BookClassVO> selectBookClassAll() {
		return sqlSession.selectList("selectBookClassAll");
	}

	//신착 도서를 위한 책 10개 select
	@Override
	public List<BookViewVO> selectBookListToTime() {
		return sqlSession.selectList("selectBookListToTime");
	}

	//페이징 처리를 한 통합검색 리스트 select
	@Override
	public List<BookViewVO> selectBookList(BookViewVO bookViewVO) {
		return sqlSession.selectList("selectBookList", bookViewVO);
	}

	//책카테고리를 대여 많은순으로 정리해서 출력
	@Override
	public List<BookClassVO> selectClassListToCount() {
		return sqlSession.selectList("selectClassListToCount");
	}

	//해당하는 책 카테고리에서 최근에 들어온 순으로 5개 정렬
	@Override
	public List<BookViewVO> selectBookListToClass(BookClassVO bookClassVO) {
		return sqlSession.selectList("selectBookListToClass", bookClassVO);
	}
	
	//검색기능을 위해 해당조건을 만족하는 책의 총 수를 셈
	public int countBookForPaging(BookViewVO bookViewVO) {
		return sqlSession.selectOne("countBookForPaging", bookViewVO);
	}

	//책 자세히 보기
	@Override
	public BookViewVO selectBookDetail(BookViewVO bookViewVO) {
		return sqlSession.selectOne("selectBookDetail", bookViewVO);
	}

	//월간 랭크 등록을 위해 BOOK_RENT_COUNT 테이블에서 월간 대여순으로 정렬하여 최대 9개의 BOOK_CODE를 받아옴
	@Override
	public List<String> selectBookForInsertRank() {
		return sqlSession.selectList("selectBookForInsertRank");
	}
	
	//월간 랭크를 실제로 등록 / BOOK_RENT_COUNT의 월간 대여를 0으로 초기화 함
	@Transactional
	@Override
	public void insertBookRank(MonthlyBookRankVO monthlyBookRankVO) {
		sqlSession.insert("insertBookRank", monthlyBookRankVO);
		//BOOK_RENT_COUNT의 월간 대여를 0으로 초기화 함
		sqlSession.update("updateMonthlyCountInit");
	}

	//월간 랭킹 주간을 선택 하기 위한 목록 선택
	@Override
	public List<MonthlyBookRankVO> selectRankedMonth() {
		return sqlSession.selectList("selectRankedMonth");
	}
	
	//선택한 월의 랭킹 정보를 받아옴
	@Override
	public MonthlyBookRankVO selectRankedBookVOToMonth(String rankMonth) {
		return sqlSession.selectOne("selectRankedBookVOToMonth", rankMonth);
	}

	@Override
	public List<BookViewVO> selectThisMonthRankedBookInfoList(MonthlyBookRankVO monthlyBookRankVO) {
		return sqlSession.selectList("selectThisMonthRankedBookInfoList", monthlyBookRankVO);
	}
	
	
}
