<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<security:authentication property="principal.realUser" var="authMember" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<input type="hidden" name="rrType" value="${req.rrType}"/>
	<table class="table table-bordered">
		<tr>
			<th class="table-light">요청ID</th>
			<td>${req.rrId }</td>
			<th class="table-light">작성자</th>
			<td>${req.rrAcc }</td>
		</tr>
		<tr>
			<th class="table-light">카테고리</th>
			<td><div value="${req.rrType }">${req.common.codeNm}</div></td>
			<th class="table-light">위치</th>
			<td>${req.zone.zoneFloor }층${req.zone.zoneCtgr }</td>
		</tr>
		<tr>
			<th class="table-light">발생일시</th>
			<td>${req.rrOccurTs.toString().replace('T',' ') }</td>
			<th class="table-light">요청일시</th>
			<td>${req.rrTs.toString().split(':')[0].replace('T', ' ')}:${req.rrTs.toString().split(':')[1]}</td>
		</tr>
		<tr>
			<th class="table-light">요청내용</th>
			<td colspan="3">${req.rrContent }</td>
		</tr>
		<tr>
			<th class="table-light">첨부<br>이미지</th>
			<td colspan="3">
				<%-- 			<img src="${reqList.rrImg }" alt="첨부이미지"></td> --%> <img
				src="${pageContext.request.contextPath }/resources/images/rncReq/${req.fileGroup.detailList[0].fiNm}"
				alt="첨부이미지" 
				width="370"
     			height="auto"/>
		</tr>
	</table>
	