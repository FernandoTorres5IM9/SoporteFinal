<%-- 
    Document   : despliegaF
    Created on : 2/05/2018, 10:12:03 PM
    Author     : walmart
--%>

<%@page import="BD.BD"%>
<%@page import="java.sql.ResultSet"%>
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
        <title>W.U. "Contigo"</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="CSS/estiloModulos.css">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link type="text/css" rel="stylesheet" href="CSS/materialize.css" media="screen,projection">
        <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
        <script type="text/javascript" src="JAVASCRIPT/materialize.js"></script>
        <script>
            function validarMaterialF(){
            var indice = document.getElementById("areaMatFalt").selectedIndex;
            var indice2 = document.getElementById("materialMatFalt").selectedIndex;
            var valor = document.getElementById("describeMatFalt").value;
            if (indice === null || indice === 0){
            alert("Indica en que area en la que se necesita");
            return false;
            }
            if (indice2 === null || indice2 === 0){
            alert("Indica en el material faltante");
            return false;
            }
            if (valor === null || valor.length === 0 || /^\s+$/.test(valor)){
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
        <!--ESTE SCRIPT ES SOLO PARA APARECER EL DIV DE APARECE--><script src="JAVASCRIPT/validaciones.js"></script> 
    </head>
    <body>
        <header>


            <input type="checkbox" id="emenu">
            <label for="emenu"><img src="IMAGENES/android-icon-36x36.png" alt=""/></label>
            <nav class="menu">

                <ul>
                    <li class="actual"><a href="index.jsp"> Inicio</a></li>
                    <li><a href="index.jsp#about">Acerca de nosotros</a></li>
                    <li><a href="EmergenciasActuales.jsp">Emergencias</a>

                    </li>  
                    <li><a href="DesplegarHos.jsp">Hospitales</a>

                    </li>
                    <li><a href="MaterialFaltante.jsp">Material Requerido</a>

                    </li>
                    <li><a href="Especialistas.jsp">Especialistas</a>

                    </li>
                    <li><a href="Ocupabilidad/ocupabilidad.jsp">Ocupabilidad de horario</a></li>
                    <li><a href="http://localhost:4200">Chat</a></li>
                    <li><a href="salir.jsp">Salir</a></li>

                </ul>
            </nav>
        </header>
        <section class="principal">
            <section class="bannerM">
                <img src="IMAGENES/material-sanitario-sevilla--644x362.jpg" alt="">
                <div class="contenedor">
                    <h2>Material Faltante</h2>
                </div>
            </section>
            <section id="bienvenidos">

                <div class="contenedor">

                    <h1>Material Faltante Actual</h1>
                </div>
            </section>
            <object height="500" data="consultaMaterialF.jsp">

            </object>
            <div id="aparece" style="align-items: center;">
                <a class="btn-floating btn tooltipped btn-large waves-effect waves-light black" data-position="top" data-tooltip="Agregar Material Faltante" onclick="divAparece()"><i class="material-icons">add</i></a>
            </div>
            <div id="caja">
                <h1 style="text-align: center;color: #ffffff;">Registra el Material Faltante</h1>
                <form action="generarMF.jsp" onsubmit="return validarMaterialF(this)" method="post" class="form-register" id="form-register">

                    <div class="contenedor-inputs">
                        <div class="row">

                            <br/>
                            <div class="input-field col s12">
                                <input id="first_name" type="text" class="validate" name="nombre"  onlyread value="<%=nombre%>"/>
                                <label for="first_name">Nombre</label>
                            </div>

                            <div class="input-field col s12">
                                <select name="areaMatFalt" id="areaMatFalt" autofocus>
                                    <option value="" disabled selected>Selecciona el area en donde se necesita</option>
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
                                <select name="materialMatFalt" id="materialMatFalt" autofocus>
                                    <option value="" disabled selected>Selecciona el Material faltante</option>
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
                                <textarea name="describeMatFalt" id="describeMatFalt" class="materialize-textarea" data-length="150" maxlength="150" ></textarea>
                                <label for="textarea2">Especificaciones:</label>
                            </div>-->
                            <div class="input-field col s12">    
                            <label>Descripcion</label>
                                <input type="text" name="describeMatFalt" id="describeMatFalt" maxlenght="150"
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
    </section>

</section>
<footer class="footer">
    <p>WU- With U <br> WU What U need</p>
    &COPY; 2018
</footer>
</body>
</html>
