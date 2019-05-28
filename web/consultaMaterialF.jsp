<%-- 
    Document   : consultaMaterialF
    Created on : 10/05/2018, 11:59:10 PM
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

            String areamatfalt;
            String matfalt;
            String description;

            BD BD = new BD();
            BD.Connection();
            ResultSet Arr;
            Arr = BD.query("SELECT * FROM materialfaltante");
            while (Arr.next()) {
                registro=Arr.getString("fecharegistro");
                name = Arr.getString("nombre");

                areamatfalt = Arr.getString("areamatfalt");
                matfalt = Arr.getString("matfat");
                description = Arr.getString("description");

                out.println("<table width='100%' class='responsive-table'>");

                out.println("<tr>");
                out.println("<th width='8%'></th><th width='16%'>Fecha de Registro</th><th width='15%'>Nombre</th><th width='10%'>Area</th><th width='13%'>Material</th><th>Especificaciones</th>");

                out.println("</tr>");

                out.println("<tr>");
                out.println("<td><form method='post' action='eliminarMatFalt.jsp'>"
                        + "<input type='hidden' name='dat' value='" + registro + "'/>"
                        + "<input type='hidden' name='dato' value='" + name + "'/>"
                        + "<input type='hidden' name='dato2' value='" + areamatfalt + "'/>"
                        + "<input type='hidden' name='dato3' value='" + matfalt + "'/>"
                        + "<input type='hidden' name='dato4' value='" + description + "'/>"
                        + "<button class='btn waves-effect waves-light black' type='submit'  name='action'>"
                        + "<i class='small material-icons'>delete_forever</i></button></form></td>");
                out.println("<td>" + registro + "</td>");
                out.println("<td>" + name + "</td>");

                out.println("<td>" + areamatfalt + "</td>");
                out.println("<td>" + matfalt + "</td>");
                out.println("<td>" + description + "</td>");
                out.println("</tr>");

                //out.println("</tbody>");
                out.println("</table>");
            }
            BD.CloseConnection();
                       %> 
    </body>
</html>
