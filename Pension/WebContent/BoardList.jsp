<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="Model.BoardDAO"%>
<%@ page import="Model.BoardBean"%>
<%@ page import="java.util.Vector"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>제주한달살이</title>
    <!-- Bootstrap CSS CDN -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
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
            font-weight: bold;
        }

        .button-link:hover {
            background-color: #FF8800;
        }
    </style>
<!-- Bootstrap JS and Popper.js CDN -->
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</head>
<body>
<%
    int pageSize = 10;
    String pageNum = request.getParameter("pageNum");
    if (pageNum == null) {
        pageNum = "1";
    }
    int count = 0;
    int number = 0;
    int currentPage = Integer.parseInt(pageNum);
    BoardDAO bdao = new BoardDAO();
    count = bdao.getAllCount();
    int startRow = (currentPage - 1) * pageSize + 1;
    int endRow = currentPage * pageSize;
    Vector<BoardBean> vec = bdao.getAllBoard(startRow, endRow);
    number = count - (currentPage - 1) * pageSize;
%>

<div class="container mt-5">
    <h2 class="text-center mb-4">전체 게시글 보기</h2>


	 <div class="text-right mb-3">
        <input type="button" value="글쓰기" class="button-link" onclick="location.href='Main.jsp?center=BoardWriteForm.jsp'">
    </div>
    <table class="table table-bordered table-striped">
        <thead class="thead-light">
        <tr>
            <th scope="col" width="50" class="text-center">번호</th>
            <th scope="col" width="320" class="text-center">제목</th>
            <th scope="col" width="100" class="text-center">작성자</th>
            <th scope="col" width="150" class="text-center">작성일</th>
            <th scope="col" width="80" class="text-center">조회수</th>
        </tr>
        </thead>
        <tbody>
        <% for(int i=0; i < vec.size(); i++){
            BoardBean bean = vec.get(i);
        %>
            <tr>
                <td class="text-center"><%=number--%></td>
                <td>
                    <a href="Main.jsp?center=BoardInfo.jsp?num=<%=bean.getNum()%>" style="text-decoration:none;">
                        <% if(bean.getRe_stop() > 1){
                            for(int j = 0; j < (bean.getRe_stop()-1)*5; j++){
                        %>
                                &nbsp;
                        <% }
                        } %>
                        <%=bean.getSubject()%>
                    </a>
                </td>
                <td class="text-center"><%=bean.getWrite()%></td>
                <td class="text-center"><%=bean.getReg_date()%></td>
                <td class="text-center"><%=bean.getReadcount()%></td>
            </tr>
        <% } %>
        </tbody>
    </table>

    <nav aria-label="Page navigation example" class="mt-4">
        <ul class="pagination justify-content-center">
            <% if(count > 0){
                int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1 );
                int startPage = (currentPage - 1) / 10 * 10 + 1;
                int pageBlock = 10;
                int endPage = startPage + pageBlock - 1;
                if(endPage > pageCount) endPage = pageCount;

                if(startPage > 10){ %>
                    <li class="page-item">
                        <a class="page-link" href="Main.jsp?center=BoardList.jsp?pageNum=<%=startPage-10%>" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                <% }
                for(int i = startPage; i <= endPage; i++){ %>
                    <li class="page-item <%= (i == currentPage) ? "active" : "" %>">
                        <a class="page-link" href="Main.jsp?center=BoardList.jsp?pageNum=<%=i%>"><%=i%></a>
                    </li>
                <% }
                if(endPage < pageCount){ %>
                    <li class="page-item">
                        <a class="page-link" href="Main.jsp?center=BoardList.jsp?pageNum=<%=startPage+10%>" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                <% }
            } %>
        </ul>
    </nav>
</div>
</body>
</html>
