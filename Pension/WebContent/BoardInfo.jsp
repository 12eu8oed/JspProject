<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="Model.BoardDAO"%>
<%@ page import="Model.BoardBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
</head>
<body>
	<% 
		int num = Integer.parseInt(request.getParameter("num").trim());//공백 제거후 정수형으로 바뀜
		
		//데이터 베이스 접근
		BoardDAO bdao = new BoardDAO();
		
		//boardbean타입으로 하나의 게시글을 리턴
		BoardBean bean  = bdao.getOneBoard(num);

	%>
	
	<center>
		<h2>게시글 보기</h2>
			<table width = "600" border = "1" bgcolor="skyblue">
				<tr height = "40">
					<td width = "100" align ="center">추천수 </td>
					<td width = "180" align ="left"  ><%=bean.getLikes()%></td>
					<td width = "120" align ="center">조회수 </td>
					<td width = "180" align ="center"><%=bean.getReadcount()%> </td>
				</tr>
				
				<tr height = "40">
					<td width = "100" align ="center">작성자 </td>
					<td width = "180" align ="left"><%=bean.getWrite()%></td>
					<td width = "120" align ="center">작성일 </td>
					<td width = "180" align ="center"><%=bean.getReg_date()%> </td>
				</tr>
				
				<tr height = "40">
					<td width = "120" align ="center">이메일 </td>
					<td colspan = "3" align ="center"><%=bean.getEmail()%></td>
				</tr>
								
				<tr height = "40">
					<td width = "120" align ="center">제목 </td>
					<td colspan = "3" align ="center"><%=bean.getSubject()%></td>
				</tr>
				
				<tr height = "80">
					<td width = "120" align ="center">글 내용 </td>
					<td colspan = "3" align ="center"><%=bean.getContent()%></td>
				</tr>
				
				<tr height = "40">
					<td align ="center" colspan = "4">
				 <a href="Main.jsp?center=BoardList.jsp" class="button-link">목록보기</a>
				            <a href="Main.jsp?center=BoardReWriteForm.jsp?num=<%=bean.getNum()%>&ref=<%=bean.getRef()%>&re_stop=<%=bean.getRe_stop()%>&re_level=<%=bean.getRe_level()%>" class="button-link">답글쓰기</a> 
				            <a href="Main.jsp?center=BoardUpdateForm.jsp?num=<%=bean.getNum()%>" class="button-link">수정하기</a> 
				            <a href="Main.jsp?center=BoardDeleteForm.jsp?num=<%=bean.getNum()%>" class="button-link">삭제하기</a> 
				            <input type="button" value="추천" onclick="updateRecommend(<%= num %>)" class="button-link">						
					</td>
				</tr>
				
		</table>
	</center>
	<script>
		function updateRecommend(num) {
			  // 사용자가 해당 게시물(num)을 이미 추천했는지 확인합니다.
			  if (!sessionStorage.getItem("recommended_" + num)) {
			    // 추천하지 않은 경우 요청을 처리하기 위해 XMLHttpRequest 객체를 생성합니다.
			    var xhr = new XMLHttpRequest();
	
			    // 요청을 초기화하고 지정된 URL로 비동기 요청을 전송합니다.
			    xhr.open("GET", "updateRecommend.jsp?num=" + num, true);
	
			    // 요청의 상태가 변경될 때마다 실행되는 이벤트 리스너입니다.
			    xhr.onreadystatechange = function () {
			      // 요청이 완료되었고 현재 상태가 성공(200)일 때
			      if (this.readyState === XMLHttpRequest.DONE && this.status === 200) {
			        // 서버의 응답을 확인하여 결과를 처리합니다.
			        if (this.responseText.trim() === "success") {
			          // 세션 스토리지에 추천한 게시물(num)이 추가됩니다.
			          sessionStorage.setItem("recommended_" + num, true);
			          alert("추천되었습니다.");
			          location.reload();
			        } else {
			          // 추천 진행에 실패한 경우 경고 메시지를 보여줍니다.
			          alert("추천에 실패하였습니다. 다시 시도해주세요.");
			        }
			      }
			    };
	
			    // 요청을 서버로 전송합니다.
			    xhr.send();
			  } else {
			    // 이미 추천한 게시물이라면 사용자에게 알립니다.
			    alert("이미 추천하셨습니다.");
			  }
			}
</script>
</body>
</html>