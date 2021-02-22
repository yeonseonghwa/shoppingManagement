<%@page import="java.io.PrintWriter"%>
<%@page import="org.json.simple.JSONArray"%>
<%@ page import="org.json.simple.JSONObject" %>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
    
    <%
    request.setCharacterEncoding("utf-8");
    Timestamp timestamp = new Timestamp(System.currentTimeMillis());
    String name = request.getParameter("name");
    String evaluation = request.getParameter("evaluation");


    
    Connection conn = null;
    PreparedStatement pstmt = null;
    String str = "";
    ResultSet result = null;
    try{
   	    String jdbcUrl = "jdbc:mysql://localhost:3306/shop?serverTimezone=UTC&useSSL=false";
   	    String dbId = "root";
   	    String dbPass = "1234";
   	    Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(jdbcUrl,dbId,dbPass);
        
        String sql = "select * from goods where name=?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1,name);
        result = pstmt.executeQuery();

        
        if(result.next()){
        	sql = "insert into evaluation values(?,?,?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setTimestamp(1, timestamp);
            pstmt.setString(2,name);
            pstmt.setString(3,evaluation);
            pstmt.executeUpdate();
            str = "댓글이 추가되었습니다.";
            %>
            <script>
            alert("댓글이 추가되었습니다.");
            </script>
            
            <%
        }else{
        	str = "실패";
         	%>
            <script>alert("댓글 추가 실패")</script>
            <%
        }
        
        

        
     }catch(Exception e){
     	e.printStackTrace();

     }finally {
     	System.out.println(str);
         if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){}
         if(conn != null) try{conn.close();}catch(SQLException sqle){}
         
      }
    %>
    <script>history.go(-1);</script>
    