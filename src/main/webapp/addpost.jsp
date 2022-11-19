<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.example.dao.BoardDAO"%>
<jsp:useBean id="u" class="com.example.been.BoardVO" />
<jsp:setProperty property="*" name="u"/>

<%
	request.setCharacterEncoding("utf-8");
	BoardDAO boardDAO = new BoardDAO();
	int i = boardDAO.insertBoard(u);
	String msg = "데이터 추가 성공 !";
	if(i == 0) msg = "[에러] 데이터 추가 실패";
%>

<script>
	alert('<%=msg%>');
	location.href='posts.jsp';
</script>