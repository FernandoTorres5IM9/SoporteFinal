<%-- 
    Document   : eliminarMatSob
    Created on : 13/05/2018, 08:10:49 PM
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
            BD.delete("DELETE FROM materialsobrante WHERE fecharegistro='"+registro+"' and nombre='" + name + "' and areamatsob='"+area+"' and matsob='"+material+"' "
                    + "and description='"+descrip+"';");
            out.println("<script>alert('Material Sobrante Eliminado')</script>;");
            out.println("<script>window.location='consultaMaterialS.jsp'</script>");
            BD.CloseConnection();
            }catch(Exception e){
              System.out.println("no elimino");
              System.out.println(e.getMessage());
            }
            
        %>
    </body>
</html>
