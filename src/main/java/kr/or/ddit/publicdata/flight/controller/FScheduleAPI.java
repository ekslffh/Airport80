package kr.or.ddit.publicdata.flight.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;

import kr.or.ddit.operate.airline.service.AirlineService;
import kr.or.ddit.operate.vo.AirlineVO;
import kr.or.ddit.publicdata.flight.service.FSService;
import kr.or.ddit.vo.AirPortsVO;
import kr.or.ddit.vo.flightsadapter.flightsVO;

@Controller
public class FScheduleAPI {

	DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMddHHmm");
	DateTimeFormatter formatter2 = DateTimeFormatter.ofPattern("HH" + "00");
	DateTimeFormatter formatter3 = DateTimeFormatter.ofPattern("HH" + "59");
	DateTimeFormatter formatter4 = DateTimeFormatter.ofPattern("yyyy-MM-dd");
	LocalDateTime currentTime = LocalDateTime.now();
	LocalDateTime thirtyMinutesAgo = currentTime.minus(30, ChronoUnit.MINUTES);
	String formattedTime = thirtyMinutesAgo.format(formatter);
	long thisTime = Long.parseLong(formattedTime);

	String formattedHH = currentTime.format(formatter2);
	String formattedHA = currentTime.format(formatter3);
	String formattedDate = currentTime.format(formatter4);

	@Inject
	private FSService fsService;

	@Inject
	private AirlineService alService;

	// 도착
	@RequestMapping("/flights/flightArrivals")
	public String getArrivals(Model model, @RequestParam(value = "startDate", required = false) String startDate,
			@RequestParam(value = "startTime", required = false) String startTime,
			@RequestParam(value = "endTime", required = false) String endTime,
			@RequestParam(value = "selectAp", required = false) String selectAp,
			@RequestParam(value = "selectAl", required = false) String selectAl,
			@RequestParam(value = "skey", required = false) String skey) throws IOException {

		if (startDate == null || startDate.length() == 0) {
			startDate = formattedDate;
		}
		if (startTime == null || startTime.length() == 0) {
			startTime = formattedHH;
		}
		if (endTime == null || endTime.length() == 0) {
			endTime = formattedHA;
		}
		if (selectAp == null || selectAp.length() == 0) {
			selectAp = "";
		}

		String resultDate = "";
		try {
			// 입력된 문자열을 Date 객체로 파싱
			SimpleDateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd");
			Date date = inputFormat.parse(startDate);

			// 출력 형식을 지정
			SimpleDateFormat outputFormat = new SimpleDateFormat("yyyyMMdd");

			// 결과 문자열로 변환
			resultDate = outputFormat.format(date);

		} catch (ParseException e) {
			e.printStackTrace();
		}

		Long stTime = Long.parseLong(resultDate + startTime);
		Long edTime = Long.parseLong(resultDate + endTime);

		StringBuilder urlBuilder = new StringBuilder(
				"http://apis.data.go.kr/B551177/StatusOfPassengerFlightsDSOdp/getPassengerArrivalsDSOdp"); /* URL */
		urlBuilder.append("?" + URLEncoder.encode("serviceKey", "UTF-8") + "=f5uTFtjYfPdUktXwtn3RIcH3UmdM0Csspo1cvvo9b4l3csZH3Q6lyrwdQXJ00RFSA/ovqdnRfG9gLSbHhZBx3g=="); /*Service Key*/
		urlBuilder.append("&" + URLEncoder.encode("airport_code", "UTF-8") + "=" + URLEncoder.encode(selectAp, "UTF-8")); /* 공항 코드 */
		urlBuilder.append("&" + URLEncoder.encode("type", "UTF-8") + "=" + URLEncoder.encode("json", "UTF-8")); /* 응답유형 [xml, json] default=xml */
		URL url = new URL(urlBuilder.toString());
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Content-type", "application/json");
		BufferedReader rd;
		if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
			rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		} else {
			rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
		}
		StringBuilder sb = new StringBuilder();
		String line;
		while ((line = rd.readLine()) != null) {
			sb.append(line);
		}
		rd.close();
		conn.disconnect();

		Gson gson = new Gson();
		JsonObject response = gson.fromJson(sb.toString(), JsonObject.class).getAsJsonObject("response");
		JsonObject body = response.getAsJsonObject("body");
		JsonArray items = body.getAsJsonArray("items");

		List<flightsVO> flightList = new ArrayList<>();

		for (JsonElement item : items) {
			flightsVO flight = gson.fromJson(item, flightsVO.class);

			// 검색조건 검색
			Long flihgtTime = 0L;
			if (flight.getEstimatedDateTime() == null || startDate.length() == 0) {
				flihgtTime = Long.parseLong(flight.getScheduleDateTime());
			} else {
				flihgtTime = Long.parseLong(flight.getEstimatedDateTime());
			}

			if (flihgtTime < stTime || flihgtTime > edTime) {
				continue;
			}

			String result = flight.getFlightId().substring(0, 2);
			if (selectAl != null && !selectAl.isEmpty() && !result.equals(selectAl)) {
				continue;
			}

			if (skey != null && !skey.isEmpty() && !flight.getFlightId().contains(skey)) {
				continue;
			}

			SimpleDateFormat inputFormat = new SimpleDateFormat("yyyyMMddHHmm"); // 입력 형식
			SimpleDateFormat outputFormat = new SimpleDateFormat("HH:mm"); // 출력 형식

			try {
				Date date = inputFormat.parse(flight.getEstimatedDateTime());
				String formattedTime = outputFormat.format(date);
				flight.setEstimatedDateTime(formattedTime);
			} catch (ParseException e) {
				e.printStackTrace();
			}

			try {
				Date date = inputFormat.parse(flight.getScheduleDateTime());
				String formattedTime = outputFormat.format(date);
				flight.setScheduleDateTime(formattedTime);
			} catch (ParseException e) {
				e.printStackTrace();
			}

			String logo = "https://img.freepik.com/premium-vector/airplane-aviation-vector-logo-design-concept-airline-logo-plane-travel-icon-airport-flight-world-aviation_565585-7642.jpg?w=2000";
			if (alService.getLogo(result) != null && !alService.getLogo(result).equals("")) {
				logo = alService.getLogo(result);
			}

			flight.setLogo(logo);

			flightList.add(flight);

		}

		List<AirPortsVO> apList = fsService.selectAirportList();
		List<AirlineVO> alList = fsService.selectAirlineList();

		model.addAttribute("startDate", startDate);
		model.addAttribute("startTime", startTime);
		model.addAttribute("endTime", endTime);
		model.addAttribute("selectAp", selectAp);
		model.addAttribute("selectAl", selectAl);
		model.addAttribute("skey", skey);
		model.addAttribute("airport", apList);
		model.addAttribute("airline", alList);
		model.addAttribute("flights", flightList);

		return "open/flightSchedule/flightArSchedule";
	}

	// 출발
	@RequestMapping("/flights/flightDepartures")
	public String getDepartures(Model model, @RequestParam(value = "startDate", required = false) String startDate,
			@RequestParam(value = "startTime", required = false) String startTime,
			@RequestParam(value = "endTime", required = false) String endTime,
			@RequestParam(value = "selectAp", required = false) String selectAp,
			@RequestParam(value = "selectAl", required = false) String selectAl,
			@RequestParam(value = "skey", required = false) String skey) throws IOException {

		if (startDate == null || startDate.length() == 0) {
			startDate = formattedDate;
		}
		if (startTime == null || startTime.length() == 0) {
			startTime = formattedHH;
		}
		if (endTime == null || endTime.length() == 0) {
			endTime = formattedHA;
		}
		if (selectAp == null || selectAp.length() == 0) {
			selectAp = "";
		}

		String resultDate = "";
		try {
			// 입력된 문자열을 Date 객체로 파싱
			SimpleDateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd");
			Date date = inputFormat.parse(startDate);

			// 출력 형식을 지정
			SimpleDateFormat outputFormat = new SimpleDateFormat("yyyyMMdd");

			// 결과 문자열로 변환
			resultDate = outputFormat.format(date);

		} catch (ParseException e) {
			e.printStackTrace();
		}

		Long stTime = Long.parseLong(resultDate + startTime);
		Long edTime = Long.parseLong(resultDate + endTime);

		StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/B551177/StatusOfPassengerFlightsDSOdp/getPassengerDeparturesDSOdp"); /* URL */
		urlBuilder.append("?" + URLEncoder.encode("serviceKey", "UTF-8") + "=f5uTFtjYfPdUktXwtn3RIcH3UmdM0Csspo1cvvo9b4l3csZH3Q6lyrwdQXJ00RFSA/ovqdnRfG9gLSbHhZBx3g=="); /* ServiceKey */
		urlBuilder.append("&" + URLEncoder.encode("airport_code", "UTF-8") + "=" + URLEncoder.encode(selectAp, "UTF-8")); /* 공항 코드 */
		urlBuilder.append("&" + URLEncoder.encode("type", "UTF-8") + "=" + URLEncoder.encode("json", "UTF-8")); /* 응답유형 [xml, json] default=xml */
		URL url = new URL(urlBuilder.toString());
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Content-type", "application/json");
		BufferedReader rd;
		if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
			rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		} else {
			rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
		}
		StringBuilder sb = new StringBuilder();
		String line;
		while ((line = rd.readLine()) != null) {
			sb.append(line);
		}
		rd.close();
		conn.disconnect();

		Gson gson = new Gson();
		JsonObject response = gson.fromJson(sb.toString(), JsonObject.class).getAsJsonObject("response");
		JsonObject body = response.getAsJsonObject("body");
		JsonArray items = body.getAsJsonArray("items");

		List<flightsVO> flightList = new ArrayList<>();

		for (JsonElement item : items) {
			flightsVO flight = gson.fromJson(item, flightsVO.class);

			// 검색조건 검색

			Long flihgtTime = 0L;
			if (flight.getEstimatedDateTime() == null || startDate.length() == 0) {
				flihgtTime = Long.parseLong(flight.getScheduleDateTime());
			} else {
				flihgtTime = Long.parseLong(flight.getEstimatedDateTime());
			}

			if (flihgtTime < stTime || flihgtTime > edTime) {
				continue;
			}

			String result = flight.getFlightId().substring(0, 2);
			if (selectAl != null && !selectAl.isEmpty() && !result.equals(selectAl)) {
				continue;
			}

			if (skey != null && !skey.isEmpty() && !flight.getFlightId().contains(skey)) {
				continue;
			}

			SimpleDateFormat inputFormat = new SimpleDateFormat("yyyyMMddHHmm"); // 입력 형식
			SimpleDateFormat outputFormat = new SimpleDateFormat("HH:mm"); // 출력 형식

			try {
				Date date = inputFormat.parse(flight.getEstimatedDateTime());
				String formattedTime = outputFormat.format(date);
				flight.setEstimatedDateTime(formattedTime);
			} catch (ParseException e) {
				e.printStackTrace();
			}

			try {
				Date date = inputFormat.parse(flight.getScheduleDateTime());
				String formattedTime = outputFormat.format(date);
				flight.setScheduleDateTime(formattedTime);
			} catch (ParseException e) {
				e.printStackTrace();
			}

			String logo = "https://img.freepik.com/premium-vector/airplane-aviation-vector-logo-design-concept-airline-logo-plane-travel-icon-airport-flight-world-aviation_565585-7642.jpg?w=2000";
			if (alService.getLogo(result) != null && !alService.getLogo(result).equals("")) {
				logo = alService.getLogo(result);
			}

			flight.setLogo(logo);

			flightList.add(flight);

		}

		List<AirPortsVO> apList = fsService.selectAirportList();
		List<AirlineVO> alList = fsService.selectAirlineList();

		model.addAttribute("startDate", startDate);
		model.addAttribute("startTime", startTime);
		model.addAttribute("endTime", endTime);
		model.addAttribute("selectAp", selectAp);
		model.addAttribute("selectAl", selectAl);
		model.addAttribute("skey", skey);
		model.addAttribute("airport", apList);
		model.addAttribute("airline", alList);
		model.addAttribute("flights", flightList);

		return "open/flightSchedule/flightDeSchedule";
	}

	@RequestMapping(value = "/simpleFS", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public List<flightsVO> getsimple(@RequestParam("req") String req, @RequestParam("name") String name,
			@RequestParam("aod") String aod) throws IOException {

		List<flightsVO> flightList = new ArrayList<>();

		StringBuilder urlBuilder = new StringBuilder("");
		if (aod.equals("start")) {
			urlBuilder.append("http://apis.data.go.kr/B551177/StatusOfPassengerFlightsDSOdp/getPassengerDeparturesDSOdp"); /* URL */
		} else if (aod.equals("end")) {
			urlBuilder.append("http://apis.data.go.kr/B551177/StatusOfPassengerFlightsDSOdp/getPassengerArrivalsDSOdp"); /* URL */
		} else {
			return flightList;
		}
		urlBuilder.append("?" + URLEncoder.encode("serviceKey", "UTF-8")
				+ "=f5uTFtjYfPdUktXwtn3RIcH3UmdM0Csspo1cvvo9b4l3csZH3Q6lyrwdQXJ00RFSA/ovqdnRfG9gLSbHhZBx3g=="); /* Service Key */
		urlBuilder.append("&" + URLEncoder.encode("type", "UTF-8") + "="
				+ URLEncoder.encode("json", "UTF-8")); /* 응답유형 [xml, json] default=xml */
		URL url = new URL(urlBuilder.toString());
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Content-type", "application/json");
		BufferedReader rd;
		if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
			rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		} else {
			rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
		}
		StringBuilder sb = new StringBuilder();
		String line;
		while ((line = rd.readLine()) != null) {
			sb.append(line);
		}
		rd.close();

		conn.disconnect();

		Gson gson = new Gson();
		JsonObject response = gson.fromJson(sb.toString(), JsonObject.class).getAsJsonObject("response");
		JsonObject body = response.getAsJsonObject("body");
		JsonArray items = body.getAsJsonArray("items");

		int maxIterations = Math.min(items.size(), 3);
		int y = 0;
		for (int i = 0; i < maxIterations && y < items.size(); i++) {
			JsonElement item = items.get(y);
			y++;
			String itemAsString = item.toString();
			// 특정 문자열이 포함되어 있는지 확인
			if (itemAsString.contains(name)) {
				// 특정 문자열이 포함되어 있음
				flightsVO flight = gson.fromJson(item, flightsVO.class);
				long dt = Long.parseLong(flight.getScheduleDateTime());
				if (thisTime <= dt) {
					flightList.add(flight);
				} else {
					i--;
					continue;
				}
			} else {
				// 특정 문자열이 포함되어 있지 않음
				i--;
				continue;
			}

		}

		return flightList;
	}

}
