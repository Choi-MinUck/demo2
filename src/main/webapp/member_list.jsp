<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="com.example.dao.MemberDAO" %>
<%@ page import="com.example.been.MemberVO" %>
<%@ page import="java.util.List" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>free board</title>
    <style>
        #list {
            font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
            border-collapse: collapse;
            width: 100%;
        }
        #list td, #list th {
            border: 1px solid #ddd;
            padding: 8px;
            text-align:center;
        }
        #list tr:nth-child(even){background-color: #f2f2f2;}
        #list tr:hover {background-color: #ddd;}
        #list th {
            padding-top: 12px;
            padding-bottom: 12px;
            text-align: center;
            background-color: #006bb3;
            color: white;
        }
    </style>
    <script>
        function delete_ok(id){
            var a = confirm("정말로 삭제하겠습니까?");
            if(a) location.href='delete_member.jsp?id=' + id;
        }
    </script>
</head>
<body>
<h1>User List </h1>
<%
    MemberDAO memberDAO = new MemberDAO();
    List<MemberVO> list = memberDAO.getMemberList();
    request.setAttribute("list",list);

%>
<table id="list" width="90%">
    <tr>
        <th>Id</th>
        <th>User Id</th>
        <th>Username</th>
        <th>Photo</th>
        <th>Email</th>
        <th>Regdate</th>
        <th>Edit</th>
        <th>Delete</th>
    </tr>
    <c:forEach items="${list}" var="member">
        <tr>
            <td>${member.getSid()}</td>
            <td>${member.getUserid()}</td>
            <td>${member.getUsername()}</td>
            <td><c:if test="${member.getPhoto() ne ''}"><br /><img src="${pageContext.request.contextPath}/upload/${member.getPhoto()}" class="photo"></c:if></td>
            <td>${member.getEmail()}</td>
            <td>${member.getRegdate()}</td>
            <td><a href="edit_member_form.jsp?id=${member.getSid()}">Edit</a></td>
            <td><a href="javascript:delete_ok('${member.getSid()}')">Delete</a></td>
        </tr>
    </c:forEach>
</table>
<br/><a href="add_member_form.jsp">Add New Member</a>
<br/><a href="posts.jsp">See Post List</a>
</body>
</html>