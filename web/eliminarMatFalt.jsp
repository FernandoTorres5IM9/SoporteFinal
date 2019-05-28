<%-- 
    Document   : eliminarMatFalt
    Created on : 13/05/2018, 08:36:58 PM
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
                String material=request.getParameter("dato3");
                String descrip=request.getParameter("dato4");
            System.out.println("si elimina");
            BD.delete("DELETE FROM materialfaltante WHERE fecharegistro='"+registro+"' and nombre='" + name + "' and areamatfalt='"+area+"' and matfat='"+material+"' "
                    + "and description='"+descrip+"';");
            out.println("<script>alert('Material Faltante Eliminado')</script>;");
            out.println("<script>window.location='consultaMaterialF.jsp'</script>");
            BD.CloseConnection();
            }catch(Exception e){
              System.out.println("no elimino");
              System.out.println(e.getMessage());
            }
            
        %>
    </body>
</html>
