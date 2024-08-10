<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean class="dto.ProductDTO" id="productDTO"/>
<jsp:useBean class="dao.ProductDAO" id="productDAO"/>
<%
String searchType = request.getParameter("type");
String role = (String)session.getAttribute("role");
if(!"ADMIN".equals(role)){
	response.sendRedirect("index.jsp");
}
if(searchType != null){	
	String searchKeyword = request.getParameter("searchKeyword");
	if(searchType.equals("상품명")){
		productDTO.setCondition("SEARCH_NAME");
		productDTO.setName(searchKeyword);
	}
	else if(searchType.equals("판매자")){
		productDTO.setCondition("SEARCH_SELLER");
		productDTO.setSeller(searchKeyword);
	}
}
else {		
	productDTO.setCondition("ALL");
}
request.setAttribute("datas", productDAO.selectAll(productDTO));
pageContext.forward("admin.jsp");
%>