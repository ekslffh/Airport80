<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<c:set var="recReq" value="${paging.dataList }" />
											<c:if test="${empty recReq }">
												<tr>
													<td colspan="10">요청내용 없음.</td>
												</tr>
											</c:if>
											<c:if test="${not empty recReq}">
												<c:forEach items="${recReq }" var="recReq">
													<input type="hidden" value="${recReq.rrType}" />
													<tr>
														<td>${recReq.rrId }</td>
														<td>${recReq.zone.zoneFloor }층${recReq.zone.zoneCtgr }</td>
														<td class="content">${recReq.rrContent }</td>
														<td>${recReq.rrTs.toString().split(':')[0].replace('T', ' ')}:${recReq.rrTs.toString().split(':')[1]}</td>
														<td>${recReq.employee.empNm }</td>
														<td>${recReq.common.codeNm }</td>
														<td><c:choose>
																<c:when test="${recReq.rrStts == 'UN'}">
																	<button onclick="javascript:;"
																		data-who="${recReq.rrId}"
																		data-where="${recReq.zone.zoneCd}"
																		data-ca="${recReq.common.codeNm}"
																		data-bs-toggle="modal"
																		data-bs-target="#disablebackdrop" class="rncReqid">등록</button>
																	<button onclick="javascript:;" data-what="${recReq}"
																		data-rrid="${recReq.rrId }"
																		data-rr-content="${recReq.rrContent }"
																		data-rr-stts="${recReq.rrStts }"
																		data-bs-toggle="modal" data-bs-target="#companion"
																		class="rncReqid">반려</button>
																</c:when>
																<c:when test="${recReq.rrStts == 'CP' }">
																	<button onclick="javascript:;"
																		data-who="${recReq.rrId}"
																		data-where="${recReq.zone.zoneCd}"
																		data-ca="${recReq.common.codeNm}"
																		data-bs-toggle="modal"
																		data-bs-target="#disablebackdrop2" class="rncReqid">상세보기</button>
																</c:when>
															</c:choose></td>
													</tr>
												</c:forEach>
											</c:if>