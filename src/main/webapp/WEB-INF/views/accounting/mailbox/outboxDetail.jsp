<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.pagetitle {
	margin-top: 18px;
	margin-left: 5%;
}

.card {
	margin-top: 18px;
	margin-right: 20%;
	margin-left: 5%;
}
</style>


<c:if test="${not empty error}">
	<p style="color: red;">${error}</p>
</c:if>

<section class="section">
	<div class="row">
		<div class="col-lg-12">
			<div class="card">
				<div class="card-body">
					<!-- 게시판 헤더 영역 시작 -->
					<div class="card-header" style="padding-bottom: 5px; margin-bottom: 15px;}">
					    <h5 class="card-tit">보낸 메일 상세보기</h5>
					    <nav>
					      <ol class="breadcrumb">
					        <li class="breadcrumb-item"><a href="${pageContext.request.contextPath }/in"><i class="bi bi-house-door"></i></a></li>
					        <li class="breadcrumb-item"><a href="#">메일</a></li>
					        <li class="breadcrumb-item"><a href="javascript:void(0);" onclick="history.back();">보낸 메일함</a></li>
					        <li class="breadcrumb-item active">보낸 메일 상세보기</li>
					      </ol>
					    </nav>
				    </div>
				    <!-- 게시판 헤더 영역 끝 -->
					
					<table>
						<thead class="table-light">
							<tr>
								<th>보낸이:</th>
								<td>${from}</td>
							</tr>
							<tr>
							    <th>받는이:</th>
							    <td>
							        <c:forEach items="${recipients}" var="recipient" varStatus="recipientStatus">
							            ${recipient}
							            <c:if test="${!recipientStatus.last}">, </c:if>
							        </c:forEach>
							    </td>
							</tr>
							<tr>
								<th>제목:</th>
								<td>${subject}</td>
							</tr>
							<tr>
								<th>수신일:</th>
								<td>${sentDate}</td>
							</tr>
						</thead>
					</table>

					<hr>

					<c:choose>
						<c:when test="${not empty content}">
							<h3>내용:</h3>
							<pre>${content}</pre>
						</c:when>
						<c:otherwise>
							<p>내용 없음</p>
						</c:otherwise>
					</c:choose>


					<h3>첨부파일:</h3>
					<c:choose>
						<c:when test="${not empty attachments}">
							<c:forEach var="attachment" items="${attachments}">
								<p>
									<a
										href="<c:url value='/account/mail/outdownloadAttachment.do'/>?messageIndex=${messageIndex}&attachmentIndex=${attachments.indexOf(attachment)}">${attachment}</a>
								</p>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<p>첨부파일 없음</p>
						</c:otherwise>
					</c:choose>

				</div>
			 <a href="javascript:void(0);" onclick="history.back();" class="btn btn-dark" style="float: right; margin-right: 10px;">목록으로</a>
			</div>

		</div>

	</div>
</section>



