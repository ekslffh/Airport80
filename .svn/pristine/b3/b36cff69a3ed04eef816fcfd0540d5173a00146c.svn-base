var checkInTime = null;
var checkOutTime = null;

function displayTime() {
	var now = new Date();
	var hours = now.getHours();
	var minutes = now.getMinutes();
	var seconds = now.getSeconds();
	var ampm = hours >= 12 ? 'PM' : 'AM';
	hours = hours % 12;
	hours = hours ? hours : 12;
	hours = ("0" + hours).slice(-2);
	minutes = ("0" + minutes).slice(-2);
	seconds = ("0" + seconds).slice(-2);
	var timeString = ampm + " " + hours + "시 " + minutes + "분 " + seconds + "초";
	var divElement = document.getElementById("timeDiv");
	divElement.textContent = timeString;
}

function updateTimeDisplay() {
	var checkInDisplay = document.getElementById("checkInDisplay");
	var checkOutDisplay = document.getElementById("checkOutDisplay");

	if (checkInTime) {
		checkInDisplay.textContent = checkInTime;
	}

	if (checkOutTime) {
		checkOutDisplay.textContent = checkOutTime;
	}
}

function sendCheckInOutRecord(inNout) {

	var time = '';
	var inout = inNout;

	if (checkInTime) {
		time = checkInTime;
	}
	if (checkOutTime) {
		time = checkOutTime;
	}

	$.ajax({
		url: '/Airport80/hr/attendance/checkIn',
		type: 'GET',
		dataType: 'json',
		data: {
			time: time,
			inout: inout
		},
		success: function(response) {
			// alert(response.result);
			// Swal.fire('Any fool can use a computer')
			if (response.disp == "OK") {
				updateTimeDisplay();
				Swal.fire({
					icon: 'success',
					title: response.result,
					showConfirmButton: false,
					timer: 1500
				}).then((result) => {
                    if (result.isConfirmed) {
                        location.reload();
                    }
                });
			} else {
				checkInTime = null;
				checkOutTime = null;
				Swal.fire({
					icon: 'info',
					title: response.result,
					showConfirmButton: false,
					timer: 1500
				})
			}
		},
		error: function(error) {
			console.error('Error saving record');
		}
	});
}

function twolength(n) {
	return (n < 10 ? '0' : '') + n
}


function onCheckInButtonClick() {
	var now = new Date();
	var hours = twolength(now.getHours());
	var minutes = twolength(now.getMinutes());
	var seconds = twolength(now.getSeconds());

	checkInTime = hours + ":" + minutes + ":" + seconds;
	sendCheckInOutRecord("in");
}

function onCheckOutButtonClick() {
	var now = new Date();
	var hours = twolength(now.getHours());
	var minutes = twolength(now.getMinutes());
	var seconds = twolength(now.getSeconds());

	checkOutTime = hours + ":" + minutes + ":" + seconds;
	sendCheckInOutRecord("out");
}

setInterval(displayTime, 1000);

$(document).ready(function() {
	var checkInButton = document.getElementById("checkInButton");
	var checkOutButton = document.getElementById("checkOutButton");

	checkOutButton.addEventListener("click", function() {
		onCheckOutButtonClick();
	});

});
