<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean class="dto.MemberDTO" id="memberDTO"/>
<jsp:useBean class="dao.MemberDAO" id="memberDAO" scope="session"/>
<jsp:setProperty property="*" name="memberDTO"/>
<%
	if(memberDAO.selectOne(memberDTO) == null){
		if(memberDAO.insert(memberDTO)){
			//성공
			out.println("<script>alert('회원가입 성공!');location.href = 'controller.jsp';</script>");
		}
		else{
			//insert실패
			out.println("<script>alert('회원가입 불가. 관리자에게 문의하세요.');location.href = 'controller.jsp';</script>");
		}
	}
	else{
		//아이디 중복
		out.println("<script>alert('해당 아이디 사용 불가');history.go(-1);</script>");
	}
%>