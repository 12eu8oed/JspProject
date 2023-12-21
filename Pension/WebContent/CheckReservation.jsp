<%@page import="db.CreateCode"%>
<%@page import="db.PensionDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
   <style>
      body {
         font-family: Arial, sans-serif;
         background-color: #ffffff;
      }

      h2 {
         color: #333333;
      }

      .container {
         display: flex;
         justify-content: center;
         align-items: center;
         flex-direction: column;
         background-color: #ffffff;
         box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
         padding: 40px;
         max-width: 400px;
         margin: auto;
      }
      
      .btn {
         background-color: #333333;
         color: #ffffff;
         border: none;
         padding: 10px 20px;
         text-align: center;
         text-decoration: none;
         display: inline-block;
         font-size: 16px;
         margin: 10px 2px;
         cursor: pointer;
      }
      
      .search-input {
         width: 100%;
         padding: 12px 20px;
         margin-bottom: 20px;
         box-sizing: border-box;
         border: 1px solid #cccccc;
         transition: 0.2s;
      }
      
      .search-input:focus {
         border: 1px solid #333333;
      }
      
      .search-button {
         border: none;
         outline: none;
         color: white;
         background-color: #333333;
         padding: 10px 20px;
         text-align: center;
         text-decoration: none;
         display: inline-block;
         font-size: 16px;
         transition: 0.2s;
      }
     
      .search-button:hover {
         background-color: #666666;
      }

      .info {
         font-size: 24px;
         color: #333333;
         margin-bottom: 20px;
      }

   </style>
</head>
<body>
   <% 
      request.setCharacterEncoding("UTF-8");
   
      int id=Integer.parseInt(request.getParameter("id"));
      int price = Integer.parseInt(request.getParameter("price"));
      int month=Integer.parseInt(request.getParameter("month"));
      
      String account = new String(request.getParameter("account").getBytes("Cp1252"), "EUC-KR");
                  
      String name = new String(request.getParameter("name").getBytes("Cp1252"), "EUC-KR");
      
      
      PensionDAO pdao = new PensionDAO();
      
      
   %>

   <div class="container">
      <h2>����Ȯ��</h2>
      <p class="info">��ȣ�� <%=name%></p>
      <p class="info">�Ⱓ <%=month%>�� �Ѵ�</p>
      <p class="info">���� <%=price%>��</p>
      <p>������ ���Ͻø� ��ĭ�� ��ȭ��ȣ �Է� ��<br>���� ��ư�� ��������</p>
      

      <form action="Main.jsp?center=CompleteReservation.jsp" method="post">
         <input type="text" name="phone" class="search-input" placeholder="��ȭ��ȣ�� �Է��ϼ���">
         <input type="hidden" name="id" value="<%=id%>">
         <input type="hidden" name="account" value="<%=account%>">
         <input type="hidden" name="price" value="<%=price%>">
         <input type="submit" value="����" class="search-button" style="background-color: #4CAF50;">
      </form>
      <button class="btn" onclick="location.href='Main.jsp'" style="background-color: #FF0000;">���ư���</button>
   </div>

</body>
</html>