<%-- 
    Document   : consultarEspecialistas
    Created on : 10/05/2018, 10:51:38 PM
    Author     : juano
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="BD.BD"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link type="text/css" rel="stylesheet" href="CSS/materialize.css" media="screen,projection">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String registro;
            String name;
            String areaEs;
            String personalEs;
            String fechaEs;
            String describeEs;
            BD BD = new BD();
            BD.Connection();
            ResultSet Arr;
            Arr = BD.query("SELECT * FROM especialistas");
            while (Arr.next()) {
                registro=Arr.getString("fecharegistro");
                name = Arr.getString("nombre");
                areaEs = Arr.getString("areaesp");
                personalEs = Arr.getString("personal");
                fechaEs = Arr.getString("fecha");
                describeEs = Arr.getString("descripcion");
                out.println("<table width='100%' class='responsive-table'>");
                out.println("<tr>");
                out.println("<th width='8%'></th><th width='16%'>Fecha de Registro</th><th width='8%'>Nombre</th><th width='10%'>Area</th>"
                        + "<th width='10%'>Personal Asignado:</th><th width='15%'>Fecha</th><th width='49%'>Solucion</th>");
                out.println("</tr>");
                out.println("<tr>");
                out.println("<td><form method='post' action='eliminarEspecialista.jsp'>"
                        + "<input type='hidden' name='dat' value='" + registro + "'/>"
                        + "<input type='hidden' name='dato' value='" + name + "'/>"
                        + "<input type='hidden' name='dato2' value='" + areaEs + "'/>"
                        + "<input type='hidden' name='dato3' value='" + personalEs + "'/>"
                        + "<input type='hidden' name='dato4' value='" + fechaEs + "'/>"
                        + "<input type='hidden' name='dato5' value='" + describeEs + "'/>"
                        + "<button class='btn waves-effect waves-light black' type='submit'  name='action'>"
                        + "<i class='small material-icons'>check_box</i></button></form></td>");
                out.println("<td>" + registro + "</td>");
                out.println("<td>" + name + "</td>");
                out.println("<td>" + areaEs + "</td>");
                out.println("<td>" + personalEs + "</td>");
                out.println("<td>" + fechaEs + "</td>");
                out.println("<td>" + describeEs + "</td>");
                out.println("</tr>");

                
                out.println("</table>");
            }
            BD.CloseConnection();
        %> 
    </body>
</html>
