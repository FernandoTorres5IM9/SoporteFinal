<%-- 
    Document   : consultarEmergencia
    Created on : 10/05/2018, 06:58:12 PM
    Author     : juano
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="BD.BD"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="CSS/estiloModulos.css">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link type="text/css" rel="stylesheet" href="CSS/materialize.css" media="screen,projection">
    </head>
    <body>
        <%
            String registro;
            String name;
            String areaEm;
            String alertaEm;
            String describeEm;
            BD BD = new BD();
            BD.Connection();
            ResultSet Arr;
          
            HttpSession miSess = request.getSession();
            String idPer = miSess.getAttribute("idPersona") == null ? "0" : miSess.getAttribute("idPersona").toString();
            ldn.Usuario perX = new ldn.Usuario(Integer.parseInt(idPer));

            seguridad.Acceso seg = new seguridad.Acceso(Integer.parseInt(idPer));

            if (!seg.VALIDO()) {
                response.sendRedirect("login.jsp");
            }

            String nombre = perX.NOMBRECOMPLETO();

            
            Arr = BD.query("SELECT * FROM codigos");
            while (Arr.next()) {
                registro=Arr.getString("fecharegistro");
                name = Arr.getString("nombre");
                areaEm = Arr.getString("area");
                alertaEm = Arr.getString("alerta");
                describeEm = Arr.getString("descripcion");
                out.println("<table width='100%' class='responsive-table'>");
                out.println("<tr>");
                out.println("<th width='8%'></th><th width='16%'>Fecha de Registro</th><th width='15%'>Nombre</th><th width='10%'>Area</th>"
                        + "<th width='8%'>Alerta</th><th>Descripcion</th>");
                out.println("</tr>");
                out.println("<tr>");
                out.println("<td><form method='post' action='eliminarEmergencia.jsp'>"
                        + "<input type='hidden' name='dat' value='" + registro + "'/>"
                        + "<input type='hidden' name='dato' value='" + name + "'/>"
                        + "<input type='hidden' name='dato2' value='" + areaEm + "'/>"
                        + "<input type='hidden' name='dato3' value='" + alertaEm + "'/>"
                        + "<input type='hidden' name='dato4' value='" + describeEm + "'/>"
                        );
                if(nombre!="Ingeniero de Software"){
                             out.print("<button class='btn waves-effect waves-light black' type='submit'  name='action'><i class='small material-icons'>delete_forever</i></button></form></td>");
                }
                out.println("<td>" + registro + "</td>");
                out.println("<td>" + name + "</td>");
                out.println("<td>" + areaEm + "</td>");
                out.println("<td>" + alertaEm + "</td>");
                out.println("<td>" + describeEm + "</td>");
                out.println("</tr>");
                out.println("</table>");
            }
            BD.CloseConnection();
        %> 
    </body>
</html>
