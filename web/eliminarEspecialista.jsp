<%-- 
    Document   : eliminarEspecialista
    Created on : 13/05/2018, 09:43:39 PM
    Author     : juano
--%>

<%@page import="BD.BD"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <%
            BD BD = new BD();
            BD.Connection();
            try{
                String registro=request.getParameter("dat");
                String name = request.getParameter("dato");
                String area=request.getParameter("dato2");
                String personal=request.getParameter("dato3");
                String fecha=request.getParameter("dato4");
                String descrip=request.getParameter("dato5");
            System.out.println("si elimina");
            BD.delete("DELETE FROM especialistas WHERE fecharegistro='"+registro+"' and nombre='" + name + "' and areaesp='"+area+"' and personal='"+personal+"' "
                    + "and fecha='"+fecha+"'and descripcion='"+descrip+"';");
            out.println("<script>alert('Solicitud CERRADA')</script>;");
            out.println("<script>window.location='consultarEspecialistas.jsp'</script>");
            BD.CloseConnection();
            }catch(Exception e){
              System.out.println("no elimino");
              System.out.println(e.getMessage());
            }
            
        %>
    </body>
</html>
