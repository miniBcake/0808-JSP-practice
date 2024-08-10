<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, dto.ProductDTO, dto.MemberDTO, dto.MemberDTO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자페이지</title>
  <link rel="stylesheet" type="text/css" href="css/common.css">
</head>
<body>
  <%
	ArrayList<ProductDTO> datas = (ArrayList<ProductDTO>) request.getAttribute("datas");
  %>
  <%@ include file="headerfooter/header.jsp" %>
 
 <main>
 <h2>관리자 페이지입니다.</h2>
 <form action="adminAddController.jsp" method="POST">
 	상품명 <input type="text" name="name" placeholder="상품명을 입력하세요." required> <br>
 	상품설명 <input type="text" name="details" placeholder="상품설명을 입력하세요." required> <br>
 	상품개수 <input type="number" name="cnt" min="0" placeholder="상품개수를 설정하세요." value="0"> <br>
 	상품가격 <input type="number" name="price" min="0" placeholder="상품가격을 입력하세요." required> <br>
 	판매자 <input type="text" name="seller" placeholder="판매자를 입력하세요." required> <br>	
	 <button>상품추가하기</button>
 </form>
<h3>상품 목록</h3>
<form action="adminController.jsp" method="GET">
	<select name="type">
		<option>상품명</option>
		<option>판매자</option>
	</select>
	<input type="text" name="searchKeyword" placeholder="검색어를 입력하세요.">
	<input type="submit" value="검색">
</form>
 <form action="adminDelController.jsp" method="POST">
	<ol>
		<%
			if(datas == null || datas.isEmpty()){
				out.println("<div class='result-none'>상품이 없습니다.</div>");
			}
			else {					
				for(ProductDTO data : datas){
					out.println("<li>");
					out.println("<input type='checkbox' name='product' value='"+data.getNum()+"'>");
					if(data.getCnt() <= 0){
						out.println("<strong>[품절]</strong> [상품명] "+data.getName()
								+", [수량] "+data.getCnt()+"개, [가격] "+data.getPrice()+"원");
					}
					else{
						out.println("[상품명] "+data.getName()
						+", [수량] "+data.getCnt()+"개, [가격] "+data.getPrice()+"원");
					}
					out.println("</li>");
 				}
				out.println("<br><button>상품 삭제하기</button>");
			}
		%>
	</ol>
 </form>
 </main>
 <%@ include file="headerfooter/footer.jsp" %>
</body>
</html>