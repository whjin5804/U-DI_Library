package Audi_Lib.member.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import Audi_Lib.facility.vo.FacilityVO;
import Audi_Lib.facility.vo.StudyRoomRentInfoVO;
import Audi_Lib.facility.vo.StudyRoomViewVO;
import Audi_Lib.member.vo.MemberVO;

@Service("memberService")
public class MemberServiceImpl implements MemberService{
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int insertMember(MemberVO memberVO) {
		return sqlSession.insert("insertMember", memberVO);
	}

	@Override
	public MemberVO login(MemberVO memberVO) {
		return sqlSession.selectOne("login", memberVO);
	}

	@Override
	public MemberVO selectMemberInfo(MemberVO memberVO) {
		return sqlSession.selectOne("selectMemberInfo", memberVO);
	}

	@Override
	public void deleteMemberInfo(MemberVO memberVO) {
		sqlSession.delete("deleteMemberInfo", memberVO);
	}

	@Override
	public void updateMemberInfo(MemberVO memberVO) {
		sqlSession.update("memberMapper.updateMemberInfo", memberVO);
		
	}

	@Override
	public MemberVO selectMemberPoint(MemberVO memberVO) {
		return sqlSession.selectOne("selectMemberPoint", memberVO);
	}

	@Override
	public MemberVO selectBasicMemberInfo(MemberVO memberVO) {
		return sqlSession.selectOne("selectBasicMemberInfo", memberVO);
	}

	@Override
	public MemberVO findMemberId(MemberVO memberVO) {
		return sqlSession.selectOne("findMemberId", memberVO);
	}

	@Override
	public MemberVO findMemberPw(MemberVO memberVO) {
		return sqlSession.selectOne("findMemberPw", memberVO);
	}

	@Override
	public void memberPasswordUpdate(MemberVO memberVO) {
		sqlSession.update("memberPasswordUpdate", memberVO);
	}

	@Override
	public boolean isJoined(String kakaoId) {
		String result = sqlSession.selectOne("selectIdForKakaoLogin", kakaoId);
		
		return result != null ? true : false; 
	}

	@Override
	public MemberVO kakaoLogin(String kakaoId) {
		return sqlSession.selectOne("kakaoLogin", kakaoId);
	}

	@Override
	public List<StudyRoomViewVO> myStudyRoomReserveList(MemberVO memberVO) {
		return sqlSession.selectList("myStudyRoomReserveList", memberVO);
	}

	@Override
	public List<FacilityVO> myParkingReserveList(MemberVO memberVO) {
		return sqlSession.selectList("myParkingReserveList", memberVO);
	}

	@Override
	public MemberVO selectEmailForLoginFail(MemberVO memberVO) {
		return sqlSession.selectOne("selectEmailForLoginFail", memberVO);
	}

	@Override
	public void loginFailCnt(MemberVO memberVO) {
		sqlSession.update("loginFailCnt", memberVO);
	}

	@Override
	public MemberVO selectFailCnt(MemberVO memberVO) {
		return sqlSession.selectOne("selectFailCnt", memberVO);
	}

	@Override
	public void sendNewPassword(MemberVO memberVO) {
		sqlSession.update("sendNewPassword", memberVO);
	}

	@Override
	public void loginFailClear(MemberVO memberVO) {
		sqlSession.update("loginFailClear", memberVO);
	}

	@Override
	public int emailOverlap(MemberVO memberVO) {
		return sqlSession.selectOne("emailOverlap", memberVO);
	}
	
}
