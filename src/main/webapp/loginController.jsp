<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="dto.MemberDTO" %>
<jsp:useBean class="dto.MemberDTO" id="memberDTO"/>
<jsp:useBean class="dao.MemberDAO" id="memberDAO" scope="session"/>
<jsp:setProperty property="*" name="memberDTO"/>
<%
	MemberDTO data = memberDAO.selectOne(memberDTO);
	if(data == null){
		out.println("<script>alert('로그인 실패');history.go(-1);</script>");
	}
	else{		
		session.setAttribute("user", data.getMid());
		session.setAttribute("userName", data.getName());
		session.setAttribute("role", data.getRole());
		response.sendRedirect("controller.jsp");
	}
%>