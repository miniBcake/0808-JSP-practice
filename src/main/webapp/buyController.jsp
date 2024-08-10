<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.HashMap, dto.ProductDTO, java.util.Map.Entry"%>
<jsp:useBean class="dto.ProductDTO" id="productDTO"/>
<jsp:useBean class="dao.ProductDAO" id="productDAO"/>
<%
HashMap<ProductDTO, Integer> cart = (HashMap<ProductDTO, Integer>)session.getAttribute("cart");

if(cart != null){
	for(Entry<ProductDTO, Integer> product : cart.entrySet()){
		ProductDTO data = new ProductDTO();
		data.setNum(product.getKey().getNum());
		data.setCnt(product.getValue());
		productDAO.update(data);
	}
}
session.removeAttribute("cart");
response.sendRedirect("index.jsp");
%>