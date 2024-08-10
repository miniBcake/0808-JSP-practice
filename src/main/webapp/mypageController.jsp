<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean class="dto.MemberDTO" id="memberDTO"/>
<jsp:useBean class="dao.MemberDAO" id="memberDAO" scope="session"/>
<jsp:setProperty property="*" name="memberDTO"/>
<%
	memberDTO.setMid((String)session.getAttribute("user"));
	if(memberDAO.update(memberDTO)){
		session.setAttribute("userName", memberDTO.getName());
		out.println("<script>alert('이름변경 성공!');</script>");
	}
	else{
		out.println("<script>alert('이름변경 실패, 관리자에게 문의하세요.');</script>");
	}
	out.println("<script>location.href = 'mypage.jsp';</script>");
%>