<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, dto.ProductDTO, dto.MemberDTO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인페이지</title>
</head>
<body>
  <%
  	String user = (String)session.getAttribute("user");
  	String role = (String)session.getAttribute("role"); 
  	String userName = (String)session.getAttribute("userName"); 
  	ArrayList<ProductDTO> datas = (ArrayList<ProductDTO>) request.getAttribute("datas");
  %>
  <%@ include file="headerfooter/header.jsp" %>

  <main>
    <h1>메인화면입니다.</h1>
    <%
    if (user != null){
    	out.println("<h3 class='login'>"+userName+"님 안녕하세요.</h3>");
    }
    %>
    <form action="controller.jsp" method="GET">
    	<select name="type">
    		<option>상품명</option>
    		<option>판매자</option>
    	</select>
    	<input type="text" name="searchKeyword" placeholder="검색어를 입력하세요.">
    	<input type="submit" value="검색">
    </form>
	<h3>상품 목록</h3>
	<form action="productController.jsp" method="POST">
		<ol>
			<%
				if(datas == null || datas.isEmpty()){
					out.println("<div class='result-none'>상품이 없습니다.</div>");
				}
				else {					
					for(ProductDTO data : datas){
						out.println("<li>");
						if(data.getCnt() <= 0){
							out.println("<strong>[품절]</strong> [상품명] "+data.getName());
						}
						else{
							out.println("<input type='checkbox' name='product' value='"+data.getNum()+"'>");
							out.println("<a href='productInfoController.jsp?num="+data.getNum()+"'>[상품명] "+data.getName()+", [수량] "+data.getCnt()+"개, [가격] "+data.getPrice()+"원</a>");
						}
						out.println("</li>");
 					}
					out.println("<br><button>물건 담기</button>");
				}
			%>
		</ol>
	</form>
  </main>
  
  <%@ include file="headerfooter/footer.jsp" %>
</body>
</html>