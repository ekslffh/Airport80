package kr.or.ddit.common.schedule.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.common.vo.ScheduleVO;

@Mapper
public interface ScheduleDAO {
	public int insertSchedule(ScheduleVO schedule);
	public ScheduleVO selectSchedule(String scheduleId);
	public List<ScheduleVO> selectScheduleList(String scheTarget);
	public int updateSchedule(ScheduleVO schedule);
	public int deleteSchedule(String scheId);
}
