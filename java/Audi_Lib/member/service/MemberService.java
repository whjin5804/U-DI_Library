package Audi_Lib.member.service;

import java.util.List;

import Audi_Lib.facility.vo.FacilityVO;
import Audi_Lib.facility.vo.StudyRoomRentInfoVO;
import Audi_Lib.facility.vo.StudyRoomViewVO;
import Audi_Lib.member.vo.MemberVO;

public interface MemberService {
	
	//회원 가입
	int insertMember(MemberVO memberVO);
	
	//로그인
	MemberVO login(MemberVO memberVO);
	
	//마이 페이지
	MemberVO selectMemberInfo(MemberVO memberVO);
	
	//회원 탈퇴
	void deleteMemberInfo(MemberVO memberVO);
	
	//회원 정보 수정
	void updateMemberInfo(MemberVO memberVO);
	
	//포인트 조회
	MemberVO selectMemberPoint(MemberVO memberVO);
	
	//마이 페이지 기본 정보 조회
	MemberVO selectBasicMemberInfo(MemberVO memberVO);
	
	//회원 아이디 찾기
	MemberVO findMemberId(MemberVO memberVO);
	
	//회원 비밀번호 찾기
	MemberVO findMemberPw(MemberVO memberVO);
	
	//임시비밀번호 업데이트
	void memberPasswordUpdate(MemberVO memberVO);
	
	//카카오에서 가져온 이메일 정보로 도서관 페이지에 회원 가입 되어 있는지 여부 조사 
	boolean isJoined(String kakaoId);

	//카카오 이메일 정보로 자동 로그인
	MemberVO kakaoLogin(String kakaoId);

	//마이페이지에 내 스터디룸 정보 가져옴
	List<StudyRoomViewVO> myStudyRoomReserveList(MemberVO memberVO);

	List<FacilityVO> myParkingReserveList(MemberVO memberVO);
	
	//로그인할 때 계정 정보가 있는지 확인
	MemberVO selectEmailForLoginFail(MemberVO memberVO);
	
	//로그인 틀린 회수 증가
	void loginFailCnt(MemberVO memberVO);
	
	//로그인 실패 회수 조회
	MemberVO selectFailCnt(MemberVO memberVO);
	
	//로그인 제한 시 임시비밀번호 업데이트
	void sendNewPassword(MemberVO memberVO);
	
	//로그인 틀린 회수 초기화
	void loginFailClear(MemberVO memberVO);
	
	//아이디 중복 체크
	int emailOverlap(MemberVO memberVO);
	
}
