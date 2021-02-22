<%@page import="java.io.PrintWriter"%>
<%@page import="org.json.simple.JSONArray"%>
<%@ page import="org.json.simple.JSONObject" %>
<%@page import="java.util.HashMap"%>
<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
    
    <%
    request.setCharacterEncoding("utf-8");
    
    Connection conn = null;
    PreparedStatement pstmt = null;
    String str = "";
    JSONArray jsonArray = new JSONArray();
    ResultSet result = null;
    
    try{
   	    String jdbcUrl = "jdbc:mysql://localhost:3306/shop?serverTimezone=UTC&useSSL=false";
   	    String dbId = "root";
   	    String dbPass = "1234";
   	    Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(jdbcUrl,dbId,dbPass);
        String sql = "select * from evaluation";
        pstmt = conn.prepareStatement(sql);
        result = pstmt.executeQuery();
        
        while(result.next()){
        	JSONObject json = new JSONObject();
        	json.put("시간",result.getString("evaluation_id"));
        	json.put("이름",result.getString("name"));
        	json.put("댓글",result.getString("evaluation"));
        	jsonArray.add(json);
         }
        
		
        response.getWriter().print(jsonArray);
        
        

        
     }catch(Exception e){
     	e.printStackTrace();

     	str = "실패";
     }finally {
     	System.out.println(str);
         if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){}
         if(conn != null) try{conn.close();}catch(SQLException sqle){}
         
      }
    %>
    