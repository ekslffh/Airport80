package kr.or.ddit.vo.calendaradapter;

import java.time.LocalDateTime;

import kr.or.ddit.common.vo.ScheduleVO;

public class ScheduleWrapper extends FullCalendarEvent<ScheduleVO>{

	public ScheduleWrapper(ScheduleVO adaptee) {
		super(adaptee);
	}

	@Override
	public String getId() {
		return getData().getScheId();
	}

	@Override
	public String getTitle() {
		return getData().getScheTitle();
	}

	@Override
	public LocalDateTime getStart() {
		return getData().getScheStartDt().atStartOfDay();
	}

	@Override
	public LocalDateTime getEnd() {
		return getData().getScheEndDt().plusDays(1).atStartOfDay();
	}

	@Override
	public String getColor() {
		String target = getData().getScheTarget();
		String color = "";
		if (target.equals("0000")) {
			color = "green";
		}
		return color;
	}
	
	@Override
	public String getLocation() {
		return getData().getScheLoc();
	}

}
