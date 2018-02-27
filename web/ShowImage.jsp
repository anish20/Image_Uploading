<%-- 
    Document   : ShowImage
    Created on : 27 Feb, 2018, 3:43:27 PM
    Author     : ANISH
--%>

<%@page import="db.dbconnect"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <!---Retrieve Image from database--->
        
         <%
         try {
              Connection con= dbconnect.myCon();
              String query="select image from img_tb";
              Statement st=con.createStatement();
              ResultSet rs=st.executeQuery(query);
              while(rs.next()){
                  String pst=rs.getString("image");
                  %>
                  <div>
                      <img src="images/<%= pst %>" width="150" height="150">
                  </div>
        <%
              }
              
              
              
             } catch (Exception e) {
                 System.err.println(e);
             }
        %>
    </body>
</html>
