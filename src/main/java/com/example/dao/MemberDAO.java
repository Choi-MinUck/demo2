package com.example.dao;

import com.example.been.BoardVO;
import com.example.been.MemberVO;
import com.example.util.JDBCUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class MemberDAO {

    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;

    private final String M_INSERT = "insert into member (userid, password, username, email, photo, blogurl,detail) " + " values(?,sha1(?),?,?,?,?,?)";
    private final String M_UPDATE = "update member set userid=?, username=?, photo=?, email=?, blogurl=?, detail=? where sid=?";
    private final String M_DELETE = "delete from member  where sid=?";
    private final String M_GET = "select * from member  where sid=?";
    private final String M_LIST = "select * from member order by regdate desc";

    public int insertMember(MemberVO data) {
        int result = 0;
        System.out.println("===> JDBC로 insertMember() 기능 처리");
        try {
            conn = JDBCUtil.getConnection();
            stmt = conn.prepareStatement(M_INSERT);
            stmt.setString(1, data.getUserid());
            stmt.setString(2, data.getPassword());
            stmt.setString(3, data.getUsername());
            stmt.setString(4, data.getEmail());
            stmt.setString(5, data.getPhoto());
            stmt.setString(6, data.getBlogurl());
            stmt.setString(7, data.getDetail());
            result = stmt.executeUpdate();
            return 1;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    // 글 삭제
    public void deleteMember(MemberVO data) {
        System.out.println("===> JDBC로 deleteMember() 기능 처리");
        try {
            conn = JDBCUtil.getConnection();
            stmt = conn.prepareStatement(M_DELETE);
            stmt.setInt(1, data.getSid());
            stmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public int updateMember(MemberVO data) {
        System.out.println("===> JDBC로 updateMember() 기능 처리");
        try {
            conn = JDBCUtil.getConnection();
            stmt = conn.prepareStatement(M_UPDATE);
            stmt.setString(1, data.getUserid());
            stmt.setString(2, data.getUsername());
            stmt.setString(3, data.getPhoto());
            stmt.setString(4, data.getEmail());
            stmt.setString(5, data.getBlogurl());
            stmt.setString(6, data.getDetail());

            System.out.println(data.getUsername() + "-" + data.getPhoto() + "-" + data.getEmail() + "-"  + data.getDetail());
            stmt.executeUpdate();
            return 1;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public MemberVO getMember(int sid) {
        MemberVO one = new MemberVO();
        System.out.println("===> JDBC로 getMember() 기능 처리");
        try {
            conn = JDBCUtil.getConnection();
            stmt = conn.prepareStatement(M_GET);
            stmt.setInt(1, sid);
            rs = stmt.executeQuery();
            if(rs.next()) {
                one.setSid(rs.getInt("sid"));
                one.setUserid(rs.getString("userid"));
                one.setUsername(rs.getString("username"));
                one.setPassword(rs.getString("password"));
                one.setEmail(rs.getString("email"));
                one.setBlogurl(rs.getString("blogurl"));
                one.setPhoto(rs.getString("photo"));
                one.setDetail(rs.getString("detail"));
                one.setRegdate(rs.getDate("regdate"));
            }
            rs.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return one;
    }

    public List<MemberVO> getMemberList(){
        List<MemberVO> list = new ArrayList<MemberVO>();
        System.out.println("===> JDBC로 getBoardList() 기능 처리");
        try {
            conn = JDBCUtil.getConnection();
            stmt = conn.prepareStatement(M_LIST);
            rs = stmt.executeQuery();
            while(rs.next()) {
                MemberVO one = new MemberVO();
                one.setSid(rs.getInt("sid"));
                one.setUserid(rs.getString("userid"));
                one.setUsername(rs.getString("username"));
                one.setPhoto(rs.getString("photo"));
                one.setEmail(rs.getString("email"));
                one.setRegdate(rs.getDate("regdate"));
                list.add(one);
            }
            rs.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public String getPhotoFilename(int sid){
        String filename = null;
        try{
            conn = JDBCUtil.getConnection();
            stmt = conn.prepareStatement(M_GET);
            stmt.setInt(1, sid);
            rs = stmt.executeQuery();
            if(rs.next()){
                filename = rs.getString("photo");
            }
            rs.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println("===> JDBC로 getPhotoFilename() 기능 처리");
        return filename;
    }
}
