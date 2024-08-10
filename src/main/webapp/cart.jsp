<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.HashMap, dto.ProductDTO, java.util.Map.Entry"%>
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
 	<form action="productDelController.jsp" method="POST">
	<h4>-=[장바구니 목록]=-</h4>
	<ol>
	<%
 	HashMap<ProductDTO, Integer> cart = (HashMap<ProductDTO, Integer>)session.getAttribute("cart");
 	
 	if(cart == null || cart.isEmpty()){
 		out.println("장바구니가 비었습니다.");
 	}
 	
 	else {
 		for(Entry<ProductDTO, Integer> data : cart.entrySet()){
 			out.println("<li>");
			out.println("<input type='checkbox' name='product' value='"+data.getKey().getNum()+"'>");
			out.println("<a href='productInfoController.jsp?num="+data.getKey().getNum()+"'>[상품명] "+data.getKey().getName()
					+", [가격] "+data.getKey().getPrice()+"원</a> [구매 수량] "+data.getValue()+"개 ");
			out.println("</li>");
		}
 		out.println("<br><button>선택상품 빼기</button>");
 		%>
		 <br><button type='button' onclick="location.href='buyController.jsp'">장바구니 상품 전체 구매하기</button>
 		<% 
 	}
	%>
	</ol>
	</form>
  </main>
<%@ include file="headerfooter/footer.jsp" %>
</body>
</html>