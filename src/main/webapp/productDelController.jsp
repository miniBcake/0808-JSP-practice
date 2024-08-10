<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.HashMap, dto.ProductDTO, java.util.Map.Entry"%>
<jsp:useBean class="dto.ProductDTO" id="productDTO"/>
<jsp:useBean class="dao.ProductDAO" id="productDAO"/>
<%
String[] datas = request.getParameterValues("product");
HashMap<ProductDTO, Integer> cart = (HashMap<ProductDTO, Integer>)session.getAttribute("cart");

if(cart == null){
	response.sendRedirect("cart.jsp");
}

if(datas != null){
	for(String num : datas){
		for(Entry<ProductDTO, Integer> product : cart.entrySet()){
			if((product.getKey().getNum()+"").equals(num)){
				cart.put(product.getKey(), product.getValue() - 1);
				if(product.getValue() <= 0){
					cart.remove(product.getKey());
				}
				break;
			}
		}
	}
}
response.sendRedirect("cart.jsp");
%>