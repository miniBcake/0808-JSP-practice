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
  <header>
    <nav>
      <a href="controller.jsp"><img src="img/home.png" alt="메인화면"></a> 
      <%
      	if(session.getAttribute("user") != null){
      		%>
      		<div id='login-header'>
		      	<a href="cart.jsp"><img src='img/cart.png' alt='장바구니'></a>
		      	<a href="mypage.jsp"><img src='img/user.png' alt='마이페이지'></a>
	  			<button type='button' id="logout-button" onclick="location.href='logoutController.jsp'">로그아웃</button>
      		</div>
      		<%
      	}
      	else {
      		%>
      		<div id='logout-header'>
  				<button type='button' onclick="location.href='login.jsp'">로그인</button>
  				<button type='button' onclick="location.href='join.jsp'">회원가입</button>
			</div>
      		<%
      	}
      %>
    </nav>
  </header>
</body>
</html>