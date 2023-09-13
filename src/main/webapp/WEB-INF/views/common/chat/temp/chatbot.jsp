<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
body {
   font: 15px arial, sans-serif;
   background-color: #d9d9d9;
   padding-top: 15px;
   padding-bottom: 15px;
}

#bodybox {
   margin: auto;
   max-width: 550px;
   font: 15px arial, sans-serif;
   background-color: white;
   border-style: solid;
   border-width: 1px;
   padding-top: 20px;
   padding-bottom: 25px;
   padding-right: 25px;
   padding-left: 25px;
   box-shadow: 5px 5px 5px grey;
   border-radius: 15px;
}

#chatborder {
   border-style: solid;
   border-color: grey;
   background-color: #f6f9f6;
   border-width: 3px;
   margin-top: 20px;
   margin-bottom: 20px;
   margin-left: 20px;
   margin-right: 20px;
   padding-top: 10px;
   padding-bottom: 15px;
   padding-right: 20px;
   padding-left: 15px;
   border-radius: 15px;
}

#chatbox {
   font: 17px arial, sans-serif;
   height: 22px;
   width: 100%;
}

.chat {
    display: flex;
    flex-direction: column;
}

.message {
    margin: 5px;
    padding: 10px;
    border-radius: 10px;
    max-width: 70%;
    font-family: "Helvetica Neue", Helvetica, Arial, sans-serif; /* 원하는 글꼴로 변경 */
}

.chatbot {
    background-color: #f0f0f0; /* 남이 쓴 메시지 배경색 */
    align-self: flex-start;
    border: 1px solid #ccc; /* 테두리 스타일 */
}

.chatuser {
    background-color: #4caf50; /* 내가 쓴 메시지 배경색 */
    color: white; /* 내가 쓴 메시지 텍스트 색상 */
    border: 1px solid #4caf50; /* 테두리 스타일 */
    align-self: flex-end; /* 수직 정렬을 flex-end로 설정하여 오른쪽으로 붙임 */
}

h1 {
   margin: auto;
}

pre {
   background-color: #f0f0f0;
   margin-left: 20px;
}

#header {
    background-color: #87CEEB; /* 하늘색 */
    color: #fff;
    text-align: center; /* 텍스트를 가운데 정렬 */
    padding: 10px;
    border-top-left-radius: 10px; /* 위쪽 왼쪽 모서리에만 border-radius 적용 */
    border-top-right-radius: 10px; /* 위쪽 오른쪽 모서리에만 border-radius 적용 */
}

#botHeader {
    font-size: 20px; /* 헤더 텍스트의 크기를 작게 조정 */
    font-weight: bold; /* 텍스트를 굵게 만듦 */
    margin: 0; /* 상단 및 하단 여백 제거 */
}
</style>
</head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<script type="text/javascript">

   //스크롤을 맨 아래로 내리는 함수
   function scrollToBottom() {
       var chatDiv = document.getElementById("chatbotDiv");
       chatDiv.scrollTop = chatDiv.scrollHeight;
   }
   
   //links
   //http://eloquentjavascript.net/09_regexp.html
   //https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Regular_Expressions

   var messages = [], //array that hold the record of each string in chat
   lastUserMessage = "", //keeps track of the most recent input string from the user
   botMessage = "", //var keeps track of what the chatbot is going to say
   botName = 'Airbot', //name of the chatbot
   talking = true; //when false the speach function doesn't work
   //
   //
   //****************************************************************
   //****************************************************************
   //****************************************************************
   //****************************************************************
   //****************************************************************
   //****************************************************************
   //****************************************************************
   
   function typeText(idx, newDiv) {
      if (idx < botMessage.length) {
         console.log(newDiv.text());
         let curMsg = newDiv.text();
           curMsg += botMessage[idx];
           newDiv.text(curMsg);
           idx++;
           setTimeout(() => typeText(idx, newDiv), 100); // 한글자씩 찍히는 속도 조절
           scrollToBottom();
      }
   }
   
   //edit this function to change what the chatbot says
   function chatbotResponse() {
      $(loadingDiv).show();
      scrollToBottom();
      talking = true;
      botMessage = "I'm confused"; //the default message
      
      // 여기서 lastUserMessage를 컨트롤러로 보내서 chatgpt api를 통해서 응답을 생성한 후에 받고 그것을 채팅창에 표시하기
      
      // AJAX 요청 보내기
      let settings = {
          url: "${pageContext.request.contextPath }/chatbot/qna.do?question=" + lastUserMessage, // 요청할 URL
         method : "get",
         dataType: "text",
         success: function (responseData) {
            $(loadingDiv).hide();
               // 성공적인 응답 처리
               console.log("성공: " + responseData);
               botMessage = responseData;
               let newDiv = $('<div>').text('').addClass("message").addClass("chatbot");
               newDiv.insertBefore(loadingDiv);
            
               typeText(0, newDiv);
//                $("#chatbotDiv").append(newDiv);
               scrollToBottom();
           },
           error: function (errorResponse) {
               // 실패한 응답 처리
               console.error("실패: " + errorResponse.responseText);
               botMessage = errorResponse;
           }
      };

      $.ajax(settings);
   }
   
   //this runs each time enter is pressed.
   //It controls the overall input and output
   function newEntry() {
      //if the message from the user isn't empty then run 
      if (document.getElementById("chatbox").value != "") {
         //pulls the value from the chatbox ands sets it to lastUserMessage
         lastUserMessage = document.getElementById("chatbox").value;
         //sets the chat box to be clear
         document.getElementById("chatbox").value = "";
         
         let newDiv = $('<div>').text(lastUserMessage).addClass("message").addClass("chatuser");
         
//             $("#chatbotDiv").append(newDiv);

         newDiv.insertBefore($(loadingDiv));
         scrollToBottom();
         //adds the value of the chatbox to the array messages
         //Speech(lastUserMessage);  //says what the user typed outloud
         //sets the variable botMessage in response to lastUserMessage
         chatbotResponse();
         //add the chatbot's name and message to the array messages
         // says the message using the text to speech function written below
//          Speech(botMessage);
         //outputs the last few array elements of messages to html
      }
   }

   //text to Speech
   //https://developers.google.com/web/updates/2014/01/Web-apps-that-talk-Introduction-to-the-Speech-Synthesis-API
   function Speech(say) {
      if ('speechSynthesis' in window && talking) {
         var utterance = new SpeechSynthesisUtterance(say);
         //msg.voice = voices[10]; // Note: some voices don't support altering params
         //msg.voiceURI = 'native';
         //utterance.volume = 1; // 0 to 1
         //utterance.rate = 0.1; // 0.1 to 10
         //utterance.pitch = 1; //0 to 2
         //utterance.text = 'Hello World';
         //utterance.lang = 'en-US';
         speechSynthesis.speak(utterance);
      }
   }
   
//    Speech("반갑습니다. 여객 안내를 담당하고 있는 '에어봇'입니다. 채팅창에 질문을 입력해주세요!");

   //runs the keypress() function when a key is pressed
   document.onkeypress = keyPress;
   //if the key pressed is 'enter' runs the function newEntry()
   function keyPress(e) {
      var x = e || window.event;
      var key = (x.keyCode || x.which);
      if (key == 13 || key == 3) {
         //runs this function when enter is pressed
         newEntry();
      }
      if (key == 38) {
         console.log('hi')
         //document.getElementById("chatbox").value = lastUserMessage;
      }
   }

   //clears the placeholder text ion the chatbox
   //this function is set to run when the users brings focus to the chatbox, by clicking on it
   function placeHolder() {
      document.getElementById("chatbox").placeholder = "";
   }
</script>
<body>
<!--    <div id='bodybox'> -->
      <div id='chatborder'>
         <div id='header'>
            <h1 id="botHeader">에어봇(AirBot)</h1>
         </div>
         <div id="chatbotDiv" class="chat"
            style="height: 400px; overflow: auto; border: 1px solid #ccc;">
            <div class="message chatbot">안녕하세요! Airport:80 공항의 챗봇 서비스입니다. 무엇을 도와드릴까요?</div>
            <div id="loadingDiv" class="message chatbot placeholder-glow" style="width: 100%; display: none;">
               <span class="placeholder col-7"></span>
               <span class="placeholder col-4"></span>
               <span class="placeholder col-6"></span>
               <span class="placeholder col-5"></span>
            </div>
         </div>
         <br/>
         <input type="text" name="chat" id="chatbox" style="height: 40px;;"
            placeholder="질문사항을 입력해주세요" onfocus="placeHolder()">
      </div>
<!--    </div> -->
</body>
<script type="text/javascript">
	document.addEventListener("DOMContentLoaded", function () {
	  var chatElement = document.getElementById("chatbox");
	  if (chatElement) {
// 	    chatElement.focus();
	  } else {
	    console.error("Element with id 'chat' not found.");
	  }
	});
</script>
</html>