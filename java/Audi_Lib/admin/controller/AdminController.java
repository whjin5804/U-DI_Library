package Audi_Lib.admin.controller;


import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import Audi_Lib.admin.service.AdminService;
import Audi_Lib.book.service.BookService;
import Audi_Lib.book.vo.BookClassVO;
import Audi_Lib.book.vo.BookVO;
import Audi_Lib.book.vo.BookViewVO;
import Audi_Lib.facility.service.FacilityService;
import Audi_Lib.facility.vo.LectureVO;
import Audi_Lib.facility.vo.ParkingViewVO;
import Audi_Lib.facility.vo.StudyRoomViewVO;
import Audi_Lib.home.vo.PagingVO;
import Audi_Lib.member.vo.MemberVO;
import Audi_Lib.util.FileUploadUtil;


@Controller
@RequestMapping(value = "/admin")
public class AdminController {
	
	@Resource(name = "adminService")
	private AdminService adminService;
	
	@Resource(name = "bookService")
	private BookService bookService;
	
	@Resource(name = "facilityService")
	private FacilityService facilityService;
	

	//회원목록페이지 (관리자메뉴 첫화면)
	//home.jsp에서 '관리자메뉴' 클릭 시 admin_member_list.jsp로 이동
	//side.jsp에서 '회원 목록 조회' 클릭 시에도 admin_member_list.jsp로 이동
	@RequestMapping("/adminMemberList")
	public String adminMemberList(@RequestParam(name = "sideMenu", required = false, defaultValue = "1") String sideMenu, Model model, MemberVO memberVO
									, PagingVO pagingVO, BookVO bookVO, @RequestParam(value="nowPage", required = false)String nowPage, @RequestParam(value="cntPerPage", required = false)String cntPerPage) {
		
		//페이징 처리
		int total = adminService.countMemberForAdmin(bookVO);
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "10";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "10";
		}
		pagingVO = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		pagingVO.setKeyword(bookVO.getKeyword());
		pagingVO.setCondition(bookVO.getCondition());
		model.addAttribute("paging", pagingVO);
		
		model.addAttribute("sideMenu", sideMenu);
		model.addAttribute("memberList", adminService.selectMemberForAdmin(pagingVO));
		
		return "admin/admin_member_list";
	}
	
	//회원 정보 수정/삭제 페이지로 이동
	//side.jsp에서 '회원 정보 수정/삭제' 클릭 시 admin_change_delete_member_info로 이동
	@RequestMapping("/adminUpdateMemberInfo")
	public String adminUpdateMemberInfo(@RequestParam(name = "sideMenu", required = false, defaultValue = "2") String sideMenu, Model model, MemberVO memberVO
										, PagingVO pagingVO, BookVO bookVO, @RequestParam(value="nowPage", required = false)String nowPage, @RequestParam(value="cntPerPage", required = false)String cntPerPage) {
		
		//페이징 처리
		int total = adminService.countMemberForAdmin(bookVO);
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "10";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "10";
		}
		pagingVO = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		pagingVO.setKeyword(bookVO.getKeyword());
		pagingVO.setCondition(bookVO.getCondition());
		model.addAttribute("paging", pagingVO);
		
		//회원 목록 조회
		model.addAttribute("sideMenu", sideMenu);
		model.addAttribute("memberList", adminService.selectMemberForAdmin(pagingVO));
		
		return "admin/admin_update_member_info";
	}
	
	//회원 정보 수정
	//admin_update_member_info.jsp에서 '변경' 버튼 클릭 시 실행
	@PostMapping("/updateMemberInfo")
	@ResponseBody
	public int updateMemberInfo(MemberVO memberVO) {
		return adminService.updateMemberInfoOfAdmin(memberVO);
	}
	
	//회원 정보 삭제
	//admin_update_member_info.jsp에서 '삭제' 버튼 클릭 시 실행
	@PostMapping("/deleteMemberInfo")
	@ResponseBody
	public int deleteMemberInfo(MemberVO memberVO) {
		return adminService.deleteMemberInfoOfAdmin(memberVO);
	}

	
	//회원 관리자 등록
	//admin_update_member_info.jsp에서 '관리자 등록' 버튼 클릭 시 실행
	@PostMapping("/updateMemberToAdmin")
	@ResponseBody
	public int updateMemberToAdmin(MemberVO memberVO) {
		return adminService.updateMemberToAdmin(memberVO);
	}
	
	//도서 목록 조회 페이지로 이동
	//side.jsp에서 '도서 목록 조회' 클릭 시 admin_book_list.jsp로 이동
	@RequestMapping("/adminBookList")
	public String adminBookList(@RequestParam(name = "sideMenu", required = false, defaultValue = "3") String sideMenu, 
								Model model, PagingVO pagingVO, BookVO bookVO, @RequestParam(value="nowPage", required = false)String nowPage, @RequestParam(value="cntPerPage", required = false)String cntPerPage) {
		//페이징 처리
		//bookVO 에 condition과 keyword가 다 들어가 있기때문에 total을 구하는데 사용 했음
		int total = adminService.countBoardForAdmin(bookVO);
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "10";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "10";
		}
		pagingVO = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		pagingVO.setKeyword(bookVO.getKeyword());
		pagingVO.setCondition(bookVO.getCondition());
		model.addAttribute("paging", pagingVO);
		
		//도서 목록 조회
		model.addAttribute("sideMenu", sideMenu); 
		model.addAttribute("bookList", adminService.selectBookForAdmin(pagingVO));
		
		return "admin/admin_book_list";
	}
	
	//도서 신규 등록 페이지로 이동
	//side.jsp에서 '도서 신규 등록' 클릭 시 admin_register_book.jsp로 이동
	@GetMapping("/adminRegisterBook")
	public String adminRegisterBook(@RequestParam(name = "sideMenu", required = false, defaultValue = "4") String sideMenu, Model model) {
		model.addAttribute("sideMenu", sideMenu);
		model.addAttribute("bookClassList", bookService.selectBookClassAll());
		return "admin/admin_register_book";
	}
	
	//도서 등록
	//admin_register_book.jsp에서 '등록' 클릭 시 도서 등록 됨
	//그리고 admin_register_book.jsp로 다시 이동
	@RequestMapping("/insertBookForAdmin")
	public String insertBookForAdmin(BookVO bookVO, MultipartHttpServletRequest multi) {
		String fileName = "";
		
		//생성된 첨부파일명을 들고온다. 파일이 첨부되지 않았을 경우, fileName은 "", 첨부되었을 경우 "2021050314130000_파일이름"의 형식으로 저장된다.
		fileName = FileUploadUtil.prepareOneFileUpload(multi);
		System.out.println(fileName);
		//첨부파일명을 VO에 세팅한다.
		bookVO.setBookImageName(fileName);
		
		//데이터베이스에 등록
		int result = adminService.insertBookForAdmin(bookVO);
		if (result == 1) {
			if(fileName != null && !fileName.equals("")) {
				FileUploadUtil.oneFileUpload(multi, fileName);
			}
			return "admin/admin_book_register_book_alert";
		}
		return "redirect:/admin/adminRegisterBook";
	}
	
	
	//도서 정보 수정/삭제 페이지로 이동
	//side.jsp에서 '도서 정보 수정/삭제' 클릭 시 admin_update_book_info.jsp로 이동
	@RequestMapping("/adminUpdateBookInfo")
	public String adminUpdateBookInfo(@RequestParam(name = "sideMenu", required = false, defaultValue = "5") String sideMenu, 
										Model model, BookVO bookVO, BookViewVO bookViewVO, PagingVO pagingVO, 
										@RequestParam(value="nowPage", required = false)String nowPage, 
										@RequestParam(value="cntPerPage", required = false)String cntPerPage) {
		//페이징 처리
		int total = adminService.countBoardForAdmin(bookVO);
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "10";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "10";
		}
		pagingVO = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		pagingVO.setKeyword(bookVO.getKeyword());
		pagingVO.setCondition(bookVO.getCondition());
		model.addAttribute("paging", pagingVO);
		
		model.addAttribute("sideMenu", sideMenu);
		model.addAttribute("bookList", adminService.selectBookForAdmin(pagingVO));
		model.addAttribute("bookClassList", bookService.selectBookClassAll());
		return "admin/admin_update_book_info";
	}
	
	//도서 정보 변경
	//admin_update_book_info.jsp에서 '변경' 클릭 시 도서 변경 됨
	//그리고 admin_update_book_info.jsp로 다시 이동
	@PostMapping("/updateBookInfo")
	@ResponseBody
	public int updateBookInfo(BookViewVO bookViewVO) {
		return adminService.updateBookInfo(bookViewVO);
	}
	
	//도서 정보 삭제
	//admin_update_book_info.jsp에서 '삭제' 클릭 시 도서 삭제 됨
	//그리고 admin_update_book_info.jsp로 다시 이동
	@PostMapping("/deleteBookInfo")
	@ResponseBody
	public int deleteBookInfo(BookVO bookVO) {
		return adminService.deleteBookInfo(bookVO);
	}
	
	//스터디룸 예약 관리 페이지로 이동
	//side.jsp에서 '스터디룸 예약 관리' 클릭 시 admin_studyroom_manage.jsp로 이동
	@GetMapping("/adminStudyroomManage")
	public String adminStudyroomManage(@RequestParam(name = "sideMenu", required = false, defaultValue = "6") String sideMenu, Model model, StudyRoomViewVO studyRoomViewVO) {
		model.addAttribute("sideMenu", sideMenu);
		model.addAttribute("StudyRoomInfoList", adminService.selectStudyRoomInfoList(studyRoomViewVO));
		return "admin/admin_studyroom_manage";
	}
	
	//스터디룸 종류 별 조회(전체/토론실/미디어실/발표실)
	@PostMapping("/adminStudyroomManage")
	@ResponseBody
	public List<StudyRoomViewVO> adminStudyroomManage(StudyRoomViewVO studyRoomViewVO){
		return adminService.selectStudyRoomInfoList(studyRoomViewVO);
	}
	
	//스터디룸 예약 취소
	@PostMapping("/cancelStudyRoom")
	@ResponseBody
	public int cancelStudyRoom(StudyRoomViewVO studyRoomViewVO) {
		return adminService.cancelStudyRoom(studyRoomViewVO);
	}
		
	//주차장 예약 관리 페이지로 이동
	//side.jsp에서 '주차장 예약 관리' 클릭 시 admin_parkinglot_manage.jsp로 이동
	@GetMapping("/adminParkinglotManage")
	public String adminParkinglotManage(@RequestParam(name = "sideMenu", required = false, defaultValue = "7") String sideMenu, Model model, ParkingViewVO parkingViewVO) {
		model.addAttribute("sideMenu", sideMenu);
		model.addAttribute("parkingInfoList", adminService.selectParkingInfoList(parkingViewVO));
		return "admin/admin_parkinglot_manage";
	}
			
	//주차장 예약현황 조회
	//admin_parking_lot_manage.jsp에서 날짜 선택 후 검색 버튼 클릭하면 조회됨
	@PostMapping("/selectParkingInfoForAdmin")
	@ResponseBody
	public List<ParkingViewVO> selectParkingInfoForAdmin(ParkingViewVO parkingViewVO){
		return adminService.selectParkingInfoList(parkingViewVO);
	}
	
	//행사일정 목록 조회 페이지로 이동
	@RequestMapping("/adminLectureManage")
	public String adminLectureManage(@RequestParam(name = "sideMenu", required = false, defaultValue = "8") String sideMenu, 
									Model model, PagingVO pagingVO, LectureVO lectureVO, BookVO bookVO,
									@RequestParam(value="nowPage", required = false)String nowPage, @RequestParam(value="cntPerPage", required = false)String cntPerPage) {
		
		//페이징 처리
		//bookVO 에 condition과 keyword가 다 들어가 있기때문에 total을 구하는데 사용 했음
		int total = adminService.countLectureForAdmin(bookVO);
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "10";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "10";
		}
		pagingVO = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		pagingVO.setKeyword(bookVO.getKeyword());
		pagingVO.setCondition(bookVO.getCondition());
		model.addAttribute("paging", pagingVO);
		
		//행사일정 목록 조회
		model.addAttribute("sideMenu", sideMenu);
		model.addAttribute("LectureInfoList", adminService.selectLectureInfoForAdmin(pagingVO));
		return "admin/admin_lecture_manage";
	}
	
	//행사일정 등록 페이지로 이동
	@GetMapping("/adminInsertLectureManage")
	public String adminInsertLectureManage(@RequestParam(name = "sideMenu", required = false, defaultValue = "9") String sideMenu, Model model) {
		model.addAttribute("sideMenu", sideMenu);
		model.addAttribute("studyRoomList", facilityService.selectStudyRoomList());
		return "admin/lib_lecture_manage";
	}
	
	//행사일정 등록
	@PostMapping("/insertLecture")
	public String insertLecture(LectureVO lectureVO) {
		int result = adminService.insertLecture(lectureVO);
		if(result == 1) {
			return "alert/admin_insert_lecture";
		}
		return "";
	}
		
	//행사일정 수정/삭제 페이지로 이동
	@RequestMapping("/adminUpdateLectureInfo")
	public String adminUpdateLectureInfo(@RequestParam(name = "sideMenu", required = false, defaultValue = "10") String sideMenu, Model model,
										PagingVO pagingVO, LectureVO lectureVO, BookVO bookVO,
										@RequestParam(value="nowPage", required = false)String nowPage, @RequestParam(value="cntPerPage", required = false)String cntPerPage) {
		
		//페이징 처리
		//bookVO 에 condition과 keyword가 다 들어가 있기때문에 total을 구하는데 사용 했음
		int total = adminService.countLectureForAdmin(bookVO);
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "10";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "10";
		}
		pagingVO = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		pagingVO.setKeyword(bookVO.getKeyword());
		pagingVO.setCondition(bookVO.getCondition());
		model.addAttribute("paging", pagingVO);
			
		//행사 목록 조회
		model.addAttribute("sideMenu", sideMenu);
		model.addAttribute("lectureList", adminService.selectLectureInfoForAdmin(pagingVO));
		model.addAttribute("studyRoomList", facilityService.selectStudyRoomList());
		return "admin/admin_update_lecture_info";
	}
	
	//행사 정보 수정
	@ResponseBody
	@RequestMapping("/updateLectureInfoOfAdmin")
	public int updateLectureInfo(LectureVO lectureVO) {
		return adminService.updateLectureInfoOfAdmin(lectureVO);
	}
	
	//행사 정보 삭제
	@PostMapping("/deleteLectureInfo")
	@ResponseBody
	public int deleteLectureInfo(LectureVO lectureVO) {
		return adminService.deleteLectureInfoOfAdmin(lectureVO);
	}
	
	//도서관 일정 관리 페이지로 이동
	@GetMapping("/libScheduleManage")
	public String libScheduleManage(@RequestParam(name = "sideMenu", required = false, defaultValue = "11") String sideMenu, Model model) {
		model.addAttribute("sideMenu", sideMenu);
		return "admin/lib_schedule_manage";
	}
	
	
	
	
}
