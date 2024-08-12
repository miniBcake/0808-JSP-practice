<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<jsp:useBean class="dto.MemberDTO" id="memberDTO"/>
<jsp:useBean class="dao.MemberDAO" id="memberDAO"/>
<%
    memberDTO.setMid((String)session.getAttribute("user"));
    if(memberDAO.delete(memberDTO)){
        //삭제 성공
        out.println("<script>alert('회원탈퇴성공!');</script>");
        //세션값을 비우기 위해 로그아웃을 진행한다
        out.println("<script>location.href = 'ctrl.jsp?action=LOGOUT';</script>");
    }
    else{
        //삭제 실패
        out.println("<script>alert('회원탈퇴 실패. 관리자에게 문의하세요.');</script>");
        out.println("<script>location.href = 'ctrl.jsp?action=MAIN';</script>");
    }
%>