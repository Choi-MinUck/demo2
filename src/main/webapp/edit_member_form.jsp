<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@page import="com.example.dao.MemberDAO, com.example.been.MemberVO"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Form</title>
</head>
<body>

<%
    MemberDAO memberDAO = new MemberDAO();
    String id=request.getParameter("id");
    MemberVO u=memberDAO.getMember(Integer.parseInt(id));
    request.setAttribute("u", u);
%>

<h1>Edit Form</h1>
<form action="edit_member.jsp" method="post" enctype="multipart/form-data">
    <input type="hidden" name="sid" value="<%=u.getSid()%>"/>
    <table>
        <tr><td>userid:</td><td><input type="text" name="userid" value="<%= u.getUserid()%>"/></td></tr>
        <tr><td>username:</td><td><input type="text" name="username" value="<%= u.getUsername()%>"/></td></tr>
        <tr><td>photo:</td><td><input type="file" name="photo" value="<%= u.getPhoto()%>"/><c:if test="${u.getPhoto() ne ''}"><br /><img src="${pageContext.request.contextPath }/upload/${u.getPhoto()}" class="photo"></c:if></td></tr>
        <tr><td>email:</td><td><input type="text" name="email" value="<%= u.getEmail()%>"/></td></tr>
        <tr><td>blogurl:</td><td><input type="text" name="blogurl" value="<%= u.getBlogurl()%>"/></td></tr>
        <tr><td>detail:</td><td><textarea cols="50" rows="5" name="detail"><%= u.getDetail()%></textarea></td></tr>
        <tr><td colspan="2"><input type="submit" value="Edit Member"/>
            <input type="button" value="Cancel" onclick="history.back()"/></td></tr>
    </table>
</form>

</body>
</html>