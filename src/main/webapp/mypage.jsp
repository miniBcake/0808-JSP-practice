<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <link rel="stylesheet" type="text/css" href="css/common.css">
</head>
<body>
  <%@ include file="headerfooter/header.jsp" %>

  <main>
    <h1><%=(String)session.getAttribute("userName") %>님의 마이페이지</h1>
	<form action="mypageController.jsp" method="POST">
	<input type="text" name="name" placeholder="변경할 이름을 입력하세요.">
	<button>이름 변경</button>
	</form>
	<button type="button" onclick="byeController.jsp">회원탈퇴</button>
  </main>
  
 <%@ include file="headerfooter/footer.jsp" %>
</body>
</html>