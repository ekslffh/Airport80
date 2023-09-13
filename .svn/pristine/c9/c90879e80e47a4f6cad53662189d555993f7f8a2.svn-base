<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<c:set var="recReq" value="${paging.dataList }" />
											<c:if test="${empty ccp }">
												<tr>
													<td colspan="10">요청내용 없음.</td>
												</tr>
											</c:if>
											<c:if test="${not empty ccp}">
												<c:forEach items="${ccp }" var="ccp">
													<input type="hidden" value="${ccp.rrType}" />
													<tr>
														<td>${ccp.rrId }</td>
														<td>${ccp.zone.zoneFloor }층${ccp.zone.zoneCtgr }</td>
														<td class="content">${ccp.rrContent }</td>
														<td>${ccp.rrTs.toString().split(':')[0].replace('T', ' ')}:${ccp.rrTs.toString().split(':')[1]}</td>
														<td>${ccp.employee.empNm }</td>
														<td>${ccp.common.codeNm }</td>
														<td><c:choose>
																<c:when test="${ccp.rrStts == 'UN'}">
																	<button onclick="javascript:;"
																		data-who="${ccp.rrId}"
																		data-where="${ccp.zone.zoneCd}"
																		data-ca="${ccp.common.codeNm}"
																		data-bs-toggle="modal"
																		data-bs-target="#disablebackdrop" class="rncReqid">등록</button>
																	<button onclick="javascript:;" data-what="${ccp}"
																		data-rrid="${ccp.rrId }"
																		data-rr-content="${ccp.rrContent }"
																		data-rr-stts="${ccp.rrStts }"
																		data-bs-toggle="modal" data-bs-target="#companion"
																		class="rncReqid">반려</button>
																</c:when>
																<c:when test="${ccp.rrStts == 'CP' }">
																	<button onclick="javascript:;"
																		data-who="${ccp.rrId}"
																		data-where="${ccp.zone.zoneCd}"
																		data-ca="${ccp.common.codeNm}"
																		data-bs-toggle="modal"
																		data-bs-target="#disablebackdrop2" class="rncReqid">상세보기</button>
																</c:when>
															</c:choose></td>
													</tr>
												</c:forEach>
											</c:if>