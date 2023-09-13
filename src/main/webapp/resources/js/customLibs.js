// 플러그인 : jQuery가 있어야만 사용가능!

$.fn.serializeObject = function() {
	let data = {};
	let nameSet = new Set();
	// 		this is jQuery object
	this.find(":input[name]").each((idx, ipt) => {
		nameSet.add(ipt.name);
	});
	let $formThis = this;
	nameSet.forEach(n => {
		let $ipt = $formThis.find(`:input[name=${n}]`)
		let type = $ipt.attr("type");
		let value = null;
		if (type == "radio") {
			value = $ipt.filter((idx, rdoIpt) => {
				return rdoIpt.checked;
			}).val();
		} else if (type == "checkbox") {
			value = $ipt.filter((idx, chkIpt) => chkIpt.checked)
				.get()
				.map(i => i.value)
		} else if (type == "number") {
			value = $ipt.val(); // value 속성 값을 반환. (attribute는 String 타입.)
			value = parseInt(value);
		} else {
			value = $ipt.val(); // value 속성 값을 반환. (attribute는 String 타입.)	
		}
		data[n] = value;
	});
	return data;
};

$.timeFormat = function(time) {
	// formatting : 1:59
	if ((time || time == 0) && time >= 0) {
		let minute = Math.trunc(time / 60);
		let second = time % 60;
		return `${new String(minute).padStart(2, '0')}:${new String(second).padStart(2, '0')}`;
	} else {
		throw new Error("시간 데이터는 0이상의 값이 필요함.");
	}
};

const speed = 100;

$.fn.timer = function() {
	this.each(function(index, element) {
		const $element = $(this);
		const timeout = $element.data("timeout");
		if (!timeout || !/^\d+$/.test(timeout)) throw new Error(`타이머는(${timeout}) 숫자로 구성됨.`);
		/*
		타이머의 조건
		1. 타이머 초기값
		2. 1초마다 타이머를 차감
			1) 차감된 값을 유지할 수 있는 프로퍼티
			2) 차감을 시키기 위한 스케쥴링 작업
		3. 차감되는 타이머 값은 매 시점마다 타이머의 영역에 출력.
		4. 타이머의 값은 02:00 과 같은 형태로 출력.
		5. optional : 필요하다면 타이머 영역 다음에 메시지 창을 생성함., 해당 메시지는 1분 남은 시점에 랜더링함.
			1) 메시지 영역 프로퍼티 추가
			2) 메시지 처리를 위한 지연 작업 스케쥴링.
		*/
		function TimerInfo(timeout, timerArea, msgFlag=false) {
			this.timeout = timeout -1;
			this.timerArea = timerArea;
			
			let _makeMessageDiv = function(element) {
				let $messageDiv = $('<div>').addClass("message-area").append(
					$("<p>").html("세션 연장 여부 확인"),
					$("<input>").attr({
						type: "button",
						value: "예"
					}).addClass("controlBtn").data("role", "yesBtn"),
					$("<input>").attr({
						type: "button",
						value: "아니오"
					}).addClass("controlBtn").data("role", "noBtn")
				).on("click", ".controlBtn",function(event) {
					let $btn = $(event.target);
					let role = $btn.data('role');
					if (role == 'yesBtn') {
						
						$.ajax({
							url: element.dataset.requestUrl ?? "",
							method: "head"
						}).done(() => {
							// 타이머값도 초기화, 메시지 작업도 초기화.
							element._timerInfo.init();				
						});
					}
					$btn.parents(".message-area").remove();
					/*delete element._timerInfo.$messageArea;
					delete element._timerInfo.messageJob;*/
					
				}).hide().insertAfter(element);
				return $messageDiv;
			};
			
			this.init = function() {
				this.timer = timeout;
				if (msgFlag) {
					this.$messageArea = _makeMessageDiv(this.timerArea);
					this.messageJob = setTimeout((function() {
						this.$messageArea.show();
					}).bind(this), (this.timeout - 60) * speed);
				}
			};
			
			this.init();
			
			this.destroy = function() {
				clearInterval(this.timerJob);
				if (this.$messageArea) {
					this.$messageArea.remove();
					clearTimeout(this.messageJob);
				}
				
				console.log("delete 전 : ", this.timerArea._timerInfo);
				delete this.timerArea._timerInfo;
				console.log("delete 후 : ", this.timerArea._timerInfo);
			}
			this.timerJob = setInterval((function() {
				if (this.timer <= 0) {
						this.destroy();
				} else {
					this.timerArea.innerHTML = $.timeFormat(--this.timer);
				}
			}).bind(this), 1*speed);
		}
		const msgFlag = $element.data("msgFlag");
		element._timerInfo = new TimerInfo(timeout, element, msgFlag);
		console.log(element._timerInfo);
	});
	return this;
};