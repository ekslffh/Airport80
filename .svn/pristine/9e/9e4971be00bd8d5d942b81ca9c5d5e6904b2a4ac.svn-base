<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 



<style>

<!--
 /* Font Definitions */
 @font-face
	{font-family:Gulim;
	panose-1:2 11 6 0 0 1 1 1 1 1;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:"Arial Unicode MS";
	panose-1:2 11 6 4 2 2 2 2 2 4;}
@font-face
	{font-family:"\@Gulim";
	panose-1:2 11 6 0 0 1 1 1 1 1;}
@font-face
	{font-family:"Malgun Gothic";
	panose-1:2 11 5 3 2 0 0 2 0 4;}
@font-face
	{font-family:"\@Malgun Gothic";}
@font-face
	{font-family:HYSinMyeongJo-Medium;
	panose-1:0 0 0 0 0 0 0 0 0 0;}
@font-face
	{font-family:HYGothic-Medium;
	panose-1:0 0 0 0 0 0 0 0 0 0;}
@font-face
	{font-family:"\@Arial Unicode MS";
	panose-1:2 11 6 4 2 2 2 2 2 4;}
@font-face
	{font-family:"\@HYSinMyeongJo-Medium";
	panose-1:0 0 0 0 0 0 0 0 0 0;}
@font-face
	{font-family:"\@HYGothic-Medium";
	panose-1:0 0 0 0 0 0 0 0 0 0;}
 /* Style Definitions */
 p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	text-align:justify;
	text-justify:inter-ideograph;
	line-height:103%;
	text-autospace:none;
	word-break:break-all;
	font-size:10.0pt;
	font-family:"Malgun Gothic",sans-serif;
	color:black;}
p.a, li.a, div.a
	{mso-style-name:"와우폼\[제목\]\[중\]";
	margin:0in;
	text-align:center;
	text-autospace:none;
	font-size:20.0pt;
	font-family:"Gulim",sans-serif;
	color:black;
	font-weight:bold;}
p.11, li.11, div.11
	{mso-style-name:"와우폼\[11\]\[중\]";
	margin:0in;
	text-align:center;
	text-autospace:none;
	font-size:11.0pt;
	font-family:"Gulim",sans-serif;
	color:black;}
.MsoChpDefault
	{font-family:"Malgun Gothic",sans-serif;}
 /* Page Definitions */
 @page WordSection1
	{size:595.25pt 841.85pt;
	margin:70.85pt 56.65pt 56.65pt 56.65pt;}
div.WordSection1
	{page:WordSection1;}
 /* List Definitions */
 ol
	{margin-bottom:0in;}
ul
	{margin-bottom:0in;}
-->
.centered-text {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 200vh;
}
.WordSection1 {
  text-align: center;
}
</style>

<div class="centered-text">
<div class=WordSection1>

<table class=MsoNormalTable border=0 cellspacing=0 cellpadding=0
 style='border-collapse:collapse'>
 <tr style='height:37.05pt'>
  <td width=635 colspan=7 valign=top style='width:476.1pt;border:solid black 1.0pt;
  background:#D9D9D9;padding:0in 0in 0in 0in;height:37.05pt'>
  <p class=a style='margin-top:17.0pt'><span lang=ZH-CN>퇴직금 계산서</span></p>
  <p class=a style='margin-top:17.0pt'><span style='font-size:1.0pt'>&nbsp;</span></p>
  </td>
 </tr>
 <tr style='height:21.35pt'>
  <td width=101 valign=top style='width:75.55pt;border:solid black 1.0pt;
  border-top:none;padding:0in 0in 0in 0in;height:21.35pt'>
  <p class=11 style='margin-top:2.8pt'><span lang=ZH-CN>소</span>       <span
  lang=ZH-CN>속</span></p>
  </td>
  <td width=201 colspan=2 valign=top style='width:150.45pt;border-top:none;
  border-left:none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  padding:0in 0in 0in 0in;height:21.35pt'>
  <p class=11 style='margin-top:2.8pt'><span lang=ZH-CN>${salary[0].deptNm} 부서</span></p>
  </td>
  <td width=122 colspan=2 valign=top style='width:91.45pt;border-top:none;
  border-left:none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  padding:0in 0in 0in 0in;height:21.35pt'>
  <p class=11 style='margin-top:2.8pt'><span lang=ZH-CN>성</span>      <span
  lang=ZH-CN>명</span></p>
  </td>
  <td width=212 colspan=2 valign=top style='width:158.65pt;border-top:none;
  border-left:none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  padding:0in 0in 0in 0in;height:21.35pt'>
  <p id="empNmEx" class=11 style='margin-top:2.8pt'><span lang=ZH-CN>${salary[0].emp.empNm}</span></p>
  </td>
 </tr>
 <tr style='height:21.35pt'>
  <td width=101 valign=top style='width:75.55pt;border:solid black 1.0pt;
  border-top:none;padding:0in 0in 0in 0in;height:21.35pt'>
  <p class=11 style='margin-top:2.8pt'><span lang=ZH-CN>계좌번호</span></p>
  </td>
  <td width=201 colspan=2 valign=top style='width:150.45pt;border-top:none;
  border-left:none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  padding:0in 0in 0in 0in;height:21.35pt'>
  <p class=11 style='margin-top:2.8pt'><span lang=ZH-CN>${salary[0].salAccNum}</span></p>
  </td>
  <td width=122 colspan=2 valign=top style='width:91.45pt;border-top:none;
  border-left:none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  padding:0in 0in 0in 0in;height:21.35pt'>
  <p class=11 style='margin-top:2.8pt'><span lang=ZH-CN>연</span>  <span
  lang=ZH-CN>락</span>  <span lang=ZH-CN>처</span></p>
  </td>
  <td width=212 colspan=2 valign=top style='width:158.65pt;border-top:none;
  border-left:none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  padding:0in 0in 0in 0in;height:21.35pt'>
  <p class=11 style='margin-top:2.8pt'>${salary[0].emp.empContact}<span lang=ZH-CN>　</span></p>
  </td>
 </tr>
 <tr style='height:21.35pt'>
  <td width=101 valign=top style='width:75.55pt;border:solid black 1.0pt;
  border-top:none;padding:0in 0in 0in 0in;height:21.35pt'>
  <p class=11 style='margin-top:2.8pt'><span lang=ZH-CN>입</span>  <span
  lang=ZH-CN>사</span>  <span lang=ZH-CN>일</span></p>
  </td>
  <td width=201 colspan=2 valign=top style='width:150.45pt;border-top:none;
  border-left:none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  padding:0in 0in 0in 0in;height:21.35pt'>
  <p class=11 style='margin-top:2.8pt'>${salary[0].emp.empJoinDt}<span lang=ZH-CN></span></p>
  </td>
  <td width=122 colspan=2 valign=top style='width:91.45pt;border-top:none;
  border-left:none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  padding:0in 0in 0in 0in;height:21.35pt'>
  <p class=11 style='margin-top:2.8pt'><span lang=ZH-CN>퇴 사 일</span></p>
  </td>
  <td width=212 colspan=2 valign=top style='width:158.65pt;border-top:none;
  border-left:none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  padding:0in 0in 0in 0in;height:21.35pt'>
  <p class=11 style='margin-top:2.8pt'>${salary[0].emp.empResignDt == null ? '재직중' : salary[0].emp.empResignDt}</p>

  </td>
 </tr>
 <tr style='height:21.4pt'>
  <td width=101 valign=top style='width:75.55pt;border:solid black 1.0pt;
  border-top:none;padding:0in 0in 0in 0in;height:21.4pt'>
  <p class=11 style='margin-top:2.8pt'><span lang=ZH-CN>주</span>      <span
  lang=ZH-CN>소</span></p>
  </td>
  <td width=534 colspan=6 valign=top style='width:400.55pt;border-top:none;
  border-left:none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  padding:0in 0in 0in 0in;height:21.4pt'>
  <p class=11 style='margin-top:2.8pt'><span lang=ZH-CN>${salary[0].emp.empAddr}　</span></p>
  </td>
 </tr>
 <tr style='height:21.35pt'>
  <td width=101 valign=top style='width:75.55pt;border:solid black 1.0pt;
  border-top:none;padding:0in 0in 0in 0in;height:21.35pt'>
  <p class=11 style='margin-top:2.8pt'><span lang=ZH-CN>구 분</span></p>
  </td>
  <td width=139 valign=top style='width:104.1pt;border-top:none;border-left:
  none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  padding:0in 0in 0in 0in;height:21.35pt'>
  <p class=11 style='margin-top:2.8pt'><span lang=ZH-CN>퇴사직전</span>3<span
  lang=ZH-CN>월</span></p>
  </td>
  <td width=122 colspan=2 valign=top style='width:91.45pt;border-top:none;
  border-left:none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  padding:0in 0in 0in 0in;height:21.35pt'>
  <p class=11 style='margin-top:2.8pt'><span lang=ZH-CN>퇴사직전</span>2<span
  lang=ZH-CN>월</span></p>
  </td>
  <td width=124 colspan=2 valign=top style='width:92.7pt;border-top:none;
  border-left:none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  padding:0in 0in 0in 0in;height:21.35pt'>
  <p class=11 style='margin-top:2.8pt'><span lang=ZH-CN>퇴사직전</span>1<span
  lang=ZH-CN>월</span></p>
  </td>
  <td width=150 valign=top style='width:112.3pt;border-top:none;border-left:
  none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  padding:0in 0in 0in 0in;height:21.35pt'>
  <p class=11 style='margin-top:2.8pt'>3<span lang=ZH-CN>개월간 계</span></p>
  </td>
 </tr>
 <tr style='height:21.35pt'>
  <td width=101 valign=top style='width:75.55pt;border:solid black 1.0pt;
  border-top:none;padding:0in 0in 0in 0in;height:21.35pt'>
  <p class=11 style='margin-top:2.8pt'><span lang=ZH-CN>기 본 급</span></p>
  </td>
  <td width=139 valign=top style='width:104.1pt;border-top:none;border-left:
  none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  padding:0in 0in 0in 0in;height:21.35pt'>
  <p class=11 align=right style='margin-top:2.8pt;margin-right:5.65pt;
  margin-bottom:0in;margin-left:0in;margin-bottom:.0001pt;text-align:right'><fmt:formatNumber type="currency" value="${salary[2].salBasic}" /></p>
  </td>
  <td width=122 colspan=2 valign=top style='width:91.45pt;border-top:none;
  border-left:none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  padding:0in 0in 0in 0in;height:21.35pt'>
  <p class=11 align=right style='margin-top:2.8pt;margin-right:5.65pt;
  margin-bottom:0in;margin-left:0in;margin-bottom:.0001pt;text-align:right'><fmt:formatNumber type="currency" value="${salary[1].salBasic}" /></p>
  </td>
  <td width=124 colspan=2 valign=top style='width:92.7pt;border-top:none;
  border-left:none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  padding:0in 0in 0in 0in;height:21.35pt'>
  <p class=11 align=right style='margin-top:2.8pt;margin-right:5.65pt;
  margin-bottom:0in;margin-left:0in;margin-bottom:.0001pt;text-align:right'><fmt:formatNumber type="currency" value="${salary[0].salBasic}" /></p>
  </td>
  <td width=150 valign=top style='width:112.3pt;border-top:none;border-left:
  none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  padding:0in 0in 0in 0in;height:21.35pt'>
  <p class=11 align=right style='margin-top:2.8pt;margin-right:5.65pt;
  margin-bottom:0in;margin-left:0in;margin-bottom:.0001pt;text-align:right'><fmt:formatNumber type="currency" value="${salary[0].salBasic+salary[1].salBasic+salary[2].salBasic}" /></p>
  </td>
 </tr>
 <tr style='height:21.35pt'>
  <td width=101 valign=top style='width:75.55pt;border:solid black 1.0pt;
  border-top:none;padding:0in 0in 0in 0in;height:21.35pt'>
  <p class=11 style='margin-top:2.8pt'><span lang=ZH-CN>제 수 당</span></p>
  </td>
  <td width=139 valign=top style='width:104.1pt;border-top:none;border-left:
  none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  padding:0in 0in 0in 0in;height:21.35pt'>
  <p class=11 align=right style='margin-top:2.8pt;margin-right:5.65pt;
  margin-bottom:0in;margin-left:0in;margin-bottom:.0001pt;text-align:right'><fmt:formatNumber type="currency" value="${salary[2].salInsCompany}" /></p>
  </td>
  <td width=122 colspan=2 valign=top style='width:91.45pt;border-top:none;
  border-left:none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  padding:0in 0in 0in 0in;height:21.35pt'>
  <p class=11 align=right style='margin-top:2.8pt;margin-right:5.65pt;
  margin-bottom:0in;margin-left:0in;margin-bottom:.0001pt;text-align:right'><fmt:formatNumber type="currency" value="${salary[1].salInsCompany}" /></p>
  </td>
  <td width=124 colspan=2 valign=top style='width:92.7pt;border-top:none;
  border-left:none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  padding:0in 0in 0in 0in;height:21.35pt'>
  <p class=11 align=right style='margin-top:2.8pt;margin-right:5.65pt;
  margin-bottom:0in;margin-left:0in;margin-bottom:.0001pt;text-align:right'><fmt:formatNumber type="currency" value="${salary[0].salInsCompany}" /></p>
  </td>
  <td width=150 valign=top style='width:112.3pt;border-top:none;border-left:
  none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  padding:0in 0in 0in 0in;height:21.35pt'>
  <p class=11 align=right style='margin-top:2.8pt;margin-right:5.65pt;
  margin-bottom:0in;margin-left:0in;margin-bottom:.0001pt;text-align:right'><fmt:formatNumber type="currency" value="${salary[0].salInsCompany+salary[1].salInsCompany+salary[2].salInsCompany}" /></p>
  </td>
 </tr>
 <tr style='height:21.35pt'>
  <td width=101 valign=top style='width:75.55pt;border:solid black 1.0pt;
  border-top:none;padding:0in 0in 0in 0in;height:21.35pt'>
  <p class=11 style='margin-top:2.8pt'><span lang=ZH-CN>기타수당</span></p>
  </td>
  <td width=139 valign=top style='width:104.1pt;border-top:none;border-left:
  none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  padding:0in 0in 0in 0in;height:21.35pt'>
  <p class=11 align=right style='margin-top:2.8pt;margin-right:5.65pt;
  margin-bottom:0in;margin-left:0in;margin-bottom:.0001pt;text-align:right'><fmt:formatNumber type="currency" value="${salary[2].salOvertime + salary[2].salBns}" /></p>
  </td>
  <td width=122 colspan=2 valign=top style='width:91.45pt;border-top:none;
  border-left:none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  padding:0in 0in 0in 0in;height:21.35pt'>
  <p class=11 align=right style='margin-top:2.8pt;margin-right:5.65pt;
  margin-bottom:0in;margin-left:0in;margin-bottom:.0001pt;text-align:right'><fmt:formatNumber type="currency" value="${salary[1].salOvertime + salary[1].salBns }" /></p>
  </td>
  <td width=124 colspan=2 valign=top style='width:92.7pt;border-top:none;
  border-left:none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  padding:0in 0in 0in 0in;height:21.35pt'>
  <p class=11 align=right style='margin-top:2.8pt;margin-right:5.65pt;
  margin-bottom:0in;margin-left:0in;margin-bottom:.0001pt;text-align:right'><fmt:formatNumber type="currency" value="${salary[0].salOvertime + salary[0].salBns}" /></p>
  </td>
  <td width=150 valign=top style='width:112.3pt;border-top:none;border-left:
  none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  padding:0in 0in 0in 0in;height:21.35pt'>
  <p class=11 align=right style='margin-top:2.8pt;margin-right:5.65pt;
  margin-bottom:0in;margin-left:0in;margin-bottom:.0001pt;text-align:right'><fmt:formatNumber type="currency" 
  value="${salary[0].salOvertime+salary[1].salOvertime+salary[2].salOvertime +salary[0].salBns+salary[1].salBns+salary[2].salBns
  }" /></p>
  </td>
 </tr>
 <tr style='height:21.4pt'>
  <td width=101 valign=top style='width:75.55pt;border:solid black 1.0pt;
  border-top:none;padding:0in 0in 0in 0in;height:21.4pt'>
  <p class=11 style='margin-top:2.8pt'><span lang=ZH-CN>계</span></p>
  </td>
  <td width=139 valign=top style='width:104.1pt;border-top:none;border-left:
  none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  padding:0in 0in 0in 0in;height:21.4pt'>
  <p class=11 align=right style='margin-top:2.8pt;margin-right:5.65pt;
  margin-bottom:0in;margin-left:0in;margin-bottom:.0001pt;text-align:right'>
  <fmt:formatNumber type="currency" value="${salary[2].salBasic - salary[2].salInsCompany + (salary[2].salOvertime + salary[2].salBns)}"/>
  </p>
  </td>
  <td width=122 colspan=2 valign=top style='width:91.45pt;border-top:none;
  border-left:none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  padding:0in 0in 0in 0in;height:21.4pt'>
  <p class=11 align=right style='margin-top:2.8pt;margin-right:5.65pt;
  margin-bottom:0in;margin-left:0in;margin-bottom:.0001pt;text-align:right'>
  <fmt:formatNumber type="currency" value="${salary[1].salBasic - salary[1].salInsCompany + (salary[1].salOvertime + salary[1].salBns)}"/>
  </p>
  </td>
  <td width=124 colspan=2 valign=top style='width:92.7pt;border-top:none;
  border-left:none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  padding:0in 0in 0in 0in;height:21.4pt'>
  <p class=11 align=right style='margin-top:2.8pt;margin-right:5.65pt;
  margin-bottom:0in;margin-left:0in;margin-bottom:.0001pt;text-align:right'>
   <fmt:formatNumber type="currency" value="${salary[0].salBasic - salary[0].salInsCompany + (salary[0].salOvertime + salary[1].salBns)}"/>
  </p>
  </td>
  <td width=150 valign=top style='width:112.3pt;border-top:none;border-left:
  none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  padding:0in 0in 0in 0in;height:21.4pt'>
  <p class=11 align=right style='margin-top:2.8pt;margin-right:5.65pt;
  margin-bottom:0in;margin-left:0in;margin-bottom:.0001pt;text-align:right'>
  
  <c:set var="threeHap" value="${(salary[2].salBasic - salary[2].salInsCompany + (salary[2].salOvertime + salary[2].salBns)) +
                                    (salary[1].salBasic - salary[1].salInsCompany + (salary[1].salOvertime + salary[1].salBns)) +
                                    (salary[0].salBasic - salary[0].salInsCompany + (salary[0].salOvertime + salary[0].salBns))}" />
                                    
 <fmt:formatNumber type="currency" value="${threeHap}"/>

  </p>
  </td>
 </tr>
 <tr style='height:21.35pt'>
  <td width=635 colspan=7 valign=top style='width:476.1pt;border:solid black 1.0pt;
  border-top:none;padding:0in 0in 0in 0in;height:21.35pt'>
  <p class=11 style='margin-top:2.8pt'>&nbsp;</p>
  </td>
 </tr>
 <tr style='height:21.35pt'>
  <td width=240 colspan=2 valign=top style='width:179.65pt;border:solid black 1.0pt;
  border-top:none;background:#D9D9D9;padding:0in 0in 0in 0in;height:21.35pt'>
  <p class=11 style='margin-top:2.8pt'><span lang=ZH-CN>년간 상여금</span></p>
  </td>
  <td width=395 colspan=5 valign=top style='width:296.45pt;border-top:none;
  border-left:none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  background:#D9D9D9;padding:0in 0in 0in 0in;height:21.35pt'>
  <p class=11 style='margin-top:2.8pt'><span lang=ZH-CN>평 균 임 금 액</span></p>
  </td>
 </tr>
 <tr style='height:21.35pt'>
  <td width=101 valign=top style='width:75.55pt;border:solid black 1.0pt;
  border-top:none;padding:0in 0in 0in 0in;height:21.35pt'>
  <p class=11 style='margin-top:2.8pt'>1<span lang=ZH-CN>년간 상여금</span></p>
  </td>
  <td width=139 valign=top style='width:104.1pt;border-top:none;border-left:
  none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  padding:0in 0in 0in 0in;height:21.35pt'>
  <p class=11 align=right style='margin-top:2.8pt;margin-right:5.65pt;
  margin-bottom:0in;margin-left:0in;margin-bottom:.0001pt;text-align:right'>
  
    <c:set var="totalExtr" value="0" /> <!-- 연간 하기 위해서 0~11 까지의 인덱스값으로 계산. -->
    <c:forEach var="i" begin="0" end="11">
        <c:set var="totalExtr" value="${totalExtr + salary[i].salExtr}" />
    </c:forEach>
    
  <fmt:formatNumber type="currency" value="${totalExtr}"/>
  </p>
  </td>
  <td width=246 colspan=4 valign=top style='width:184.15pt;border-top:none;
  border-left:none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  padding:0in 0in 0in 0in;height:21.35pt'>
  <p class=11 style='margin-top:2.8pt'><span lang=ZH-CN>임금액</span>(<span
  lang=ZH-CN>퇴사</span> 3<span lang=ZH-CN>월간 임금액</span><span style='font-family:
  "Arial Unicode MS",sans-serif'>÷</span>3)</p>
  </td>
  <td width=150 valign=top style='width:112.3pt;border-top:none;border-left:
  none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  padding:0in 0in 0in 0in;height:21.35pt'>
  <p class=11 align=right style='margin-top:2.8pt;margin-right:5.65pt;
  margin-bottom:0in;margin-left:0in;margin-bottom:.0001pt;text-align:right'>
  <fmt:formatNumber type="currency" value="${threeHap/3}"/></p>
  </td>
 </tr>
 <tr style='height:34.35pt'>
  <td width=101 valign=top style='width:75.55pt;border:solid black 1.0pt;
  border-top:none;padding:0in 0in 0in 0in;height:34.35pt'>
<!--   <p class=11 style='margin-top:2.8pt'>1<span lang=ZH-CN>년간년차수당</span></p> -->
  </td>
  <td width=139 valign=top style='width:104.1pt;border-top:none;border-left:
  none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  padding:0in 0in 0in 0in;height:34.35pt'>
<!--   <p class=11 align=right style='margin-top:2.8pt;margin-right:5.65pt; -->
<!--   margin-bottom:0in;margin-left:0in;margin-bottom:.0001pt;text-align:right'>800,000</p> -->
  </td>
  <td width=246 colspan=4 valign=top style='width:184.15pt;border-top:none;
  border-left:none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  padding:0in 0in 0in 0in;height:34.35pt'>
  <p class=11 style='margin-top:2.8pt'><span lang=ZH-CN>상여액</span>(<span
  lang=ZH-CN>년간 상여액</span><span style='font-family:"Arial Unicode MS",sans-serif'>÷</span>12)</p>
  </td>
  <td width=150 valign=top style='width:112.3pt;border-top:none;border-left:
  none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  padding:0in 0in 0in 0in;height:34.35pt'>
  <p class=11 align=right style='margin-top:2.8pt;margin-right:5.65pt;
  margin-bottom:0in;margin-left:0in;margin-bottom:.0001pt;text-align:right'> <fmt:formatNumber type="currency" value="${totalExtr/12}"/></p>
  </td>
 </tr>
 <tr style='height:18.55pt'>
  <td width=101 valign=top style='width:75.55pt;border:solid black 1.0pt;
  border-top:none;padding:0in 0in 0in 0in;height:18.55pt'>
  <p class=11 style='margin-top:2.8pt'><span lang=ZH-CN>계</span></p>
  </td>
  <td width=139 valign=top style='width:104.1pt;border-top:none;border-left:
  none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  padding:0in 0in 0in 0in;height:18.55pt'>
  <p class=11 align=right style='margin-top:2.8pt;margin-right:5.65pt;
  margin-bottom:0in;margin-left:0in;margin-bottom:.0001pt;text-align:right'><fmt:formatNumber type="currency" value="${totalExtr}"/></p>
  </td>
  <td width=246 colspan=4 valign=top style='width:184.15pt;border-top:none;
  border-left:none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  padding:0in 0in 0in 0in;height:18.55pt'>
  <p class=11 style='margin-top:2.8pt'><span lang=ZH-CN>평균계</span></p>
  </td>
  <td width=150 valign=top style='width:112.3pt;border-top:none;border-left:
  none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  padding:0in 0in 0in 0in;height:18.55pt'>
  <p class=11 align=right style='margin-top:2.8pt;margin-right:5.65pt;
  margin-bottom:0in;margin-left:0in;margin-bottom:.0001pt;text-align:right'><fmt:formatNumber type="currency" value="${(totalExtr/12)+(threeHap/3)}"/></p>
  </td>
 </tr>
 <tr style='height:24.2pt'>
  <td width=635 colspan=7 valign=top style='width:476.1pt;border:solid black 1.0pt;
  border-top:none;padding:0in 0in 0in 0in;height:24.2pt'>
  <p class=11 style='margin-top:2.8pt'>&nbsp;</p>
  </td>
 </tr>
 <tr style='height:21.35pt'>
  <td width=101 valign=top style='width:75.55pt;border:solid black 1.0pt;
  border-top:none;background:#D9D9D9;padding:0in 0in 0in 0in;height:21.35pt'>
  <p class=11 style='margin-top:2.8pt'><span lang=ZH-CN>근속기간</span></p>
  </td>
  <td width=323 colspan=4 valign=top style='width:241.9pt;border-top:none;
  border-left:none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  background:#D9D9D9;padding:0in 0in 0in 0in;height:21.35pt'>
  <p class=11 style='margin-top:2.8pt'><span lang=ZH-CN>퇴직금 산출 방법</span></p>
  </td>
  <td width=62 valign=top style='width:46.35pt;border-top:none;border-left:
  none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  background:#D9D9D9;padding:0in 0in 0in 0in;height:21.35pt'>
  <p class=11 style='margin-top:2.8pt'><span lang=ZH-CN>　</span></p>
  </td>
  <td width=150 valign=top style='width:112.3pt;border-top:none;border-left:
  none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  background:#D9D9D9;padding:0in 0in 0in 0in;height:21.35pt'>
  <p class=11 style='margin-top:2.8pt'><span lang=ZH-CN>산출금액</span></p>
  </td>
 </tr>
 <tr style='height:21.35pt'>
  <td width=101 valign=top style='width:75.55pt;border:solid black 1.0pt;
  border-top:none;padding:0in 0in 0in 0in;height:21.35pt'>
  <p class=11 style='margin-top:2.8pt'>
 

<!-- 근속 연월일 구하기 -->
<c:set var="joinYear" value="${salary[0].emp.empJoinDt.year}" />
<c:set var="resignYear" value="${salary[0].emp.empResignDt.year}" />

<c:set var="joinMonth" value="${salary[0].emp.empJoinDt.month.value}" />
<c:set var="resignMonth" value="${salary[0].emp.empResignDt.month.value}" />

<c:set var="joinDay" value="${salary[0].emp.empJoinDt.dayOfMonth}" />
<c:set var="resignDay" value="${salary[0].emp.empResignDt.dayOfMonth}" />

<c:set var="yearDifference" value="0" />
<c:set var="monthDifference" value="0" />
<c:set var="dayDifference" value="0" />

<c:choose>
    <c:when test="${joinYear >= 2000}">
        <c:set var="yearDifference" value="${resignYear - joinYear}" />
    </c:when>
    <c:otherwise>
        <c:set var="yearsBeforeJoin" value="${2000 - joinYear}" />
        <c:set var="yearsBeforeResign" value="${(2000 - resignYear) * -1}" />
        <c:set var="yearDifference" value="${yearsBeforeJoin + yearsBeforeResign}" />
    </c:otherwise>
</c:choose>

<c:choose>
    <c:when test="${resignMonth >= joinMonth}">
        <c:set var="monthDifference" value="${resignMonth - joinMonth}" />
    </c:when>
    <c:otherwise>
        <c:set var="monthDifference" value="${resignMonth + 12 - joinMonth}" />
        <c:set var="yearDifference" value="${yearDifference - 1}" />
    </c:otherwise>
</c:choose>

<c:choose>
    <c:when test="${resignDay >= joinDay}">
        <c:set var="dayDifference" value="${resignDay - joinDay}" />
    </c:when>
    <c:otherwise>
        <c:set var="monthDifference" value="${monthDifference - 1}" />
        <c:set var="dayDifference" value="${resignDay + 30 - joinDay}" /> 
    </c:otherwise>
</c:choose>

<c:set var="totalMonths" value="${yearDifference * 12 + monthDifference}" />

<c:set var="yearsPart" value="${Math.floor(totalMonths / 12)}" />
<c:set var="monthsPart" value="${totalMonths % 12}" />
<c:set var="daysPart" value="${dayDifference}" />

<c:set var="AverageMoney" value="${(totalExtr / 12)+(threeHap / 3)}" />

<c:set var="daysValue" value="${daysPart * (AverageMoney/365)}" />
<c:set var="monthsValue" value="${monthsPart * (AverageMoney/12)}" />
<c:set var="yearsValue" value="${yearsPart * (AverageMoney)}" />

<!-- 세액 -->
<c:set var="yearsPartValue" value="${yearsPart}" />

<c:choose>
    <c:when test="${yearsPartValue <= 5}">
        <c:set var="deductionAmount" value="${1000000 * yearsPartValue}" />
    </c:when>
    <c:when test="${yearsPartValue <= 10}">
        <c:set var="deductionAmount" value="${5000000 + (yearsPartValue - 5) * 2000000}" />
    </c:when>
    <c:when test="${yearsPartValue <= 20}">
        <c:set var="deductionAmount" value="${15000000 + (yearsPartValue - 10) * 2500000}" />
    </c:when>
    <c:otherwise>
        <c:set var="deductionAmount" value="${40000000 + (yearsPartValue - 20) * 3000000}" />
    </c:otherwise>
</c:choose>
<fmt:formatNumber value="${yearsPart}" type="number" pattern="###"/>

  <span lang=ZH-CN>년</span></p>
  </td>
  <td width=384 colspan=5 valign=top style='width:288.25pt;border-top:none;
  border-left:none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  padding:0in 0in 0in 0in;height:21.35pt'>
  <p class=11 style='margin-top:2.8pt'><span lang=ZH-CN>월평균임금 </span><span
  style='font-family:"Arial Unicode MS",sans-serif'>×</span> <span lang=ZH-CN>근속년수</span></p>
  </td>
  <td width=150 valign=top style='width:112.3pt;border-top:none;border-left:
  none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  padding:0in 0in 0in 0in;height:21.35pt'>
  <p class=11 align=right style='margin-top:2.8pt;margin-right:5.65pt;
  margin-bottom:0in;margin-left:0in;margin-bottom:.0001pt;text-align:right'>
  <fmt:formatNumber type="currency" value="${yearsValue}"/>
  </p>
  </td>
 </tr>
 <tr style='height:21.35pt'>
  <td width=101 valign=top style='width:75.55pt;border:solid black 1.0pt;
  border-top:none;padding:0in 0in 0in 0in;height:21.35pt'>
  <p class=11 style='margin-top:2.8pt'>${monthsPart} <span lang=ZH-CN>월</span></p>
  </td>
  <td width=384 colspan=5 valign=top style='width:288.25pt;border-top:none;
  border-left:none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  padding:0in 0in 0in 0in;height:21.35pt'>
  <p class=11 style='margin-top:2.8pt'>(<span lang=ZH-CN>월평균임금</span><span
  style='font-family:"Arial Unicode MS",sans-serif'>÷</span>12) <span
  style='font-family:"Arial Unicode MS",sans-serif'>×</span> <span lang=ZH-CN>근속월수</span></p>
  </td>
  <td width=150 valign=top style='width:112.3pt;border-top:none;border-left:
  none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  padding:0in 0in 0in 0in;height:21.35pt'>
  <p class=11 align=right style='margin-top:2.8pt;margin-right:5.65pt;
  margin-bottom:0in;margin-left:0in;margin-bottom:.0001pt;text-align:right'>
   <fmt:formatNumber type="currency" value="${monthsValue}"/>
  </p>
  </td>
 </tr>
 <tr style='height:21.4pt'>
  <td width=101 valign=top style='width:75.55pt;border:solid black 1.0pt;
  border-top:none;padding:0in 0in 0in 0in;height:21.4pt'>
  <p class=11 style='margin-top:2.8pt'>${daysPart} <span lang=ZH-CN>일</span></p>
  </td>
  <td width=384 colspan=5 valign=top style='width:288.25pt;border-top:none;
  border-left:none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  padding:0in 0in 0in 0in;height:21.4pt'>
  <p class=11 style='margin-top:2.8pt'>(<span lang=ZH-CN>월평균임금</span><span
  style='font-family:"Arial Unicode MS",sans-serif'>÷</span>365) <span
  style='font-family:"Arial Unicode MS",sans-serif'>×</span> <span lang=ZH-CN>근속일수</span></p>
  </td>
  <td width=150 valign=top style='width:112.3pt;border-top:none;border-left:
  none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  padding:0in 0in 0in 0in;height:21.4pt'>
  <p class=11 align=right style='margin-top:2.8pt;margin-right:5.65pt;
  margin-bottom:0in;margin-left:0in;margin-bottom:.0001pt;text-align:right'>
   <fmt:formatNumber type="currency" value="${daysValue}"/>
  </p>
  </td>
 </tr>
 <tr style='height:21.35pt'>
  <td width=101 valign=top style='width:75.55pt;border:solid black 1.0pt;
  border-top:none;padding:0in 0in 0in 0in;height:21.35pt'>
  <p class=11 style='margin-top:2.8pt'><span lang=ZH-CN>계</span></p>
  </td>
  <td width=384 colspan=5 valign=top style='width:288.25pt;border-top:none;
  border-left:none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  padding:0in 0in 0in 0in;height:21.35pt'>
  <p class=11 style='margin-top:2.8pt'><span lang=ZH-CN>　</span></p>
  </td>
  <td width=150 valign=top style='width:112.3pt;border-top:none;border-left:
  none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  padding:0in 0in 0in 0in;height:21.35pt'>
  <p class=11 align=right style='margin-top:2.8pt;margin-right:5.65pt;
  margin-bottom:0in;margin-left:0in;margin-bottom:.0001pt;text-align:right'>
  

  <c:set var="totalValue" value="${daysValue + monthsValue + yearsValue}" />
  <fmt:formatNumber type="currency" value="${totalValue}" />
  </p>
  </td>
 </tr>
 <tr style='height:21.35pt'>
  <td width=635 colspan=7 valign=top style='width:476.1pt;border:solid black 1.0pt;
  border-top:none;padding:0in 0in 0in 0in;height:21.35pt'>
  <p class=11 style='margin-top:2.8pt'>&nbsp;</p>
  </td>
 </tr>
 <tr style='height:21.35pt'>
  <td width=101 valign=top style='width:75.55pt;border:solid black 1.0pt;
  border-top:none;background:#D9D9D9;padding:0in 0in 0in 0in;height:21.35pt'>
  <p class=11 style='margin-top:2.8pt'><span lang=ZH-CN>소득세</span></p>
  </td>
  <td width=139 valign=top style='width:104.1pt;border-top:none;border-left:
  none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  background:#D9D9D9;padding:0in 0in 0in 0in;height:21.35pt'>
  <p class=11 style='margin-top:2.8pt'><span lang=ZH-CN>주민세</span></p>
  </td>
  <td width=122 colspan=2 valign=top style='width:91.45pt;border-top:none;
  border-left:none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  background:#D9D9D9;padding:0in 0in 0in 0in;height:21.35pt'>
  <p class=11 style='margin-top:2.8pt'><span lang=ZH-CN>공제액 계</span></p>
  </td>
  <td width=273 colspan=3 valign=top style='width:205.0pt;border-top:none;
  border-left:none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  background:#D9D9D9;padding:0in 0in 0in 0in;height:21.35pt'>
  <p class=11 style='margin-top:2.8pt'><span lang=ZH-CN>차 인 지 급 액</span></p>
  </td>
 </tr>
 
 <c:set var="taxableAmount" value="${totalValue - (deductionAmount + (totalValue / 2))}" />

<c:choose>
    <c:when test="${taxableAmount <= 14000000}">
        <c:set var="taxAmount" value="${taxableAmount * 0.06}" />
    </c:when>
    <c:when test="${taxableAmount <= 50000000}">
        <c:set var="taxAmount" value="${84000 + (taxableAmount - 14000000) * 0.15}" />
    </c:when>
    <c:when test="${taxableAmount <= 88000000}">
        <c:set var="taxAmount" value="${6240000 + (taxableAmount - 50000000) * 0.24}" />
    </c:when>
    <c:when test="${taxableAmount <= 150000000}">
        <c:set var="taxAmount" value="${15360000 + (taxableAmount - 88000000) * 0.35}" />
    </c:when>
    <c:when test="${taxableAmount <= 300000000}">
        <c:set var="taxAmount" value="${37060000 + (taxableAmount - 150000000) * 0.38}" />
    </c:when>
    <c:when test="${taxableAmount <= 500000000}">
        <c:set var="taxAmount" value="${94060000 + (taxableAmount - 300000000) * 0.40}" />
    </c:when>
    <c:when test="${taxableAmount <= 1000000000}">
        <c:set var="taxAmount" value="${174060000 + (taxableAmount - 500000000) * 0.42}" />
    </c:when>
    <c:otherwise>
        <c:set var="taxAmount" value="${384060000 + (taxableAmount - 1000000000) * 0.45}" />
    </c:otherwise>
</c:choose>
 
 <tr style='height:21.35pt'>
  <td width=101 valign=top style='width:75.55pt;border:solid black 1.0pt;
  border-top:none;padding:0in 0in 0in 0in;height:21.35pt'>
  <p class=11 align=right style='margin-top:2.8pt;margin-right:5.65pt;
  margin-bottom:0in;margin-left:0in;margin-bottom:.0001pt;text-align:right'>  
  <fmt:formatNumber type="currency" value="${taxAmount*yearsPartValue}" />
  </p>
  </td>
  <td width=139 valign=top style='width:104.1pt;border-top:none;border-left:
  none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  padding:0in 0in 0in 0in;height:21.35pt'>
  <p class=11 align=right style='margin-top:2.8pt;margin-right:5.65pt;
  margin-bottom:0in;margin-left:0in;margin-bottom:.0001pt;text-align:right'>
  <fmt:formatNumber type="currency" value="${(taxAmount*yearsPartValue)/10}" />
  </p>
  </td>
  <td width=122 colspan=2 valign=top style='width:91.45pt;border-top:none;
  border-left:none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  padding:0in 0in 0in 0in;height:21.35pt'>
  <p class=11 align=right style='margin-top:2.8pt;margin-right:5.65pt;
  margin-bottom:0in;margin-left:0in;margin-bottom:.0001pt;text-align:right'>
 <fmt:formatNumber type="currency" value="${((taxAmount * yearsPartValue) / 10) + (taxAmount * yearsPartValue)}" />
  </p>
  </td>
  <td width=273 colspan=3 valign=top style='width:205.0pt;border-top:none;
  border-left:none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  padding:0in 0in 0in 0in;height:21.35pt'>
  <p class=11 align=right style='margin-top:2.8pt;margin-right:5.65pt;
  margin-bottom:0in;margin-left:0in;margin-bottom:.0001pt;text-align:right'>
   <fmt:formatNumber type="currency" value="${totalValue-(((taxAmount*yearsPartValue)/10)+(taxAmount*yearsPartValue))}" />
  </p>
  </td>
 </tr>
 <tr style='height:21.4pt'>
  <td width=101 valign=top style='width:75.55pt;border:solid black 1.0pt;
  border-top:none;padding:0in 0in 0in 0in;height:21.4pt'>
  <p class=11 style='margin-top:2.8pt'>&nbsp;</p>
  </td>
  <td width=534 colspan=6 valign=top style='width:400.55pt;border-top:none;
  border-left:none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  padding:0in 0in 0in 0in;height:21.4pt'>
  <p class=11 style='margin-top:2.8pt'>&nbsp;</p>
  </td>
 </tr>
 <tr height=0>
  <td width=101 style='border:none'></td>
  <td width=139 style='border:none'></td>
  <td width=62 style='border:none'></td>
  <td width=60 style='border:none'></td>
  <td width=62 style='border:none'></td>
  <td width=62 style='border:none'></td>
  <td width=150 style='border:none'></td>
 </tr>
</table>

<p class=MsoNormal><span style='font-size:1.0pt;line-height:103%'>&nbsp;</span></p>

<p class=MsoNormal style='line-height:normal'><span style='font-size:11.0pt;
font-family:"Gulim",sans-serif'>&nbsp;</span></p>

<p class=MsoNormal align=left style='text-align:left;line-height:normal;
word-break:normal'><span style='font-size:11.0pt;font-family:"Gulim",sans-serif'>&nbsp;</span></p>

<p class=MsoNormal align=left style='text-align:left;line-height:normal;
word-break:normal'><span style='font-size:11.0pt;font-family:"Gulim",sans-serif'>&nbsp;</span></p>

<p class=MsoNormal align=left style='text-align:left;line-height:normal;
word-break:normal'><span style='font-size:11.0pt;font-family:"Gulim",sans-serif'>&nbsp;</span></p>

<table class=MsoNormalTable border=0 cellspacing=0 cellpadding=0
 style='border-collapse:collapse'>
 <tr style='height:29.9pt'>
  <td width=422 colspan=3 valign=top style='width:316.5pt;border:solid black 1.0pt;
  padding:0in 0in 0in 0in;height:20.9pt'>
  <p class=a style='margin-bottom:5.65pt'><span lang=ZH-CN style='font-size:16.0pt'>퇴직소득세 및 주민세 산출근거</span></p>
  
  <td width=116 valign=top style='width:87.05pt;border:solid black 1.0pt;
  border-left:none;padding:0in 0in 0in 0in;height:29.9pt'>
  <p class=11 style='margin-top:2.8pt'>&nbsp;</p>
  </td>
  <td width=97 valign=top style='width:72.55pt;border:solid black 1.0pt;
  border-left:none;padding:0in 0in 0in 0in;height:29.9pt'>
  <p class=11 style='margin-top:2.8pt'>&nbsp;</p>
  </td>
 </tr>
 <tr style='height:21.35pt'>
  <td width=208 colspan=2 valign=top style='width:156.0pt;border:solid black 1.0pt;
  border-top:none;background:#D9D9D9;padding:0in 0in 0in 0in;height:21.35pt'>
  <p class=11 style='margin-top:2.8pt'><span lang=ZH-CN>항 목</span></p>
  </td>
  <td width=330 colspan=2 valign=top style='width:247.55pt;border-top:none;
  border-left:none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  background:#D9D9D9;padding:0in 0in 0in 0in;height:21.35pt'>
  <p class=11 style='margin-top:2.8pt;word-break:break-all'><span lang=ZH-CN>세액
  공제 계산방법</span></p>
  </td>
  <td width=97 valign=top style='width:72.55pt;border-top:none;border-left:
  none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  background:#D9D9D9;padding:0in 0in 0in 0in;height:21.35pt'>
  <p class=11 style='margin-top:2.8pt'><span lang=ZH-CN>결 과</span></p>
  </td>
 </tr>
 <tr style='height:21.35pt'>
  <td width=139 valign=top style='width:103.95pt;border:solid black 1.0pt;
  border-top:none;padding:0in 0in 0in 0in;height:21.35pt'>
  <p class=11 style='margin-top:2.8pt;word-break:break-all'> 1. <span
  lang=ZH-CN>근속년수</span></p>
  </td>
  <td width=69 valign=top style='width:52.05pt;border-top:none;border-left:
  none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  padding:0in 0in 0in 0in;height:21.35pt'>
  <p class=11 style='margin-top:2.8pt'>&nbsp;</p>
  </td>
  <td width=214 valign=top style='width:160.5pt;border-top:none;border-left:
  none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  padding:0in 0in 0in 0in;height:21.35pt'>
  <p class=11 style='margin-top:2.8pt'><span lang=ZH-CN>세액공제용 근속년수</span></p>
  </td>
  <td width=116 valign=top style='width:87.05pt;border-top:none;border-left:
  none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  padding:0in 0in 0in 0in;height:21.35pt'>
  <p class=11 style='margin-top:2.8pt'><span lang=ZH-CN>　</span></p>
  </td>
  <td width=97 valign=top style='width:72.55pt;border-top:none;border-left:
  none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  padding:0in 0in 0in 0in;height:21.35pt'>
  <p class=11 style='margin-top:2.8pt'><fmt:formatNumber value="${yearsPart}" type="number" pattern="###"/>
  </p>
  </td>
 </tr>
 <tr style='height:23.0pt'>
  <td width=139 valign=top style='width:103.95pt;border:solid black 1.0pt;
  border-top:none;padding:0in 0in 0in 0in;height:23.0pt'>
  <p class=11 style='margin-top:2.8pt;word-break:break-all'> 2. <span
  lang=ZH-CN>퇴직 소득공제</span></p>
  </td>
  <td width=69 valign=top style='width:52.05pt;border-top:none;border-left:
  none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  padding:0in 0in 0in 0in;height:23.0pt'>
  <p class=11 style='margin-top:2.8pt'><span lang=ZH-CN>　</span></p>
  </td>
  <td width=330 colspan=2 valign=top style='width:247.55pt;border-top:none;
  border-left:none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  padding:0in 0in 0in 0in;height:23.0pt'>
  <p class=11 style='margin-top:2.8pt'><span lang=ZH-CN>퇴직급여 및 단체퇴직보험금</span>(<span
  lang=ZH-CN>퇴직금액 </span><span style='font-family:"Arial Unicode MS",sans-serif'>×</span>
  50%)</p>
  </td>
  <td width=97 valign=top style='width:72.55pt;border-top:none;border-left:
  none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  padding:0in 0in 0in 0in;height:23.0pt'>
  <p class=11 align=right style='margin-top:2.8pt;margin-right:5.65pt;
  margin-bottom:0in;margin-left:0in;margin-bottom:.0001pt;text-align:right'>
  <fmt:formatNumber type="currency" value="${totalValue/2}" /></p>
  </td>
 </tr>
 <tr style='height:20.15pt'>
  <td width=139 valign=top style='width:103.95pt;border:solid black 1.0pt;
  border-top:none;padding:0in 0in 0in 0in;height:20.15pt'>
  <p class=11 style='margin-top:2.8pt;word-break:break-all'> 3. <span
  lang=ZH-CN>근속년수 공제</span></p>
  </td>
  <td width=69 valign=top style='width:52.05pt;border-top:none;border-left:
  none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  padding:0in 0in 0in 0in;height:20.15pt'>
  <p class=11 style='margin-top:2.8pt'><span lang=ZH-CN>　</span></p>
  </td>
  <td width=214 valign=top style='width:160.5pt;border-top:none;border-left:
  none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  padding:0in 0in 0in 0in;height:20.15pt'>
  <p class=11 style='margin-top:2.8pt'><span lang=ZH-CN>근속연수에 따른 공제액</span></p>
  </td>
  <td width=116 valign=top style='width:87.05pt;border-top:none;border-left:
  none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  padding:0in 0in 0in 0in;height:20.15pt'>
  <p class=11 style='margin-top:2.8pt'><span lang=ZH-CN>　</span></p>
  </td>
  <td width=97 valign=top style='width:72.55pt;border-top:none;border-left:
  none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  padding:0in 0in 0in 0in;height:20.15pt'>
  <p class=11 align=right style='margin-top:2.8pt;margin-right:5.65pt;
  margin-bottom:0in;margin-left:0in;margin-bottom:.0001pt;text-align:right'>


<fmt:formatNumber type="currency" value="${deductionAmount}" />
 
  </p>
  </td>
 </tr>
 <tr style='height:23.0pt'>
  <td width=139 valign=top style='width:103.95pt;border:solid black 1.0pt;
  border-top:none;padding:0in 0in 0in 0in;height:23.0pt'>
  <p class=11 style='margin-top:2.8pt;word-break:break-all'> 4. <span
  lang=ZH-CN>총과세 표준</span></p>
  </td>
  <td width=69 valign=top style='width:52.05pt;border-top:none;border-left:
  none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  padding:0in 0in 0in 0in;height:23.0pt'>
  <p class=11 style='margin-top:2.8pt'><span lang=ZH-CN>　</span></p>
  </td>
  <td width=214 valign=top style='width:160.5pt;border-top:none;border-left:
  none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  padding:0in 0in 0in 0in;height:23.0pt'>
  <p class=11 style='margin-top:2.8pt'><span lang=ZH-CN>퇴직금액</span> - (2<span
  lang=ZH-CN>항</span> + 3<span lang=ZH-CN>항</span>)</p>
  </td>
  <td width=116 valign=top style='width:87.05pt;border-top:none;border-left:
  none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  padding:0in 0in 0in 0in;height:23.0pt'>
  <p class=11 style='margin-top:2.8pt'><span lang=ZH-CN>　</span></p>
  </td>
  <td width=97 valign=top style='width:72.55pt;border-top:none;border-left:
  none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  padding:0in 0in 0in 0in;height:23.0pt'>
  <p class=11 align=right style='margin-top:2.8pt;margin-right:5.65pt;
  margin-bottom:0in;margin-left:0in;margin-bottom:.0001pt;text-align:right'>
  <fmt:formatNumber type="currency" value="${totalValue-(deductionAmount+(totalValue/2))}" />
  </p>
  </td>
 </tr>
 <tr style='height:23.0pt'>
  <td width=139 valign=top style='width:103.95pt;border:solid black 1.0pt;
  border-top:none;padding:0in 0in 0in 0in;height:23.0pt'>
  <p class=11 style='margin-top:2.8pt;word-break:break-all'> 5. <span
  lang=ZH-CN>년평균 과세표준</span></p>
  </td>
  <td width=69 valign=top style='width:52.05pt;border-top:none;border-left:
  none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  padding:0in 0in 0in 0in;height:23.0pt'>
  <p class=11 style='margin-top:2.8pt'><span lang=ZH-CN>　</span></p>
  </td>
  <td width=214 valign=top style='width:160.5pt;border-top:none;border-left:
  none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  padding:0in 0in 0in 0in;height:23.0pt'>
  <p class=11 style='margin-top:2.8pt'><span lang=ZH-CN>년평균 과세표준</span> (4<span
  lang=ZH-CN>항 </span><span style='font-family:"Arial Unicode MS",sans-serif'>÷</span>
  1<span lang=ZH-CN>항</span>)</p>
  </td>
  <td width=116 valign=top style='width:87.05pt;border-top:none;border-left:
  none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  padding:0in 0in 0in 0in;height:23.0pt'>
  <p class=11 style='margin-top:2.8pt'><span lang=ZH-CN>　</span></p>
  </td>
  <td width=97 valign=top style='width:72.55pt;border-top:none;border-left:
  none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  padding:0in 0in 0in 0in;height:23.0pt'>
  <p class=11 align=right style='margin-top:2.8pt;margin-right:5.65pt;
  margin-bottom:0in;margin-left:0in;margin-bottom:.0001pt;text-align:right'>
<fmt:formatNumber type="currency" value="${((totalValue - (deductionAmount + (totalValue / 2))) / yearsPart)}" />
  </p>
  </td>
 </tr>
 <tr style='height:20.15pt'>
  <td width=139 valign=top style='width:103.95pt;border:solid black 1.0pt;
  border-top:none;padding:0in 0in 0in 0in;height:20.15pt'>
  <p class=11 style='margin-top:2.8pt;word-break:break-all'> 6. <span
  lang=ZH-CN>년평균 세액</span></p>
  </td>
  <td width=69 valign=top style='width:52.05pt;border-top:none;border-left:
  none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  padding:0in 0in 0in 0in;height:20.15pt'>
  <p class=11 style='margin-top:2.8pt'><span lang=ZH-CN>　</span></p>
  </td>
  <td width=214 valign=top style='width:160.5pt;border-top:none;border-left:
  none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  padding:0in 0in 0in 0in;height:20.15pt'>
  <p class=11 style='margin-top:2.8pt'><span lang=ZH-CN>과세표준 세액</span></p>
  </td>
  <td width=116 valign=top style='width:87.05pt;border-top:none;border-left:
  none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  padding:0in 0in 0in 0in;height:20.15pt'>
  <p class=11 style='margin-top:2.8pt'><span lang=ZH-CN>　</span></p>
  </td>
  <td width=97 valign=top style='width:72.55pt;border-top:none;border-left:
  none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  padding:0in 0in 0in 0in;height:20.15pt'>
  <p class=11 align=right style='margin-top:2.8pt;margin-right:5.65pt;
  margin-bottom:0in;margin-left:0in;margin-bottom:.0001pt;text-align:right'>
  
  

	<!-- 세금 계산 결과를 화폐 형식으로 포맷팅하여 출력 -->
	<fmt:formatNumber type="currency" value="${taxAmount}" />
  
  </p>
  </td>
 </tr>
 <tr style='height:21.4pt'>
  <td width=139 valign=top style='width:103.95pt;border:solid black 1.0pt;
  border-top:none;padding:0in 0in 0in 0in;height:21.4pt'>
  <p class=11 style='margin-top:2.8pt;word-break:break-all'> 7. <span
  lang=ZH-CN>산출 세액</span></p>
  </td>
  <td width=69 valign=top style='width:52.05pt;border-top:none;border-left:
  none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  padding:0in 0in 0in 0in;height:21.4pt'>
  <p class=11 style='margin-top:2.8pt'><span lang=ZH-CN>　</span></p>
  </td>
  <td width=214 valign=top style='width:160.5pt;border-top:none;border-left:
  none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  padding:0in 0in 0in 0in;height:21.4pt'>
  <p class=11 style='margin-top:2.8pt'><span lang=ZH-CN>산출 세액</span>(6<span
  lang=ZH-CN>항 </span><span style='font-family:"Arial Unicode MS",sans-serif'>×</span>
  1<span lang=ZH-CN>항</span>)</p>
  </td>
  <td width=116 valign=top style='width:87.05pt;border-top:none;border-left:
  none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  padding:0in 0in 0in 0in;height:21.4pt'>
  <p class=11 style='margin-top:2.8pt'><span lang=ZH-CN>　</span></p>
  </td>
  <td width=97 valign=top style='width:72.55pt;border-top:none;border-left:
  none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  padding:0in 0in 0in 0in;height:21.4pt'>
  <p class=11 align=right style='margin-top:2.8pt;margin-right:5.65pt;
  margin-bottom:0in;margin-left:0in;margin-bottom:.0001pt;text-align:right'>
  <fmt:formatNumber type="currency" value="${taxAmount*yearsPartValue}" />
  </p>
  </td>
 </tr>
 <tr style='height:21.35pt'>
  <td width=139 valign=top style='width:103.95pt;border:solid black 1.0pt;
  border-top:none;padding:0in 0in 0in 0in;height:21.35pt'>
  <p class=11 style='margin-top:2.8pt;word-break:break-all'> 8. <span
  lang=ZH-CN>소득세</span></p>
  </td>
  <td width=69 valign=top style='width:52.05pt;border-top:none;border-left:
  none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  padding:0in 0in 0in 0in;height:21.35pt'>
  <p class=11 style='margin-top:2.8pt'><span lang=ZH-CN>　</span></p>
  </td>
  <td width=214 valign=top style='width:160.5pt;border-top:none;border-left:
  none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  padding:0in 0in 0in 0in;height:21.35pt'>
  <p class=11 style='margin-top:2.8pt'><span lang=ZH-CN>결정세액</span>(7<span
  lang=ZH-CN>항</span>)</p>
  </td>
  <td width=116 valign=top style='width:87.05pt;border-top:none;border-left:
  none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  padding:0in 0in 0in 0in;height:21.35pt'>
  <p class=11 style='margin-top:2.8pt'><span lang=ZH-CN>　</span></p>
  </td>
  <td width=97 valign=top style='width:72.55pt;border-top:none;border-left:
  none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  padding:0in 0in 0in 0in;height:21.35pt'>
  <p class=11 align=right style='margin-top:2.8pt;margin-right:5.65pt;
  margin-bottom:0in;margin-left:0in;margin-bottom:.0001pt;text-align:right'>
   <fmt:formatNumber type="currency" value="${taxAmount*yearsPartValue}" />
   </p>
  </td>
 </tr>
 <tr style='height:21.35pt'>
  <td width=139 valign=top style='width:103.95pt;border:solid black 1.0pt;
  border-top:none;padding:0in 0in 0in 0in;height:21.35pt'>
  <p class=11 style='margin-top:2.8pt;word-break:break-all'>9. <span
  lang=ZH-CN>주민세</span></p>
  </td>
  <td width=69 valign=top style='width:52.05pt;border-top:none;border-left:
  none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  padding:0in 0in 0in 0in;height:21.35pt'>
  <p class=11 style='margin-top:2.8pt'><span lang=ZH-CN>　</span></p>
  </td>
  <td width=214 valign=top style='width:160.5pt;border-top:none;border-left:
  none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  padding:0in 0in 0in 0in;height:21.35pt'>
  <p class=11 style='margin-top:2.8pt'>8<span lang=ZH-CN>항</span>(<span
  lang=ZH-CN>소득세</span>) <span style='font-family:"Arial Unicode MS",sans-serif'>×</span>
  10%</p>
  </td>
  <td width=116 valign=top style='width:87.05pt;border-top:none;border-left:
  none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  padding:0in 0in 0in 0in;height:21.35pt'>
  <p class=11 style='margin-top:2.8pt'><span lang=ZH-CN>　</span></p>
  </td>
  <td width=97 valign=top style='width:72.55pt;border-top:none;border-left:
  none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  padding:0in 0in 0in 0in;height:21.35pt'>
  <p class=11 align=right style='margin-top:2.8pt;margin-right:5.65pt;
  margin-bottom:0in;margin-left:0in;margin-bottom:.0001pt;text-align:right'>
   <fmt:formatNumber type="currency" value="${(taxAmount*yearsPartValue)/10}" />
   </p>
  </td>
 </tr>
</table>

<p class=MsoNormal><span style='font-size:1.0pt;line-height:103%'>&nbsp;</span></p>

<p class=MsoNormal align=left style='text-align:left;line-height:normal;
word-break:normal'><span style='font-size:11.0pt;font-family:"Gulim",sans-serif'> </span></p>

<p class=MsoNormal align=left style='text-align:left;line-height:normal;
word-break:normal'><span style='font-size:11.0pt;font-family:"Gulim",sans-serif'>&nbsp;</span></p>

</div>
</div>


