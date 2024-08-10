<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, dto.ProductDTO, dto.MemberDTO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <link rel="stylesheet" type="text/css" href="css/common.css">
</head>
<body>
  <%
  	String user = (String)session.getAttribute("user");
  	String role = (String)session.getAttribute("role"); 
  	String userName = (String)session.getAttribute("userName"); 
  	ProductDTO data = (ProductDTO) request.getAttribute("data");
  %>
  
<%@ include file="headerfooter/header.jsp" %>

  <main>
    <h1>제품 상세화면</h1>
    <%
    if (user != null){
    	out.println("<h3 class='login'>"+userName+"님 안녕하세요.</h3>");
    }
    %>
    <!-- 1.상품 목록 출력, 상품 선택 버튼, 2.상품 검색버튼 -->
	<form action="productController.jsp" method="POST">
		<h3>-=[상품 정보]=-</h3>
		<%
			if(data != null){				
				out.println("<div class='center'>[상품명] "+data.getName()+", [수량] "+data.getCnt()+"개, [가격] "+data.getPrice()+"원</div>");
				out.println("<div class='center'>"+data.getDetails()+"</div>");
				if(user != null){					
					out.println("<input type='hidden' name='product' value='"+data.getNum()+"'>");
					out.println("<br><button>물건 담기</button>");
				}
			}
			else{
				out.println("<div>상품 정보를 불러올 수 없습니다.</div>");				
			}
		%>
	</form>
  </main>
  
<%@ include file="headerfooter/footer.jsp" %>
</body>
</html>