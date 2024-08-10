<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean class="dto.ProductDTO" id="productDTO"/>
<jsp:useBean class="dao.ProductDAO" id="productDAO"/>
<%
	productDTO.setNum(Integer.parseInt(request.getParameter("num")));
	request.setAttribute("data", productDAO.selectOne(productDTO));
	pageContext.forward("productInfo.jsp");
%>