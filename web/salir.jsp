<%-- 
    Document   : salir
    Created on : 27/03/2018, 08:59:02 AM
    Author     : Alumno SS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<%

HttpSession miSessssss = request.getSession();

miSessssss.invalidate();

response.sendRedirect("login.jsp");


%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
