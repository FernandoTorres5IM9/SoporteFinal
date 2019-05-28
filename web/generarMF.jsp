<%-- 
    Document   : generarMF
    Created on : 2/05/2018, 09:49:26 PM
    Author     : walmart
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
    
    String areamatfalt = request.getParameter("areaMatFalt");
    String matfalt = request.getParameter("materialMatFalt");
    String description = request.getParameter("describeMatFalt");
    
    
    
    try{
        BD BD= new BD();
        BD.Connection();
        BD.insert("INSERT INTO materialfaltante VALUES(now(),'"+name+"', '"+areamatfalt+"','"+matfalt+"', '"+description+"' );");
        System.out.println("Si se registro");
        out.println("<script>alert('Material faltante agregado');</script>");
        out.println("<script>window.location='despliegaF.jsp'</script>");
        BD.CloseConnection();
    }catch(Exception e){
        System.out.println("error");
    }

        %>
    </body>
</html>
