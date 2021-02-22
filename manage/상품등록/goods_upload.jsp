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
    String goods_name = request.getParameter("goods_name");
    String size = request.getParameter("goods_size");
    int goods_size = Integer.parseInt(size);
    String goods_color = request.getParameter("goods_color");
    String price = request.getParameter("goods_price");
    int goods_price = Integer.parseInt(price);
    String info = null;
    
    Connection conn = null;
    PreparedStatement pstmt = null;
    String str = "";
    
    try{
   	    String jdbcUrl = "jdbc:mysql://localhost:3306/shop?serverTimezone=UTC&useSSL=false";
   	    String dbId = "root";
   	    String dbPass = "1234";
   	    Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(jdbcUrl,dbId,dbPass);
        
        String sql = "insert into goods_history values(?)";
        pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1,goods_id);
        pstmt.executeUpdate();
        
        sql = "insert into goods values(?,?)";
        pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1,goods_id);
        pstmt.setString(2,goods_name);
        pstmt.executeUpdate();
        
        sql = "insert into goods_information values(?,?,?,?)";
        pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1,goods_id);
        pstmt.setInt(2,goods_size);
        pstmt.setString(3,goods_color);
        pstmt.setInt(4,goods_price);
        pstmt.executeUpdate();
        
        sql = "insert into goods_attribute values(?,?)";
        pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1,goods_id);
        pstmt.setString(2,info);
        pstmt.executeUpdate();
        
        str = "상품 추가되었습니다.";
        %>
        <script>
        alert("상품 추가되었습니다.");
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
    