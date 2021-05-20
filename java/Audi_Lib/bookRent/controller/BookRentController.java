package Audi_Lib.bookRent.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import Audi_Lib.book.vo.BookVO;
import Audi_Lib.bookRent.service.BookRentService;
import Audi_Lib.bookRent.vo.BookRentVO;
import Audi_Lib.member.vo.MemberVO;

@Controller
@RequestMapping("/rent")
public class BookRentController {
	
	@Resource(name = "bookRentService")
	private BookRentService bookRentService;
	
	@PostMapping("/bookRentForm")
	public String bookRentForm(BookVO bookVO, Model model, HttpSession session) {
		MemberVO loginInfo = (MemberVO)session.getAttribute("loginInfo");
		if(loginInfo != null) {
			model.addAttribute("memberLevelInfo", bookRentService.selectMemberLevelInfo(loginInfo));
			model.addAttribute("countRentedBook", bookRentService.countRentedBook(loginInfo));
		}
		model.addAttribute("levelInfoList", bookRentService.memberLevelList());
		return "book/book_rent_form";
	}
	
	@PostMapping("/bookRent")
	public String rentBook(BookRentVO bookRentVO) {
		bookRentService.insertRentBookProcedure(bookRentVO);
		return "redirect:/home/first";
	}
	
	@GetMapping("/bookReturnForm")
	public String bookReturnForm(HttpSession session, Model model) {
		if(session.getAttribute("loginInfo") != null) {
			MemberVO memberVO = (MemberVO)session.getAttribute("loginInfo");
			model.addAttribute("rentedBookList", bookRentService.selectRentedBookListForMember(memberVO));
		}
		return "book/book_return_form";
	}
	
	@GetMapping("/bookReturn")
	public String bookReturn(BookRentVO bookRentVO) {
		bookRentService.updateRentedBookReturn(bookRentVO);
		return "redirect:/member/rentReturnBook";
	}
}
