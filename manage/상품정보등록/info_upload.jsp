<%@page import="java.io.PrintWriter"%>
<%@page import="org.json.simple.JSONArray"%>
<%@ page import="org.json.simple.JSONObject" %>
<%@page import="java.util.HashMap"%>
<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
    
    <%
    request.setCharacterEncoding("utf-8");
    String id = request.getParameter("goods_id");
	int goods_id = Integer.parseInt(id);
	String info = request.getParameter("goods_attr");
    
    Connection conn = null;
    PreparedStatement pstmt = null;
    String str = "";
    
    try{
   	    String jdbcUrl = "jdbc:mysql://localhost:3306/shop?serverTimezone=UTC&useSSL=false";
   	    String dbId = "root";
   	    String dbPass = "1234";
   	    Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(jdbcUrl,dbId,dbPass);

        
        String sql = "update goods_attribute SET info=? where goods_id=?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1,info);
        pstmt.setInt(2,goods_id);
        pstmt.executeUpdate();
        
        str = "소개 추가되었습니다.";
        %>
        <script>
        alert("소개 추가되었습니다.");
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
    