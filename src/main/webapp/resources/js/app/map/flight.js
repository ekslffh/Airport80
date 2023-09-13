const api_key = "5e072b84-d2a4-41c0-a5bb-c7eab93fbd02";
const api_base = "https://airlabs.co/api/v9/";

function apiCall(method, params, cb) {
  params.api_key = api_key;
  fetch(`${api_base}${method}`, {
    method: "POST",
    headers: {
      "Content-Type": "application/x-www-form-urlencoded"
    },
    body: new URLSearchParams(params)
  })
    .then(response => response.text())
    .then(data => cb(null, data))
    .catch(error => cb(error, null));
}

let map;

let markers = []; // 마커를 저장할 배열

async function initMap() {
  const myLatLng = { lat: 37.4692, lng: 126.4505 };
  const { Map } = await google.maps.importLibrary("maps");

  map = new google.maps.Map(document.getElementById("map"), {
    center: myLatLng,
    zoom: 10,
  });

// 이전에 생성된 마커들을 저장할 배열
let previousMarkers = [];

let flightInfo;
let prevFlightInfo = null;

function flInterval() {
	console.log("갱신");

	apiCall('flights', { arr_iata: 'ICN' }, (err, res) => {
		if (err) {
			console.error(err);
		} else {
			flightInfo = JSON.parse(res).response;
			if (prevFlightInfo == null) prevFlightInfo = flightInfo;
			console.log(flightInfo)

			flightInfo.forEach(f => {
				// 이전에 생성된 마커 중에서 같은 비행기를 찾습니다.
				const existingMarker = previousMarkers.find(marker => marker.getTitle() === f.flight_icao);

				if (existingMarker) {
					 // 이전에 생성된 마커가 있다면 위치를 업데이트합니다.
                    const currentPosition = new google.maps.LatLng(f.lat, f.lng);
                    const previousPosition = existingMarker.getPosition();

                    // 이전 위치와 현재 위치를 사용하여 폴리라인을 그립니다.
                    if (previousPosition && !previousPosition.equals(currentPosition)) {
                        const flightPath = new google.maps.Polyline({
                            path: [previousPosition, currentPosition],
                            geodesic: true,
                            strokeColor: '#FF0000', // 선 색상
                            strokeOpacity: 1.0, // 선 투명도
                            strokeWeight: 2 // 선 굵기
                        });
                        flightPath.setMap(map);
                    }

                    existingMarker.setPosition(currentPosition);
				} else {
					// 이전에 생성된 마커가 없으면 새로운 마커를 그립니다.
					const canvas = document.createElement("canvas");
					const ctx = canvas.getContext("2d");
					canvas.width = 20;
					canvas.height = 20;
					const image = new Image();
					// 이제 contextPath 변수에 서버 사이드 경로를 가지고 있습니다.
					const imageUrl = "/Airport80/resources/images/map/airplane_icon.png";
					image.src = imageUrl;

					image.onload = () => {
						ctx.save();
						ctx.translate(canvas.width / 2, canvas.height / 2);
						ctx.rotate(f.dir * Math.PI / 180); // 이미지 회전 각도 설정
						ctx.drawImage(image, -canvas.width / 2, -canvas.height / 2, canvas.width, canvas.height);
						ctx.restore();

						const rotatedIcon = canvas.toDataURL();

						const markerOptions = {
							position: new google.maps.LatLng(f.lat, f.lng),
							map,
							title: f.flight_icao,
							icon: {
								url: rotatedIcon,
								anchor: new google.maps.Point(15, 15),
							}
						};
						
						const newMarker = new google.maps.Marker(markerOptions);
						previousMarkers.push(newMarker); // 배열에 추가

						const infoWindow = new google.maps.InfoWindow({
						content: `
								<div>
			                      <h2>${f.flight_icao}</h2>
			                      <p>항공기 : ${f.reg_number}</p>
			                      <p>항공사 : ${f.airline_icao}</p>
			                      <p>출발 공항 : ${f.dep_iata}</p>
			                      <p>도착 공항 : ${f.arr_iata}</p>
			                      <p>비행 상태 : ${f.status}</p>
			                      <p>비행 고도 : ${f.alt}</p>
			                      <p>비행 방향 : ${f.dir}</p>
			                      <p>현재 위도 : ${f.lat}</p>
			                      <p>비행 경도 : ${f.lng}</p>
			                      <p>속도 : ${f.speed}</p>
		                   		 </div>`,
						});

						newMarker.addListener("click", () => {
							infoWindow.open(map, newMarker);
						});
					};
				}
			});

			// 새로운 데이터를 받아온 후에 이전 마커 배열을 업데이트합니다.
			previousMarkers = previousMarkers.filter(marker => {
				return flightInfo.some(f => marker.getTitle() === f.flight_icao);
			});
			
			// 테이블 그려주기?
			const flightTable = createFlightTable(prevFlightInfo, flightInfo);
			$("#flightInfo").html(flightTable);
			prevFlightInfo = flightInfo;
		}
	});
}

function createFlightTable(prevData, data) {
  const table = document.createElement("table");
  table.classList.add("table", "table-striped");

  table.innerHTML = `
    <thead>
      <tr>
        <th>항공편</th>
        <th>항공기</th>
        <th>항공사</th>
        <th>출발 공항</th>
        <th>도착 공항</th>
        <th>비행 상태</th>
        <th>비행 고도</th>
        <th>비행 방향</th>
        <th>현재 위도</th>
        <th>비행 경도</th>
        <th>속도</th>
      </tr>
    </thead>
    <tbody>
      ${data.map(f => {
        const prevFlight = prevData.find(prev => prev.flight_icao === f.flight_icao);
        const isNew = !prevFlight; // 이전 데이터에 없으면 새로운 데이터로 간주

        // 데이터 비교 및 스타일 설정
		let trStyle = "";
        let altStyle = "";
        let dirStyle = "";
        let latStyle = "";
        let lngStyle = "";
        let speedStyle = "";

		  if (isNew) {
			  trStyle = "background-color: yellow;"; // 새로운 데이터는 노란색 배경
		  } else {
			  trStyle = "";
			  if (f.alt > prevFlight.alt) {
				  altStyle = "color: red;";
			  } else if (f.alt < prevFlight.alt) {
				  altStyle = "color: blue;";
			  }

			  // 다른 항목들에 대해서도 동일하게 비교 및 스타일 설정
			  if (f.dir > prevFlight.dir) {
				  dirStyle = "color: red;";
			  } else if (f.dir < prevFlight.dir) {
				  dirStyle = "color: blue;";
			  }

			  if (f.lat > prevFlight.lat) {
				  latStyle = "color: red;";
			  } else if (f.lat < prevFlight.lat) {
				  latStyle = "color: blue;";
			  }

			  if (f.lng > prevFlight.lng) {
				  lngStyle = "color: red;";
			  } else if (f.lng < prevFlight.lng) {
				  lngStyle = "color: blue;";
			  }
	
			  if (f.speed > prevFlight.speed) {
				  speedStyle = "color: red;";
			  } else if (f.speed < prevFlight.speed) {
				  speedStyle = "color: blue;";
			  }

			  // 이전 데이터와 비교하여 변경되지 않았으면 검은색 텍스트
			  if (altStyle === "" && dirStyle === "" && latStyle === "" && lngStyle === "" && speedStyle === "") {
				  altStyle = dirStyle = latStyle = lngStyle = speedStyle = "color: black;";
			  }
		  }

          return `
	          <tr style="${trStyle}">
	            <td>${f.flight_icao}</td> 
	            <td>${f.reg_number}</td> 
	            <td>${f.airline_icao}</td>
	            <td>${f.dep_iata}</td>
	            <td>${f.arr_iata}</td>
	            <td>${f.status}</td>
	            <td style="${altStyle}">${f.alt}</td>
	            <td style="${dirStyle}">${f.dir}</td>
	            <td style="${latStyle}">${f.lat}</td>
	            <td style="${lngStyle}">${f.lng}</td>
	            <td style="${speedStyle}">${f.speed}</td>
	          </tr>
       		 `;
      }).join('')}
    </tbody>
  `;
  return table;
}

flInterval(); // 먼저 한 번 실행하고

setInterval(flInterval, 2000); // 5초마다 실행
}

initMap();