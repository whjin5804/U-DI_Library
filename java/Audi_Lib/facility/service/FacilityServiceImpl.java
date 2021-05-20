package Audi_Lib.facility.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import Audi_Lib.facility.vo.FacilityVO;
import Audi_Lib.facility.vo.LectureVO;
import Audi_Lib.facility.vo.StudyRoomInfoVO;
import Audi_Lib.facility.vo.StudyRoomRentInfoVO;
import Audi_Lib.facility.vo.StudyRoomViewVO;
import Audi_Lib.home.vo.PagingVO;
import oracle.net.aso.e;
import oracle.net.aso.s;

@Service("facilityService")
public class FacilityServiceImpl implements FacilityService{

	@Autowired
	SqlSessionTemplate sqlSession;

	//주차장 예약
	@Override
	@Transactional(noRollbackFor = Exception.class)
	public int reserveParking(FacilityVO facilityVO) {
		
		
		//주차되어있는지 확인
		FacilityVO result = sqlSession.selectOne("isParking", facilityVO);
		if(result == null) {
			//포인트가 몇점인지 확인
			int point = sqlSession.selectOne("howManyPoint", facilityVO);
			
			if(point < 100) {
				System.out.println("결제하겠습니다.");
				return 2; //결제창으로 이동
			}else {
				//포인트 깎는 쿼리짜기
				sqlSession.update("dropPointOfParking", facilityVO);
				//예약정보 insert
				sqlSession.insert("reserveParking", facilityVO);
				return 3;
			}
		}
		else {
			return 1;
		}
	}

	@Override
	public List<FacilityVO> selectParkingOfParkingDate(FacilityVO facilityVO) {
		return sqlSession.selectList("selectParkingOfParkingDate", facilityVO);
	}

	@Override
	public List<StudyRoomInfoVO> selectStudyRoomList() {
		return sqlSession.selectList("selectStudyRoomList");
	}

	@Override
	public List<LectureVO> selectLectureList(LectureVO lectureVO) {
		return sqlSession.selectList("selectLectureList", lectureVO);
	}

	
	@Override
	public LectureVO selectDetailLecture(LectureVO lectureVO) {
		return sqlSession.selectOne("selectDetailLecture", lectureVO);
	}
	
	@Override
	public int countBoard() {
		return sqlSession.selectOne("countBoard");
	}

	@Override
	public List<LectureVO> selectBoard(PagingVO pagingVO) {
		return sqlSession.selectList("selectLectureInfo", pagingVO);
	}

	  //스터디룸 예약 넣기
	   @Override
	   @Transactional(rollbackFor = Exception.class)
	   public int insertRentDate(StudyRoomRentInfoVO studyRoomRentInfoVO) {

	      //해당날짜의 예약이 4번이상이면 예약불가라고 알림
	      studyRoomRentInfoVO.setFullRentDate(studyRoomRentInfoVO.getRentDate());
	      int num = sqlSession.selectOne("countReserveOfMemberDate", studyRoomRentInfoVO);
	      if(num >= 4) {
	         return 1;
	      }
	      
	      List<String> result = studyRoomRentInfoVO.getRentTime();
	      if(result == null) {
	    	  return 3; //시간선택안함
	      }
	      
	      String rentDate = studyRoomRentInfoVO.getRentDate();
	      for (int i = 0; i < result.size() / 2; i++) {
	         studyRoomRentInfoVO.setRentDate("");
	         studyRoomRentInfoVO.setRentDate(rentDate + "" + result.get(i));
	         sqlSession.insert("insertRentDate", studyRoomRentInfoVO);
	      }
	      return 2;
	      
	   }


	//시간을 하나씩 뽑아서 selectOne해온 객체를 리스트에 담아서 return
	@Override
	@Transactional(rollbackFor = Exception.class)
	public List<StudyRoomRentInfoVO> selectIsTime(StudyRoomRentInfoVO studyRoomRentInfoVO) {
		List<String> result = studyRoomRentInfoVO.getRentTime();
		List<StudyRoomRentInfoVO> list = new ArrayList<>();
		String isRentDate = "";
		
		StudyRoomRentInfoVO studyRoomRentInfoVO2 = new StudyRoomRentInfoVO();
		
		String rentDate = studyRoomRentInfoVO.getRentDate();
		for (int i = 0; i < result.size(); i++) {
			studyRoomRentInfoVO.setRentDate("");
			studyRoomRentInfoVO.setRentDate(rentDate + "" + result.get(i));
			studyRoomRentInfoVO2 = sqlSession.selectOne("selectIsTime", studyRoomRentInfoVO);
			if (studyRoomRentInfoVO2 != null) {
				list.add(studyRoomRentInfoVO2);
			}
			else {
				System.out.println("널");
			}
			
		}
		return list;
	}

	//예약자가 해당일짜에 예약했는지 확인
	@Override
	public int isParkingTodayOfPerson(FacilityVO facilityVO) {
		return sqlSession.selectOne("isParkingTodayOfPerson", facilityVO);
	}

	//결제 이후 insert
	@Override
	public void reserveParkingAfterPay(FacilityVO facilityVO) {
		sqlSession.insert("reserveParking", facilityVO);
	}

	//주차장 예약취소
	@Override
	public int cancelReserve(FacilityVO facilityVO) {
		sqlSession.update("updatePointBecauseCancelReserve", facilityVO);
		return sqlSession.delete("cancelReserve", facilityVO);
	}


	
}
