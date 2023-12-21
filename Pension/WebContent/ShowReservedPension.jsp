<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="db.PensionDAO"%>
<%@ page import="db.PensionBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Show Reserved Pension</title>
<style>
body {
	font-family: Arial, sans-serif;
	text-align: center;
}

.result-container {
	margin-top: 100px;
}

.result-message {
	font-size: 18px;
}
</style>
</head>
<body>
	<div class="result-container">
		<%
		// 입력값인 code를 받아옴
		String code = request.getParameter("code");
		// 코드를 처리하는 로직을 작성
		// 예: PensionDAO를 사용하여 DB에서 해당 코드에 대한 정보를 조회하거나 처리

		// 예시: 입력된 코드를 출력하는 메시지를 생성
		if (code == null) {
			// 처리할 내용이 있으면 작성
		}

		// 데이터베이스에 접근
		PensionDAO pdao = new PensionDAO();

		PensionBean bean = pdao.getOnePension2(code);

		if (bean.getName() == null) {
		%>
		<h2>잘못된 코드 입력</h2>
		<p class="result-message">
			입력된 코드 :
			<%=code%></p>
		<button onclick="location.href='Main.jsp'">메인화면으로 돌아가기</button>
		<%
		} else {
		%>
		<center>
			<form action="Main.jsp?center=CheckReservation2.jsp" method="post">
				<table width="1000">
					<tr height="100">
						<td align="center" colspan="3"><font size="7" color="#333333"><%=bean.getName()%></font>
						</td>
					</tr>

					<tr height="100">
						<td rowspan="9" width="500"><img alt=""
							src="img/<%=bean.getImage()%>" width="500"></td>
					</tr>

					<tr>
						<td width="250" align="center" style="font-size: 20px;">이름</td>
						<td width="250" align="center" style="font-size: 20px;"><%=bean.getName()%></td>
					</tr>

					<tr>
						<td width="250" align="center" style="font-size: 20px;">대여 월</td>
						<td width="250" align="center" style="font-size: 20px;"><%=bean.getMonth()%>월</td>
					</tr>

					<tr>
						<td width="250" align="center" style="font-size: 20px;">전화번호</td>
						<td width="250" align="center" style="font-size: 20px;"><%=bean.getCall()%></td>
					</tr>

					<tr>
						<td width="250" align="center" style="font-size: 20px;">인원 수</td>
						<td width="250" align="center" style="font-size: 20px;"><%=bean.getPeople()%></td>
					</tr>

					<tr>
						<td width="250" align="center" style="font-size: 20px;">가격</td>
						<td width="250" align="center" style="font-size: 20px;"><%=bean.getPrice()%>
							원</td>
					</tr>

					<tr>
						<td width="250" align="center" style="font-size: 20px;">예약전화번호</td>
						<td width="250" align="center" style="font-size: 20px;"><%=bean.getPhone()%></td>
					</tr>

					<tr>
						<td width="250" align="center" style="font-size: 20px;">예약코드</td>
						<td width="250" align="center" style="font-size: 20px;"><%=code%></td>
					</tr>
					
					
					<tr>
						<td width="250" align="center" style="font-size: 20px;">상세주소</td>
						<td width="250" align="center" style="font-size: 20px;"><%=bean.getLocation2()%></td>
					</tr>


				</table>
				<br> <br> <br> <font size="6" color="#333333">펜션
					정보</font>
				<p>
					<font size="5"><%=bean.getInfo()%></font>
			</form>

			<button onclick="location.href='Main.jsp'">메인화면으로 돌아가기</button>
			
			<button
				onclick="location.href='Main.jsp?center=ReservationCancle.jsp?id=<%=bean.getId()%>'"
				style="background-color: red;">예약취소하기</button>
		</center>
		<%
		}
		%>
	</div>
</body>
</html>
