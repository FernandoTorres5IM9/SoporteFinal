<%-- 
    Document   : despliegaS
    Created on : 2/05/2018, 10:12:14 PM
    Author     : walmart
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="BD.BD"%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%

    HttpSession miSess = request.getSession();
    String idPer = miSess.getAttribute("idPersona") == null ? "0" : miSess.getAttribute("idPersona").toString();
    ldn.Usuario perX = new ldn.Usuario(Integer.parseInt(idPer));

    seguridad.Acceso seg = new seguridad.Acceso(Integer.parseInt(idPer));

    if (!seg.VALIDO()) {
        response.sendRedirect("login.jsp");
    }

    String nombre = perX.NOMBRECOMPLETO();


%>
<!DOCTYPE html>
<html>
    <head>
        <title>Mantenimiento</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="CSS/estiloModulos.css">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link type="text/css" rel="stylesheet" href="CSS/materialize.css" media="screen,projection">
        <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
        <script type="text/javascript" src="JAVASCRIPT/materialize.js"></script>
        <script>
            function validarMaterialS() {
                var indice = document.getElementById("areaMatSob").selectedIndex;
                var indice2 = document.getElementById("materialMatSob").selectedIndex;
                var valor = document.getElementById("describeMatSob").value;
                if (indice === null || indice === 0) {
                    alert("Indica en que area en la que se encuentra");
                    return false;
                }
                if (indice2 === null || indice2 === 0) {
                    alert("Indica en el material sobrante");
                    return false;
                }
                if (valor === null || valor.length === 0 || /^\s+$/.test(valor)) {
                    alert("Introduce una especificacion");
                    return false;
                }
            }
        </script>
        <script>
            $(document).ready(function () {
                $('select').formSelect();
            });
        </script>
        <script>
            $(document).ready(function () {
                $('input#input_text, textarea#textarea2').characterCounter();
            });
        </script>
        <script>
            $(document).ready(function () {
                $('.tooltipped').tooltip();
            });
        </script>
        <!--Este solo sera para aparecer div--><script src="JAVASCRIPT/validaciones.js"></script> 
    </head>
    <body>
        <header>


            <input type="checkbox" id="emenu">
            <label for="emenu"><img src="IMAGENES/mantenimiento.jpeg" alt=""/></label>
            <nav class="menu">

                <ul>
                    <li class="actual"><a href="index.jsp"> Inicio</a></li>
                    <li><a href="index.jsp#about">Acerca de nosotros</a></li>
                    <li>
                    <%    
                        if(nombre=="Gerente" || nombre=="Operador"){
                            out.println("<a href='EmergenciasActuales.jsp'>Reporte de Evento</a>");
                        }else{
                            
                        }
                    %>
                    </li>
                    <li>
                    <%
                         if(nombre=="Gerente"){
                             out.print(" <a href='MaterialFaltante.jsp'>Reporte de Mantenimiento (interacción)</a>");
                         }
                         else{
                             
                         }

                     %>        
                    </li>
                    <li>
                    <%    
                        if(nombre=="Gerente"){
                            out.println("<a href='Especialistas.jsp'>Asignar Ingeniero</a>");
                        }else if(nombre=="Ingeniero"){
                            out.println("<a href='Especialistas.jsp'>Reportes Asignados</a>");
                        }
                    %>            
                    </li>
                    <li><a href="salir.jsp">Salir</a></li>

                </ul>
            </nav>
        </header>
        <section class="principal">
            <section class="bannerM">
                <img src="IMAGENES/mantenimiento.jpeg" alt="">
                <div class="contenedor">
                    <h2>Asignación a Mantenimiento</h2>
                </div>
            </section>
            <section id="bienvenidos">

                <div class="contenedor">

                    <h1>Reportes sin asignar</h1>
                </div>
            </section>
            <object height="500" data="consultaMaterialS.jsp">

            </object>
            <div id="aparece" style="align-items: center;">
                <a class="btn-floating btn tooltipped btn-large waves-effect waves-light black" data-position="top" data-tooltip="Enviar a Mantenimiento" onclick="divAparece()"><i class="material-icons">add</i></a>
            </div>
            <div id="caja">
                <h1 style="text-align: center;color: #ffffff;">Envia Reporte a Mantenimiento</h1>
                <form action="generarMS.jsp" onsubmit="return validarMaterialS(this)" method="post" class="form-register" id="form-register">

                    <div class="contenedor-inputs">
                        <div class="row">

                            <br/>
                            <div class="input-field col s12">
                                <input id="first_name" type="text" class="validate" name="nombre"  onlyread value="<%=nombre%>"/>
                                <label for="first_name">Nombre</label>
                            </div>

                            <div class="input-field col s12">
                                <select name="areaMatSob" id="areaMatSob" autofocus>
                                    <option value="" disabled selected>Selecciona el area en donde se encuentra</option>
                                                                        <%
                                                String Area;
                                                BD BD = new BD();
                                                BD.Connection();
                                                ResultSet Arr;
                                                Arr = BD.query("SELECT nombre FROM areas");
                                                while (Arr.next()) {
                                                Area=Arr.getString("nombre");
                                                out.println("<option value='"+Area+"'>"+Area+"</option>");
                                                }
                                    %>
                                </select>
                                <label>Area:</label>
                            </div>
                            <div class="input-field col s12">
                                <select name="materialMatSob" id="materialMatSob" autofocus>
                                    <option value="" disabled selected>Selecciona el Material Sobrante</option>
                                    <%
                                                String Material;
                                                
                                                BD.Connection();
                                                
                                                Arr = BD.query("SELECT nombre FROM materiales");
                                                while (Arr.next()) {
                                                Material=Arr.getString("nombre");
                                                out.println("<option value='"+Material+"'>"+Material+"</option>");
                                                }
                                    %>
                                </select>
                                <label>Material:</label>
                            </div>

                            <!--<div class="input-field col s12">
                                <textarea name="describeMatSob" id="describeMatSob" class="materialize-textarea" data-length="150" maxlength="150" ></textarea>
                                <label for="textarea2">Especificaciones:</label>
                            </div>-->
                            <div class="input-field col s12">    
                            <label>Descripcion</label>
                                <input type="text" name="describeMatSob" id="describeMatSob" maxlenght="150"
         minlength="5" maxlength="40" required pattern="[A-Za-z0-9]+"/>
                            </div>
                        </div>
                        <br/>
                        <button class="btn waves-effect waves-light black" type="submit" name="action">Registrar
                            <i class="material-icons right">send</i>
                        </button>
                        <button class="btn waves-effect waves-light black" type="reset" name="action">Borrar
                            <i class="material-icons right">delete</i>
                        </button>
                        
                        <br/>
                    </div>
                </form>
            </div>
                               
        </section>
        <footer class="footer">
            <p>AetherCode <br> BangleBond</p>
            &COPY; 2019
        </footer>
    </body>
</html>