package Audi_Lib.facility.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import Audi_Lib.facility.service.FacilityService;
import Audi_Lib.facility.vo.FacilityVO;
import Audi_Lib.facility.vo.LectureVO;
import Audi_Lib.facility.vo.StudyRoomRentInfoVO;
import Audi_Lib.home.vo.PagingVO;
import Audi_Lib.member.service.MemberService;
import Audi_Lib.member.vo.MemberVO;

@Controller
@RequestMapping("/facility")
public class FacilityController {
	
	@Resource(name = "facilityService")
	private FacilityService facilityService;
	
	@Resource(name = "memberService")
	private MemberService memberService;
	
	//찾아오시는 길
	@GetMapping("/libraryMap")
	public String showLibraryMap() {
		return "facility/library_map";
	}
	
	
	/* ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ주차장 ㅡㅡㅡㅡㅡㅡㅡㅡㅡ*/
	//주차장 이용
	@GetMapping("/parking")
	public String showParking(HttpSession session, Model model) {
		MemberVO memberVO = (MemberVO)session.getAttribute("loginInfo");
		if(memberVO != null) {
			model.addAttribute("MemberInfo", memberService.selectBasicMemberInfo(memberVO));
		}
		return "facility/parking";
	}
	
	//parking.jsp > 달력에서 모달뜨기 전 주차 예약되어있는지 여부
	@PostMapping("/selectParkingOfParkingDate")
	@ResponseBody
	public List<FacilityVO> selectParkingOfParkingDate(FacilityVO facilityVO) {
		List<FacilityVO> result =  facilityService.selectParkingOfParkingDate(facilityVO);
		return result;
		
	}
	
	//parking.js > 예약버튼 눌럿을때 예약 전, 이사람이 이날 주차햇는지 확인
	@PostMapping("/isParkingTodayOfPerson")
	@ResponseBody
	public int isParkingTodayOfPerson(FacilityVO facilityVO, HttpSession session) {
		
		//로그인안되있으면 로그인 화면
		MemberVO memberVO = (MemberVO)session.getAttribute("loginInfo");
		if (memberVO == null) {
			return 2;
		}
		facilityVO.setParkingMember(memberVO.getMemberCode());
		return facilityService.isParkingTodayOfPerson(facilityVO);
	}
	
	@GetMapping("/uNeedLogin")
	public String uNeedLogin() {
		return "member/alert_u_need_login";
	}
	
	//parking.jsp > 주차장 예약 insert(포인트 여부확인 후 insert)
	@PostMapping("/reserveParking")
	public String reserveParking(FacilityVO facilityVO, HttpSession session, Model model) throws ParseException {
		
		if (session.getAttribute("loginInfo") == null) {
			return "member/alert_u_need_login";
		}
		//오늘날짜와 선택한날짜를 가져와 비교한다음 오늘날짜가 더크면 못한다하기
		int todayDate = facilityVO.getTodayDate();
		int selectParkingDate = facilityVO.getSelectParkingDate();
		if(todayDate > selectParkingDate) {
			return "alert/cant_selectDay_becausePrevDay";
		}
		
		//세션값을 주차예약자로 set
		MemberVO memberVO = (MemberVO)session.getAttribute("loginInfo");
		model.addAttribute("loginInfo", memberVO);
		facilityVO.setParkingMember(memberVO.getMemberCode());
		
		int result = facilityService.reserveParking(facilityVO);
		if(result == 1) {
			return "facility/cant_parking_here";
		}else if(result == 2) {
			//결제창으로 이동
			return "facility/kakaopay";
		}else if (result == 3) {
			return "facility/success_parking_ofPoint";
		}
		
		return "redirect:/facility/parking";
		
	}
	
	
	//결제한 이후 주차장 예약insert
	@GetMapping("/payParking")
	public String payParking(FacilityVO facilityVO, HttpSession session) {
		MemberVO memberVO = (MemberVO)session.getAttribute("loginInfo");
		facilityVO.setParkingMember(memberVO.getMemberCode());
		
		facilityService.reserveParkingAfterPay(facilityVO);
		
		
		return "redirect:/facility/parking";
	}
	
	//주차장예약취소
	@ResponseBody
	@PostMapping("/cancelReserve")
	public int cancelReserve(FacilityVO facilityVO, HttpSession session) {
		MemberVO memberVO = (MemberVO)session.getAttribute("loginInfo");
		facilityVO.setParkingMember(memberVO.getMemberCode());
		return facilityService.cancelReserve(facilityVO);
		
	}
	/* ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ주차장 끝ㅡㅡㅡㅡㅡㅡㅡㅡㅡ*/
		
	
	
	
	/* ㅡㅡㅡㅡㅡㅡㅡㅡ스터디룸ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ */
	//스터디룸 이용안내
	@GetMapping("/studyRoomInfo")
	public String showStudyRoomInfo() {
		
		return "facility/studyRoom_info";
	}
	
	//스터디룸 예약화면으로 이동
	@GetMapping("/studyRoom")
	public String showStudyRoom(Model model) {
		model.addAttribute("studyRoomList", facilityService.selectStudyRoomList());
		return "facility/studyRoom";
	}
	
	
	//예약전 해당날짜 시간이 예약되어있는지 확인
	@PostMapping("/isRentTime")
	@ResponseBody
	public List<StudyRoomRentInfoVO> isRentTime(StudyRoomRentInfoVO studyRoomRentInfoVO) {
		return facilityService.selectIsTime(studyRoomRentInfoVO);
	}
	
	//스터디룸 예약 insert
	@PostMapping("/reserveStudyRoom")
	public String reserveStudyRoom(HttpSession session, StudyRoomRentInfoVO studyRoomRentInfoVO, FacilityVO facilityVO) {
		//로그인안됬으면 로그인하러
		if (session.getAttribute("loginInfo") == null) {
			return "member/alert_u_need_login";
		}
		
		//오늘날짜와 선택한날짜를 가져와 비교한다음 오늘날짜가 더크면 못한다하기
		int todayDate = facilityVO.getTodayDate();
		int selectParkingDate = facilityVO.getSelectParkingDate();

		if(todayDate > selectParkingDate) {
			return "alert/cant_selectDayStudyRoom_becausePrevDay";
		}
		//세션에서 로그인꺼내서 넣기
		MemberVO memberVO= (MemberVO)session.getAttribute("loginInfo");
		studyRoomRentInfoVO.setMemberCode(memberVO.getMemberCode());
		studyRoomRentInfoVO.setRoomRentMember(memberVO.getMemberName());
		int isTrue = facilityService.insertRentDate(studyRoomRentInfoVO);
		
		if(isTrue == 1) {
			return "facility/cant_reserve_studyRoom";
		}
		else if(isTrue == 2) {
			return "facility/success_reserve_studyRoom";
		}
		else if(isTrue == 3) {
			return "facility/cant_reserve_choiceTime";
		}
		return "facility/success_reserve_studyRoom";
		
		
	}
	/* ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ스터디룸 끝ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ*/
	
	
	
	/* ㅡㅡㅡㅡㅡㅡㅡㅡ행사소개ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ */
	@GetMapping("/libEvent")
	public String showLibEvent(Model model, LectureVO lectureVO, PagingVO pagingVO, @RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage) {
		
		int total = facilityService.countBoard();
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "5";
		}
		pagingVO = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging", pagingVO);
		model.addAttribute("lectureList", facilityService.selectBoard(pagingVO));
		model.addAttribute("total", total);
		
		return "facility/lib_lecture";
	}
	
	@PostMapping("/selectDetailLecture")
	@ResponseBody
	public LectureVO selectDetailLecture(LectureVO lectureVO) {
		return facilityService.selectDetailLecture(lectureVO);
	}
	
	@PostMapping("/searchLecture")
	public String searchLecture(Model model, LectureVO lectureVO) {
		model.addAttribute("lectureList", facilityService.selectLectureList(lectureVO));
		
		return "facility/lib_lecture";
	}
	
	/* ㅡㅡㅡㅡㅡㅡㅡㅡ행사소개 끝ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ */
	
	
	//도서관 전체일정
	@GetMapping("/libCalendar")
	public String showLibCalendar() {
		
		return "facility/lib_calendar";
	}
	
	
	
	/* 사용자 정의 함수 */
	
}








