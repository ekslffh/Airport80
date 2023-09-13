package kr.or.ddit.common.schedule.service;

import java.util.List;

import kr.or.ddit.common.vo.ScheduleVO;
import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.exception.PKNotFoundException;

public interface ScheduleService {
	
	public ServiceResult createSchedule(ScheduleVO schedule);
	
	public ScheduleVO retrieveSchedule(String scheduleId) throws PKNotFoundException;
	
	public List<ScheduleVO> retrieveScheduleList(String scheTarget);
	
	public ServiceResult modifySchedule(ScheduleVO schedule);
	
	public int removeSchedule(String scheduleId);
	

}
