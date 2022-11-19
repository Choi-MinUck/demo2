<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.example.dao.MemberDAO, com.example.been.MemberVO"%>
<%@ page import="com.example.common.FileUpload" %>
<%
    String sid = request.getParameter("id");
    if (sid != ""){
        int id = Integer.parseInt(sid);

        MemberVO u = new MemberVO();
        u.setSid(id);
        MemberDAO memberDAO = new MemberDAO();
        //업로드한 photo 파일 삭제
        String filename = memberDAO.getPhotoFilename(id);
        if(filename != null)
            FileUpload.deleteFile(request, filename);

        //회원보호 삭제
        memberDAO.deleteMember(u);
    }
    response.sendRedirect("member_list.jsp");
%>