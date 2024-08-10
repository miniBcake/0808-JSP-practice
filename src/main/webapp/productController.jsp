<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.HashMap, dto.ProductDTO, java.util.Map.Entry"%>
<jsp:useBean class="dto.ProductDTO" id="productDTO"/>
<jsp:useBean class="dao.ProductDAO" id="productDAO"/>
<%
	String[] datas = request.getParameterValues("product");
	HashMap<ProductDTO, Integer> cart = (HashMap<ProductDTO, Integer>)session.getAttribute("cart");
	
	if(cart == null){
 		cart = new HashMap<>();
 		session.setAttribute("cart", cart);
 	}
	
	if(datas != null){
		for(String num : datas){
			boolean flag = false;
			for(Entry<ProductDTO, Integer> product : cart.entrySet()){
				if((product.getKey().getNum()+"").equals(num)){
					//이미 있는 상품이라면 카운트 증가
					cart.put(product.getKey(), product.getValue() + 1);
					flag = true;
					break;
				}
			}
			if(!flag){
				//장바구니에 새로 추가
				productDTO.setNum(Integer.parseInt(num));
				cart.put(productDAO.selectOne(productDTO), 1);
			}
			
		}
	}
	response.sendRedirect("cart.jsp");
	
%>