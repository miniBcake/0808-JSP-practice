<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!--   <link rel="stylesheet" type="text/css" href="css/common.css"> -->
</head>
<body>
  <footer>
  <section>
        <%
	    if ("ADMIN".equals((String)session.getAttribute("role"))){
	    	out.println("<a href='adminController.jsp'>⚙️관리자페이지⚙️</a>");
	    }
	    %>
  </section>
  </footer>
</body>
</html>