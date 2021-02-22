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
    ResultSet result = null;
    
    try{
   	    String jdbcUrl = "jdbc:mysql://localhost:3306/shop?serverTimezone=UTC&useSSL=false";
   	    String dbId = "root";
   	    String dbPass = "1234";
   	    Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(jdbcUrl,dbId,dbPass);
        String sql = "select goods.goods_id, "+
        		"goods.name, "+
        		"goods_information.size, "+
        	    "goods_information.color, "+
        	    "goods_information.price, "+
        	    "goods_attribute.info " +
        		"from goods "+
        	    "inner join goods_information on goods.goods_id=goods_information.goods_id "+
        		"inner join goods_attribute on goods.goods_id=goods_attribute.goods_id "+
        	    "where goods.goods_id=?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1,goods_id);
        result = pstmt.executeQuery();
        
        

        while(result.next()){
        	JSONObject json = new JSONObject();
        	json.put("번호",result.getString("goods_id"));
        	json.put("이름",result.getString("name"));
        	json.put("색상",result.getString("color")); 
        	json.put("사이즈",result.getString("size")); 
        	json.put("가격",result.getString("price"));
        	json.put("소개",result.getString("info"));
        	jsonArray.add(json);
         }
        response.getWriter().print(jsonArray);
        %>

        <%
        
        str = "성공적으로 조회되었습니다.";

        
     }catch(Exception e){
     	e.printStackTrace();
     	str = "실패";
     }finally {
     	System.out.println(str);
         if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){}
         if(conn != null) try{conn.close();}catch(SQLException sqle){}
         
      }
    %>
