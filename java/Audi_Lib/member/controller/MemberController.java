package Audi_Lib.member.controller;

import java.io.PrintWriter;
import java.util.Map;

import javax.annotation.Resource;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sun.mail.iap.Response;

import Audi_Lib.bookRent.service.BookRentService;
import Audi_Lib.member.service.MemberService;
import Audi_Lib.member.vo.MemberVO;

@Controller
@RequestMapping("/member")
public class MemberController {
	@Resource(name = "memberService")
	private MemberService memberService;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	@Resource(name = "bookRentService")
	private BookRentService bookRentService;
	
	// 메일 전송을 위한 객체 DI
	@Autowired
	private JavaMailSender mailSender;
	
	//회원가입
	@PostMapping("/insertMember")
	public String insertMember(MemberVO memberVO) {
		String encryptPassword = passwordEncoder.encode(memberVO.getMemberPassword());
		memberVO.setMemberPassword(encryptPassword);
		
		
		int result = memberService.insertMember(memberVO);
		
		if(result == 1) {
			return "alert/join_success";
		}
		else {
			return "alert/join_fail";
		}
		
	}
	
	//아이디 중복 체크
	@ResponseBody
	@PostMapping("/emailCheck")
	public int emailCheck(MemberVO memberVO) {
		
		return memberService.emailOverlap(memberVO);
	}
	
	//로그인
	@RequestMapping("/login")
	public String login(MemberVO memberVO, HttpSession session, Model model) throws MessagingException {
		MemberVO result = memberService.login(memberVO);
		
		if(result != null) {
			model.addAttribute("findSuccess", result);
			//로그인 성공
			if(passwordEncoder.matches(memberVO.getMemberPassword(), result.getMemberPassword())) {
				session.setAttribute("loginInfo", result);

				memberService.loginFailClear(memberVO);
				
				return "alert/login_success";
			}
			//로그인 실패
			else {
				//로그인 실패 회수 조회
				int failCnt = memberService.selectFailCnt(memberVO).getFailCnt();
				
				if(failCnt <= 4) {
					memberService.loginFailCnt(memberVO);
				}
				else {
					//로그인 제한
					//1. 현재 비밀번호를 랜덤한 비번으로 변경
					String imsiPw = getTempPassword(6);
					
					String encryptPassword = passwordEncoder.encode(imsiPw);
					memberVO.setMemberPassword(encryptPassword);
					
					memberService.sendNewPassword(memberVO);
					
					//2. 바뀐 비번을 메일로 전송
					//메일 보내기
					MimeMessage message = mailSender.createMimeMessage();
				    MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

				    messageHelper.setFrom("udLibraryProject@gmail.com"); // 보내는사람 생략하거나 하면 정상작동을 안함
				    messageHelper.setTo(memberVO.getMemberEmail()); // 받는사람 이메일
				    messageHelper.setSubject("우디 도서관 임시 비밀번호 발송"); // 메일제목은 생략이 가능하다
				    messageHelper.setText("임시 비밀번호 : " + imsiPw); // 메일 내용
				    
				    mailSender.send(message);
					
				}
				
				model.addAttribute("failCnt", failCnt);
				return "alert/login_fail";
			}
			
		}
		else {
			return "alert/login_fail";
		}
		
	}
	//아이디 찾기 페이지로 이동
	@GetMapping("/findId")
	public String goFindIdPage() {
		
		return "member/findId";
	}

	//아이디 찾기
	@PostMapping("/findId2")
	//jsp에서 input태그의 데이터가 넘어오면 커멘드 객체가 자동으로 받는다.
	//커멘드객체 : controller의 메소드의 메개변수로 들어온 객체
	//커멘드객체에 정의된 변수명과 jsp에서 넘어오는 데이터의 이름이 일치하면
	//jsp에서 넘어온 데이터를 커멘드 객체의 변수에 자동으로 바인딩해준다.

	//model 사용이유: controller에서 jsp로 이동할 때 필요한 데이터를 넘길 때 사용
	public String findId(MemberVO memberVO, Model model) {
		
		memberVO.setMemberTel(memberVO.getMemberTel().replace("-", ""));

		MemberVO vo = memberService.findMemberId(memberVO);
		String memberEmail = "";
		
		if(vo != null) {
			memberEmail = vo.getMemberEmail();
		}
		model.addAttribute("memberEmail", memberEmail);
		
		return "member/show_finded_id";
	}

	//비밀번호 찾기 페이지로 이동
	@GetMapping("/findPw")
	public String findPw() {
		
		return "member/findPw";
	}
	
	//비밀번호 찾기
	@PostMapping("/findPw2")
	public String goFindPwPage(MemberVO memberVO, Model model) throws MessagingException {
		MemberVO pw = memberService.findMemberPw(memberVO);
		
		if(pw != null) {
			String imsiPw = getTempPassword(6);
			
			
			//메일 보내기
			MimeMessage message = mailSender.createMimeMessage();
		    MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

		    messageHelper.setFrom("udLibraryProject@gmail.com"); // 보내는사람 생략하거나 하면 정상작동을 안함
		    messageHelper.setTo(memberVO.getMemberEmail()); // 받는사람 이메일
		    messageHelper.setSubject("우디 도서관 임시 비밀번호 발송"); // 메일제목은 생략이 가능하다
		    messageHelper.setText("임시 비밀번호 : " + imsiPw); // 메일 내용
		    
		    mailSender.send(message);
		    
		    String encryptPassword = passwordEncoder.encode(imsiPw);
			memberVO.setMemberPassword(encryptPassword);
		    
		    memberService.memberPasswordUpdate(memberVO);
			
		}
		
		model.addAttribute("pw", pw);
		
		return "member/show_finded_pw";
	}
	
	//마이 페이지로 이동
	@GetMapping("/myPage")
	public String myPage(Model model, HttpSession session) {
		MemberVO memberVO = (MemberVO)session.getAttribute("loginInfo");
			model.addAttribute("selectBasicMemberInfo", memberService.selectBasicMemberInfo(memberVO));
		
		return "myPage/myPage";
	}
	
	//회원 정보 페이지
	@RequestMapping("/memberInfo")
	public String memberInfo(Model model, HttpSession session) {
		MemberVO memberVO = (MemberVO)session.getAttribute("loginInfo");
		model.addAttribute("selectMemberInfo", memberService.selectMemberInfo(memberVO));
		
		return "myPage/member_info";
		
	}
	//회원 정보 수정
	@PostMapping("/updateMemberInfo")
	public String updateMemberInfo(MemberVO memberVO) {
		if(memberVO != null) {
			if(memberVO.getMemberPassword() != null && !memberVO.getMemberPassword().equals("")){
				String encryptPassword = passwordEncoder.encode(memberVO.getMemberPassword());
				memberVO.setMemberPassword(encryptPassword);
			}
		}
		memberService.updateMemberInfo(memberVO);
		
		return "alert/update_info";
	}
	//회원 정보 삭제 페이지
	@GetMapping("/deleteMemberPage")
	public String deleteMemberPage() {
		
		return "member/delete_member";
	}
	//회원 정보 삭제
	@PostMapping("/deleteMemberInfo")
	public String deleteMemberInfo(MemberVO memberVO, HttpSession session) {
		
		MemberVO result = memberService.login(memberVO);
		
		if(result != null) {
			//로그인 성공
			if(passwordEncoder.matches(memberVO.getMemberPassword(), result.getMemberPassword())) {
				memberService.deleteMemberInfo(memberVO);
				session.removeAttribute("loginInfo");
				return "redirect:/home/first";
			}
			//로그인 실패
			else {
				return "alert/delete_fail";
			}
			
		}
		else {
			return "alert/delete_fail";
		}
		
	}
	//대여/반납
	@GetMapping("/rentReturnBook")
	public String lendBook(HttpSession session, Model model) {
		MemberVO memberVO = (MemberVO)session.getAttribute("loginInfo");
		model.addAttribute("rentBookList", bookRentService.allRentedBookListForMember(memberVO));
		
		return "myPage/rent_return_book";
		
	}
	
	/* 마이페이지 시설 예약 확인 */
	@GetMapping("/myStudyRoomReserveList")
	public String myStudyRoomReserveList(Model model, HttpSession session) {
		MemberVO memberVO = (MemberVO)session.getAttribute("loginInfo");
		model.addAttribute("myStudyRoomReserveList", memberService.myStudyRoomReserveList(memberVO));
		
		return "myPage/reserve_studyRoom";
	}
	
	@GetMapping("/myParkingReserveList")
	public String myParkingReserveList(Model model, HttpSession session) {
		MemberVO memberVO = (MemberVO)session.getAttribute("loginInfo");
		model.addAttribute("myParkingReserveList", memberService.myParkingReserveList(memberVO));
		
		return "myPage/reserve_parking";
	}
	
	
	//현재 포인트
	@GetMapping("/nowPoint")
	public String nowPoint(Model model, HttpSession session) {
		MemberVO memberVO = (MemberVO)session.getAttribute("loginInfo");
		model.addAttribute("nowMemberPoint", memberService.selectMemberPoint(memberVO));

		return "myPage/now_point";
		
	}
	//책 추천 알고리즘
	@GetMapping("/bookAlgorithm")
	public String bookAlgorithm() {
		return "myPage/book_algorithm";
		
	}
	
	//카카오 연동 후 카카오 데이터를 받아 옴
	
	@GetMapping("/showKakaoData")
	public String showKakaoData(@RequestParam(name = "kakaoId") String kakaoId, Model model, HttpSession session) {
		System.out.println("카카오 ID : " + kakaoId);
		
		kakaoId = kakaoId.replace("\"", "");
		
		
		//API로 받아온 카카오 이메일로 회원가입 여부 확인
		boolean isJoined =  memberService.isJoined(kakaoId);
		
		//회원 가입이 되어있으면 카카오 이메일로 바로 로그인
		if(isJoined){
			MemberVO member = memberService.kakaoLogin(kakaoId);
			session.setAttribute("loginInfo", member);
			
			return "/alert/login_success";
		}
		//그렇지 않으면 회원가입 페이지로 이동
		else {
			//회원가입 페이지로 이동시 카카오 이메일 정보를 넘김
			model.addAttribute("kakaoEmail", kakaoId);
			return "member/join";
		}
		
	}
	
	/*
	 * @GetMapping("/kakaoLogin") public String kakaoLogin(HttpSession session) {
	 * 
	 * 
	 * session.setAttribute(, );
	 * 
	 * return ""; }
	 */
	
	//----------------------------- 사용자 정의 메소드 ------------------------//
	private String getTempPassword(int length) { //4
	    int index = 0;
	    char[] charArr = new char[] { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F',
	    'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', 'a',
	    'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v',
	    'w', 'x', 'y', 'z' };

	    String sb = "";
	 
	    for (int i = 0; i < length; i++) { //4
	        index = (int) (charArr.length * Math.random());//0<=x<1 실수
	        sb = sb + charArr[index];
	    }
	 
	    return sb.toString();
	}
	
}
