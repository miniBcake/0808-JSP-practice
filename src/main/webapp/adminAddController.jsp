<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean class="dto.ProductDTO" id="productDTO"/>
<jsp:useBean class="dao.ProductDAO" id="productDAO"/>
<jsp:setProperty property="*" name="productDTO"/>
<%
	if(productDAO.insert(productDTO)){
		out.println("<script>alert('상품추가성공!');</script>");
	}
	else{
		//insert실패
		out.println("<script>alert('상품추가 실패. 관리자에게 문의하세요.');</script>");
	}
	out.println("<script>location.href = 'adminController.jsp';</script>");
%>