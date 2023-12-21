<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="EUC-KR">
    <title>Insert title here</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
        }
        table {
            margin: 0 auto;
            border-collapse: collapse;
        }
        td {
            padding: 10px;
        }
        .logo img {
            height: 80px;
        }
        .menu {
            text-align: center;
        }
        .menu td {
            width: 200px;
            background-color: orange;
        }
        .menu a {
            display: block;
            text-decoration: none;
            color: white;
            font-size: 18px;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <table width="1000">
        <tr class="logo" height="70">
            <td colspan="3">
                <a href="Main.jsp">
                    <img alt="" src="img/logo.png">
                </a>
            </td>
        </tr>
        <tr class="menu" height="50">
            <td>
                <a href="Main.jsp?center=PensionRegionList.jsp">지역별</a>
            </td>
            <td>
                <a href="Main.jsp?center=PensionMonthList.jsp">월별</a>
            </td>
            <td>
                <a href="Main.jsp?center=SearchMine.jsp">예약확인</a>
            </td>
            <td>
                <a href="Main.jsp?center=BoardList.jsp">자유게시판</a>
            </td>
        </tr>
    </table>
</body>
</html>
