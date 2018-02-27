<%-- 
    Document   : process
    Created on : 27 Feb, 2018, 11:01:11 AM
    Author     : ANISH
--%>

<%@page import="db.dbconnect"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.FileItemFactory"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@ page import="java.io.File"%>
<%@page import="java.util.*" %>
<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%!
        String str;
        File file;
        int maxSize=5000*6;
        int maxFactSize=5000*6;
        String path="C:/Users/ANISH/Documents/NetBeansProjects/ImageInsert/web/images";
        %>
        
        <%
        try{
        %>
        <%

        String type=request.getContentType();
        //out.print(type);
        if(type.indexOf("multipart/form-data")>=0){
           // out.print("Its multipart data");
            DiskFileItemFactory factory=new DiskFileItemFactory();
            factory.setSizeThreshold(maxFactSize);
            factory.setRepository(new File("c:\\temp"));
            ServletFileUpload upload=new ServletFileUpload(factory);
            upload.setFileSizeMax(maxSize);
            List list=upload.parseRequest(request);
            Iterator itr=list.iterator();
            while (itr.hasNext()) {
                
                FileItem item=(FileItem)itr.next();
                %>
                <br>
                <%
                    //out.println(item.isFormField());
                if(!item.isFormField()){
                    str=item.getName();
                    out.println(str);
                    file=new File(path,str);
                    item.write(file);
                    out.print("Uploaded sucesfully....");
                }
                    
                }
            
        }
        %>
        <!---Insert file in database --->
        <%
         try {
              Connection con= dbconnect.myCon();
              String query="insert into img_tb (image) values('"+str+"')";
              Statement st=con.createStatement();
              int i=st.executeUpdate(query);
              if(i>0){
               %>
               <%= "File Stored in database"%>  <span> <a href="ShowImage.jsp">Show the Images</span>
        <%
              }else{
                  out.println("File not Stored in database..");
              }
              
              
             } catch (Exception e) {
                 System.err.println(e);
             }
        %>
        
    <%
    }catch(Exception e){
     
               %>
               <b>Sorry File is out of Size</b> <span> <a style="text-decoration: none"href="index.html"><b>&DoubleLeftArrow;Try Again</b></a></span>
    <%  
        
}
    
    %>    
    </body>
</html>
