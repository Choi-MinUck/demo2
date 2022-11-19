<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.File" %>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>파일 업로드 결과</title>
</head>
<body>
<%
    String filename = ""; //업로드되는 파일 이름 저장용
    int sizeLimit = 15 * 1024 * 1024; //파일크기 15mb 제한
    //실제로 서버에 저장되는 path를 upload로 정한다.
    String realPath = request.getServletContext().getRealPath("upload");
    //System.out.println(realPath);

    //혹시 저장될 경로가 없으면 생성한다.
    File dir = new File(realPath);
    if (!dir.exists()){
        dir.mkdirs();
    }

    //파일 업로드 처리하는 과정
    //파라미터 : request, 파일저장경로, 최대용량, 인코딩, 중복파일명에 대한 정책
    //DefaultFileRemamePolicy() - 중복된 이름이 존재할 경우의 처리방법 - 뒤에 숫자붙임
    MultipartRequest multipartRequest = new MultipartRequest(request, realPath, sizeLimit, "utf-8", new DefaultFileRenamePolicy());

    //"photo"라는 이름으로 전송되어 업로드된 파일 이름을 가져옴
    filename = multipartRequest.getFilesystemName("photo");

%>

폼에서 전송된 원래 파일명: <%=multipartRequest.getOriginalFileName("photo")%><br />
업로드한 파일의 경로 : ${pageContext.request.contextPath }/upload/<%=filename%><br />
물리적인 저장 경로 : <%=realPath%><br />
<img src="${pageContext.request.contextPath }/upload/<%=filename%>">

파일명: <%=filename%>
</body>
</html>
