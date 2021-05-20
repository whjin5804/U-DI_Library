package Audi_Lib.facility.service;

import java.util.List;

import Audi_Lib.facility.vo.FacilityVO;
import Audi_Lib.facility.vo.LectureVO;
import Audi_Lib.facility.vo.StudyRoomInfoVO;
import Audi_Lib.facility.vo.StudyRoomRentInfoVO;
import Audi_Lib.facility.vo.StudyRoomViewVO;
import Audi_Lib.home.vo.PagingVO;

public interface FacilityService {

	int reserveParking(FacilityVO facilityVO);

	List<FacilityVO> selectParkingOfParkingDate(FacilityVO facilityVO);

	List<StudyRoomInfoVO> selectStudyRoomList();

	List<LectureVO> selectLectureList(LectureVO lectureVO);

	LectureVO selectDetailLecture(LectureVO lectureVO);

	// 게시물 총 갯수
	public int countBoard();

	// 페이징 처리 게시글 조회
	public List<LectureVO> selectBoard(PagingVO pagingVO);

	int insertRentDate(StudyRoomRentInfoVO studyRoomRentInfoVO);

	List<StudyRoomRentInfoVO> selectIsTime(StudyRoomRentInfoVO studyRoomRentInfoVO);

	int isParkingTodayOfPerson(FacilityVO facilityVO);

	void reserveParkingAfterPay(FacilityVO facilityVO);

	int cancelReserve(FacilityVO facilityVO);

}
