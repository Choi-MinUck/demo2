<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
</head>
<body>

<h1>Add New Post</h1>
<form action="add_member.jsp" method="post">
    <table>
        <tr><td>userid:</td><td><input type="text" name="userid"/></td></tr>
        <tr><td>username:</td><td><input type="text" name="username"/></td></tr>
        <tr><td>password:</td><td><input type="text" name="password"/></td></tr>
        <tr><td>email:</td><td><input type="text" name="email"/></td></tr>
        <tr><td>blogurl:</td><td><input type="text" name="blogurl"/></td></tr>
        <tr><td>photo:</td><td><input type="text" name="photo"/></td></tr>
        <tr><td>detail:</td><td><textarea cols="50" rows="5" name="detail"></textarea></td></tr>
        <tr><td><a href="member_list.jsp">View All Members</a></td><td align="right"><input type="submit" value="Add Member"/></td></tr>
    </table>
</form>

</body>
</html>