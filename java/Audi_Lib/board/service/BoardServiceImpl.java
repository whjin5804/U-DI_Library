package Audi_Lib.board.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import Audi_Lib.board.vo.BoardNoticeInfoVO;
import Audi_Lib.board.vo.BoardVO;
import Audi_Lib.home.vo.PagingVO;

@Service("boardService")
public class BoardServiceImpl implements BoardService{

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int countBoard() {
		return sqlSession.selectOne("countBoardInfo");
	}

	@Override
	public List<BoardVO> selectBoardList(PagingVO pagingVO) {
		System.out.println(pagingVO.getKeyword());
		return sqlSession.selectList("selectBoardList", pagingVO);
	}

	@Override
	public BoardVO detailBoard(BoardVO boardVO) {
		sqlSession.update("updateCount", boardVO);
		return sqlSession.selectOne("detailBoard", boardVO);
	}

	@Override
	public int insertBoard(BoardVO boardVO) {
		return sqlSession.insert("insertBoard", boardVO);
	}

	@Override
	public int deleteBoard(BoardVO boardVO) {
		return sqlSession.delete("deleteBoard", boardVO);
	}

	@Override
	public int updateBoard(BoardVO boardVO) {
		return sqlSession.update("updateBoard", boardVO);
	}

	@Override
	public int updateBoardNotice(BoardNoticeInfoVO boardNoticeInfoVO) {
		sqlSession.delete("deleteBoard", boardNoticeInfoVO);
		return sqlSession.update("updateBoardNotice", boardNoticeInfoVO);
	}

	@Override
	public List<BoardVO> selectBoardOfNotice() {
		return sqlSession.selectList("selectBoardOfNotice");
	}

	@Override
	public List<BoardNoticeInfoVO> selectBoardNoticeInfo() {
		return sqlSession.selectList("selectBoardNoticeInfo");
	}

	@Override
	public BoardNoticeInfoVO detailBoardNotice(BoardVO boardVO) {
		sqlSession.update("updateCountNotice", boardVO);
		return sqlSession.selectOne("detailBoardNotice", boardVO);
	}

	@Override
	public int deleteBoardNotice(BoardVO boardVO) {
		return sqlSession.delete("deleteBoardNotice", boardVO);
	}

}
