package kr.or.ddit.common.schedule.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.common.schedule.dao.ScheduleDAO;
import kr.or.ddit.common.vo.ScheduleVO;
import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.exception.PKNotFoundException;

@Service
public class ScheduleServiceImpl implements ScheduleService {

	@Inject
	private ScheduleDAO dao;

	@Override
	public ServiceResult createSchedule(ScheduleVO schedule) {
		return dao.insertSchedule(schedule) > 0 ? ServiceResult.OK : ServiceResult.FAIL;
	}

	@Override
	public ScheduleVO retrieveSchedule(String scheduleId) throws PKNotFoundException {
		return dao.selectSchedule(scheduleId);
	}

	@Override
	public List<ScheduleVO> retrieveScheduleList(String scheTarget) {
		return dao.selectScheduleList(scheTarget);

	}

	@Override
	public ServiceResult modifySchedule(ScheduleVO schedule) {
		return dao.updateSchedule(schedule) > 0 ? ServiceResult.OK : ServiceResult.FAIL;
	}

	@Override
	public int removeSchedule(String scheduleId) {
		return dao.deleteSchedule(scheduleId);
	}

}
