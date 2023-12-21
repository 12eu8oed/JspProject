<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="Model.BoardDAO"%>
<%@ page import="Model.BoardBean"%>
<%@ page import ="java.util.Vector"%>
<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<title></title>
<style>
  .button-link {
    display: inline-block;
    padding: 8px 12px;
    background-color: #ffbc7a;
    color: #005fbd;
    text-decoration: none;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    font-weight: bold; /* 글씨체 굵게 설정 */
  }

  .button-link:hover {
    background-color: #FF8800;
  }
</style>
    <script>
	    function validateForm() {  //입력값이 NULL이면 경고창을 나타내는 함수.

	    
	        var writer = document.forms["writeForm"]["write"].value;
	        var subject = document.forms["writeForm"]["subject"].value;
	        var content = document.forms["writeForm"]["content"].value;
	        var email = document.forms["writeForm"]["email"].value;
	        var password = document.forms["writeForm"]["password"].value;
	
	        if (writer == null || writer == "" ||
	            subject == null || subject == "" ||
	            content == null || content == "" ||
	            email == null || email == "" || 
	            password == null || password == "") {
	                alert("작성자, 제목, 이메일, 비밀번호, 글 내용은 필수 입력 사항입니다.");
	        		event.preventDefault();  //전체게시글버튼을 눌렀을때 경고창이 나타나지 않게 추가하였습니다.
	                return false;
	        }
	    }
/* 	    function goToBoardList() {
    	  if (validateForm()) {
    	    document.writeForm.action = "Main.jsp?center=BoardList.jsp";
    	    document.writeForm.submit();
    	  }
	    }
 */
    </script>
</head>
<body>
	<h2> 게시글 쓰기 </h2>
	
	<center>
		<form name="writeForm" action="BoardWriteProc.jsp" method="post" onsubmit="return validateForm()">		
			<table	width ="600" border = "1" bordercolor = "gray" bgcolor = "skyblue" >
				<tr height="40">
						<td align = "center" width ="150">작성자</td>
						<td width="450"><input type= "text" name = "write" size = "60"></td>
				</tr>
				
				<tr height="40">
						<td align = "center" width ="150">제목</td>
						<td width="450"><input type= "text" name = "subject" size = "60"></td>
				</tr>
				
				<tr height="40">
						<td align = "center" width ="150">이메일</td>
						<td width="450"><input type= "email" name = "email" size = "60"></td>
				</tr>
				
				<tr height="40">
						<td align = "center" width ="150">비밀 번호</td>
						<td width="450"><input type= "password" name = "password" size = "60"></td>
				</tr>
				
				<tr height="40">
						<td align = "center" width ="150">글 내용</td>
						<td width="450"><textarea rows= "10" cols = "60" name = "content"></textarea></td>
				</tr>
				
				<tr height="40">
						<td align = "center" colspan = "2">
							<!-- 기존 버튼 코드 -->
							<input type="submit" value="글쓰기" class="button-link">&nbsp;&nbsp;
							<input type="reset" value="다시 작성" class="button-link">
							<input type="button" onclick="return location.href='Main.jsp?center=BoardList.jsp'" value="전체글보기" class="button-link">
						</td>
				</tr>
			</table>		
		</form>
	</center>
</body>
</html>