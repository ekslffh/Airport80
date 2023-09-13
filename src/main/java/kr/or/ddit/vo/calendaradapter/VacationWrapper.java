package kr.or.ddit.vo.calendaradapter;

import java.time.LocalDateTime;

import kr.or.ddit.common.vo.ScheduleVO;
import kr.or.ddit.hr.vo.VacationReqVO;

public class VacationWrapper extends FullCalendarEvent<VacationReqVO>{

	public VacationWrapper(VacationReqVO adaptee) {
		super(adaptee);
	}

	@Override
	public String getId() {
		return getData().getVrId();
	}

	@Override
	public String getTitle() {
		
		String name = getData().getEmpNm();
		String vrType = getData().getVrType();
		String title = "";
		if (vrType.equals("SK")) {
			title = name + ": 병가";
		}
		if (vrType.equals("PD")) {
			title = name + ": 공가";
		}
		if (vrType.equals("AL")) {
			title = name + ": 연차";
		}
		if (vrType.equals("PL")) {
			title = name + ": 출산";
		}
		if (vrType.equals("FE")) {
			title = name + ": 경조사";
		}
		if (vrType.equals("UP")) {
			title = name + ": 무급";
		}
		return title;
	}

	@Override
	public LocalDateTime getStart() {
		return getData().getVrStartTs().atStartOfDay();
	}

	@Override
	public LocalDateTime getEnd() {
		return getData().getVrEndTs().plusDays(1).atStartOfDay();
	}

	@Override
	public String getColor() {
		String target = getData().getVrType();
		String color = "";
		if (target.equals("AL")) {
			color = "lightgreen";
		}
		else if (target.equals("PD")) {
			color = "pink";
		} 
		else if (target.equals("PL")) {
			color = "lightblue";
		}
		else if (target.equals("FE")) {
			color = "orange";
		} 
		else if (target.equals("UP")) {
			color = "gray";
		}
		else if (target.equals("SK")) {
			color = "red";
		}
		return color;
	}

	@Override
	public String getLocation() {
		return getData().getVrPeriod();
	}	

}
