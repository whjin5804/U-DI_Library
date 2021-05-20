package Audi_Lib.board.service;

import java.util.List;

import Audi_Lib.board.vo.BoardNoticeInfoVO;
import Audi_Lib.board.vo.BoardVO;
import Audi_Lib.home.vo.PagingVO;

public interface BoardService {

	int countBoard();

	List<BoardVO> selectBoardList(PagingVO pagingVO);

	BoardVO detailBoard(BoardVO boardVO);

	int insertBoard(BoardVO boardVO);

	int deleteBoard(BoardVO boardVO);

	int updateBoard(BoardVO boardVO);

	int updateBoardNotice(BoardNoticeInfoVO boardNoticeInfoVO);

	List<BoardVO> selectBoardOfNotice();

	List<BoardNoticeInfoVO> selectBoardNoticeInfo();

	BoardNoticeInfoVO detailBoardNotice(BoardVO boardVO);

	int deleteBoardNotice(BoardVO boardVO);


}
