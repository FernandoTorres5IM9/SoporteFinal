<%-- 
    Document   : login
    Created on : 28/03/2018, 09:59:54 PM
    Author     : Luis Salinas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<%
    String usuario = request.getParameter("usuario") == null ? "" : request.getParameter("usuario");
    String secreto = request.getParameter("contra")== null ? "" : request.getParameter("contra");
    
    String respuesta = "llenalo";
    
    if(!usuario.equals("") && !secreto.equals("")){
        
        ldn.Usuario perX = new ldn.Usuario();
        
        perX.validaPersona(usuario, secreto);
        
        if(perX.VALIDO()){
            
            HttpSession sessX = request.getSession();
            sessX.setAttribute("idPersona", perX.IDPER());

            
            response.sendRedirect("index.jsp");
        }
        else{
            respuesta = perX.MSJ();
        }
        
    }
    
    
    
    
    boolean formulario = true;
    



%>
<!DOCTYPE html>
<html>
    <head>
        <title>LOGIN</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="CSS/csslogin.css">
        <link type="text/css" rel="stylesheet" href="CSS/materialize.css" media="screen,projection">
    </head>
    <body>
        <br><br><br><br>
        <div>
            <%
            if(formulario){
            %>
            
            <form name="LOGIN" method="post" action="login.jsp">
                <h1> LOGIN</h1>
                <input type="text" name="usuario" id="usuario" placeholder="Usuario" autofocus><br>
                <input type="password" name="contra"  id="contra" placeholder="Contraseña"><br>
                
            <input type="submit" value="Ingresar" id="boton">          
            
        </form>
            <%
            }
            %>
            <center><br><br>
            <%=respuesta%>
            </center>
        </div>
    </body>
</html>
