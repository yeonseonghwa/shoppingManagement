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
    
    
    
    Connection conn = null;
    PreparedStatement pstmt = null;
    String str = "";
    JSONArray jsonArray = new JSONArray();
    ResultSet result_goods = null;
    ResultSet result_goods_information = null;
    
    try{
   	    String jdbcUrl = "jdbc:mysql://localhost:3306/shop?serverTimezone=UTC&useSSL=false";
   	    String dbId = "root";
   	    String dbPass = "1234";
   	    Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(jdbcUrl,dbId,dbPass);
        String sql = "delete from goods where goods_id=?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1,goods_id);
        pstmt.executeUpdate();

        %>
        <script>alert("삭제 되었습니다.")</script>
        <%
        
        str = "삭제 되었습니다.";

        
     }catch(Exception e){
     	e.printStackTrace();
     	%>
        <script>alert("삭제 실패했습니다.")</script>
        <%
     	str = "실패";
     }finally {
     	System.out.println(str);
         if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){}
         if(conn != null) try{conn.close();}catch(SQLException sqle){}
         
      }
    %>
	<script>history.go(-1);</script>