<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="db.PensionDAO"%>
<%@ page import="db.PensionBean"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Search Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
        }
        .search-container {
            margin-top: 100px;
        }
        .search-input {
            padding: 10px;
            font-size: 18px;
            width: 300px;
        }
        .search-button {
            padding: 10px 20px;
            font-size: 18px;
        }
    </style>
</head>
<body>
    <div class="search-container">
        <h2>검색창</h2>
        <form action="Main.jsp?center=ShowReservedPension.jsp" method="post">
            <input type="text" name="code" class="search-input" placeholder="코드를 입력하세요">
            <br><br>
            <input type="submit" value="검색" class="search-button">
                     
        </form>
    </div>
</body>
</html>