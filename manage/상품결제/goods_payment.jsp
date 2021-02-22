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
    String id = request.getParameter("goods_id");
    int goods_id = Integer.parseInt(id);
    
    Connection conn = null;
    PreparedStatement pstmt = null;
    String str = "";
    String pr,na;
    ResultSet result = null;
    
    try{
   	    String jdbcUrl = "jdbc:mysql://localhost:3306/shop?serverTimezone=UTC&useSSL=false";
   	    String dbId = "root";
   	    String dbPass = "1234";
   	    Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(jdbcUrl,dbId,dbPass);
        System.out.println("1");
        String sql = "select goods.name,goods_information.price "+
        		"from goods "+
        		"inner join goods_information on goods.goods_id=goods_information.goods_id "+
        		"where goods.goods_id=?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1,goods_id);
        result = pstmt.executeQuery();
        
        System.out.println("2");
        JSONObject json = new JSONObject();
        while(result.next()){
        	json.put("price",result.getString("price"));
        	json.put("name",result.getString("name"));
         }
        pr = String.valueOf(json.get("price"));
        na = String.valueOf(json.get("name"));
        System.out.println("3");
        sql = "insert into sales values(?,?,?,?)";
        pstmt = conn.prepareStatement(sql);
        pstmt.setTimestamp(1, timestamp);
        pstmt.setInt(2,goods_id);
        pstmt.setString(3,pr);
        pstmt.setString(4,na);
        pstmt.executeUpdate();
        System.out.println("3");
        sql = "delete from goods where goods_id=?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, goods_id);
        pstmt.executeUpdate();
        System.out.println("4");
        str = "결제가 완료되었습니다.";
        %>
        <script>
        alert("결제가 완료되었습니다.");
        </script>
        
        <%
        
     }catch(Exception e){
     	e.printStackTrace();
     	%>
         <script>alert("결제 실패했습니다.")</script>
         <%
     	str = "실패";
     }finally {
     	System.out.println(str);
         if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){}
         if(conn != null) try{conn.close();}catch(SQLException sqle){}
         
      }
    %>
    <script>history.go(-1);</script>
    