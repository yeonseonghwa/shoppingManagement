<%@page import="java.io.PrintWriter"%>
<%@page import="org.json.simple.JSONArray"%>
<%@ page import="org.json.simple.JSONObject" %>
<%@page import="java.util.HashMap"%>
<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
    
    <%
    request.setCharacterEncoding("utf-8");
    Timestamp timestamp = new Timestamp(System.currentTimeMillis());
    String posts = request.getParameter("posts");
    
    Connection conn = null;
    PreparedStatement pstmt = null;
    String str = "";
    
    try{
   	    String jdbcUrl = "jdbc:mysql://localhost:3306/shop?serverTimezone=UTC&useSSL=false";
   	    String dbId = "root";
   	    String dbPass = "1234";
   	    Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(jdbcUrl,dbId,dbPass);
        String sql = "insert into notice_board values(?,?)";
        pstmt = conn.prepareStatement(sql);
        pstmt.setTimestamp(1, timestamp);
        pstmt.setString(2,posts);
        pstmt.executeUpdate();
        
        
        str = "게시글 추가되었습니다.";
        %>
        <script>
        alert("게시글 추가되었습니다.");
        </script>
        
        <%
        
     }catch(Exception e){
     	e.printStackTrace();
     	%>
         <script>alert("추가 실패했습니다.")</script>
         <%
     	str = "실패";
     }finally {
     	System.out.println(str);
         if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){}
         if(conn != null) try{conn.close();}catch(SQLException sqle){}
         
      }
    %>
    <script>history.go(-1);</script>
    