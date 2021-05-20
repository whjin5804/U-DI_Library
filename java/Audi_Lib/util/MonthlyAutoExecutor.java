package Audi_Lib.util;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import Audi_Lib.book.service.BookService;
import Audi_Lib.book.vo.MonthlyBookRankVO;

@Component
public class MonthlyAutoExecutor {
	
	@Resource(name = "bookService")
	private BookService bookService;
	//매월 1일 새벽 12시 00분 5초에 자동으로 월간 카운트 초기화, 월간 랭킹 등록하는 스케쥴러
	
	// * 을 입력할 경우 항상으로 설정함(cron = "초 분 시 일 월 요일")
	@Scheduled(cron = "5 0 0 1 * *")
	public void insertMonthlyRank() {
		List<String> rankedBookList = bookService.selectBookForInsertRank();
		MonthlyBookRankVO mbr = new MonthlyBookRankVO();
		mbr.setMonthlyRank(rankedBookList);
		bookService.insertBookRank(mbr);
	}
}
