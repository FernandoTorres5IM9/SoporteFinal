<%-- 
    Document   : generarMS
    Created on : 2/05/2018, 09:49:41 PM
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
    String areamatsob = request.getParameter("areaMatSob");
    String matmatsob = request.getParameter("materialMatSob");
    
    String description = request.getParameter("describeMatSob");
    
    
    
    try{
        BD BD= new BD();
        BD.Connection();
        BD.insert("INSERT INTO materialsobrante VALUES(now(),'"+name+"','"+areamatsob+"','"+matmatsob+"', '"+description+"' );");
        System.out.println("Si se registro");
        out.println("<script>alert('Se registro el material sobrante');</script>");
        out.println("<script>window.location='despliegaS.jsp'</script>");
        BD.CloseConnection();
    }catch(Exception e){
        System.out.println("error");
    }

        %>
    </body>
</html>
