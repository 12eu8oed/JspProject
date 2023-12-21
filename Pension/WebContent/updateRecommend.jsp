<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="Model.BoardDAO"%>
<%@ page import="Model.BoardBean"%>

<%
  int num = Integer.parseInt(request.getParameter("num").trim());
  BoardDAO dao = new BoardDAO();
  boolean updated = dao.updateRecommend(num);

  if (updated) {
    out.print("success");
  } else {
    out.print("fail");
  }
  out.flush(); // 추가된 코드
%>