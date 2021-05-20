package Audi_Lib.board.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.scripting.xmltags.IfSqlNode;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import Audi_Lib.board.service.BoardService;
import Audi_Lib.board.vo.BoardNoticeInfoVO;
import Audi_Lib.board.vo.BoardVO;
import Audi_Lib.member.vo.MemberVO;

@RequestMapping("/board")
@Controller
public class BoardController {

	@Resource(name = "boardService")
	BoardService boardService;
	
	//게시판 제목클릭 시 상세내용
	@GetMapping("/detailBoard")
	public String detailBoard(BoardVO boardVO, Model model) {
		model.addAttribute("board", boardService.detailBoard(boardVO));
		
		return "board/detail_board";
	}
	
	//게시판 공지클릭 시 상세내용
	@GetMapping("/detailBoardNotice")
	public String detailBoardNotice(BoardVO boardVO, Model model) {
		model.addAttribute("board", boardService.detailBoardNotice(boardVO));
		
		return "board/detail_notice_board";
	}
	
	//공지사항 등록/해제
	@PostMapping("/updateBoardNotice")
	@ResponseBody
	public int updateBoardNotice(BoardNoticeInfoVO boardNoticeInfoVO, HttpSession session) {
		MemberVO memberVO = (MemberVO)session.getAttribute("loginInfo");
		boardNoticeInfoVO.setRegMember(memberVO.getMemberCode());
		return boardService.updateBoardNotice(boardNoticeInfoVO);
	}
	
	//글쓰기화면으로 이동
	@GetMapping("/writeBoard")
	public String writeBoard(HttpSession session) {
		//로그인안되있으면 로그인 화면
		if(session.getAttribute("loginInfo") == null) {
			return "member/alert_u_need_login";
		}
		
		return "board/write_board";
	}
	
	//글쓴거 insert
	@PostMapping("/insertBoard")
	public String insertBoard(BoardVO boardVO, HttpSession session) {
		MemberVO membervo = (MemberVO) session.getAttribute("loginInfo");
		
		boardVO.setRegMember(membervo.getMemberCode());
		boardService.insertBoard(boardVO);
		
		return "redirect:/home/board";
	}
	
	//글쓴거 삭제
	@GetMapping("/deleteBoard")
	public String deleteBoard(BoardVO boardVO) {
		int result = boardService.deleteBoard(boardVO);
		if(result == 1) {
			return "alert/success_delete";
		}
		return "redirect:/home/board";
	}
	
	//공지사항 삭제
	@GetMapping("/deleteBoardNotice")
	public String deleteBoardNotice(BoardVO boardVO) {
		int result = boardService.deleteBoardNotice(boardVO);
		if(result == 1) {
			return "alert/success_delete";
		}
		return "redirect:/home/board";
	}
	
	
	@GetMapping("/BoardBeforeupdateBoard")
	public String BoardBeforeupdateBoard(BoardVO boardVO, Model model) {
		model.addAttribute("boardVO", boardService.detailBoard(boardVO));
		
		return "board/update_board";
	}
	
	@PostMapping("/updateBoard")
	public String updateBoard(BoardVO boardVO) {
		int result = boardService.updateBoard(boardVO);
		if(result == 1) {
			return "alert/success_update";
		}
		
		return "redirect:/home/board";
	}
	
	
}
