<%-- 
    Document   : esp2
    Created on : 2/05/2018, 07:08:26 PM
    Author     : Juan
--%>

<%@page import="BD.BD"%>
<%@page import="java.sql.*, java.io.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        
     String name= request.getParameter("nombre");
    String area= request.getParameter("areaEs");
    String personal=request.getParameter("personalEs");
    String fecha=request.getParameter("fyhEs");
    String description= request.getParameter("describeEs");
   
        BD BD= new BD();
        BD.Connection();
         
        BD.insert("INSERT INTO especialistas VALUES(now(),'"+name+"', '"+area+"','"+personal+"','"+fecha+"','"+description+"');");
        try{
        System.out.println("Si se registro");
        out.println("<script>alert('Solicitud dada de alta');</script>");
        out.println("<script>window.location='Especialistas.jsp'</script>");
        BD.CloseConnection();
    }catch(Exception e){
        System.out.println("error");
    }

        %>
    </body>
</html>