<%-- 
    Document   : generarEmergencia2
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
        
        String name= request.getParameter("name");
        String area= request.getParameter("areaEm");
        String alerta=request.getParameter("alertaEm");
        String description= request.getParameter("describeEm");
    try{
        BD BD= new BD();
        BD.Connection();
        BD.insert("INSERT INTO codigos VALUES(now(),'"+name+"', '"+area+"','"+alerta+"','"+description+"');");
        System.out.println("Si se registro");
        out.println("<script>alert('Reporte Realizado');</script>");
        out.println("<script>window.location='EmergenciasActuales.jsp'</script>");
        BD.CloseConnection();
    }catch(Exception e){
        System.out.println("No registro emergencia");
    }

        %>
    </body>
</html>
