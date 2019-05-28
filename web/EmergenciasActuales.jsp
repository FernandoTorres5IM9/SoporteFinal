<%-- 
    Document   : EmergenciasActuales
    Created on : 2/05/2018, 07:39:52 PM
    Author     : Julian
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
        <title>Reporte de Evento</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="CSS/estiloModulos.css">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link type="text/css" rel="stylesheet" href="CSS/materialize.css" media="screen,projection">
        <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
        <script type="text/javascript" src="JAVASCRIPT/materialize.js"></script>
        <script src="JAVASCRIPT/validaciones.js"></script> 
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
    </head>
    <body>
        <!--Todos los elementos del nav -->
        <header>
            <input type="checkbox" id="emenu">
            <label for="emenu"><img src="IMAGENES/evento.png" alt=""/></label>
                       <nav class="menu">

                <ul>
                    <li class="actual"><a href="index.jsp"> Inicio</a></li>
                    <li><a href="index.jsp#about">Acerca de nosotros</a></li>
                    <li>
                        <a href='EmergenciasActuales.jsp'>Reporte de Evento</a>
                    </li>
                    <li>
                    <%
                         if(nombre.equals("Gerente")){
                             out.print(" <a href='MaterialFaltante.jsp'>Reporte de Mantenimiento (interacción)</a>");
                         }
                         else{
                             
                         }

                     %>        
                    </li>
                    <li>
                        <a href='Especialistas.jsp'>Asignar Ingeniero</a>        
                    </li>
                    <li><a href="salir.jsp">Salir</a></li>

                </ul>
            </nav>
        </header>
        <section class="principal">
            <section class="primer">
            <div class="posicion">
                <h1 class="letratitulo"><span class="title"><b>REPORTE DE EVENTO</b></span></h1>
            </div>
            </section>

            <!--<section class="bannerM">
                <img src="IMAGENES/emergencias.jpg" alt="">
                <div class="contenedor">
                    <h2>Emergencias</h2>
                </div>
            </section>-->
            <section id="bienvenidos">
                <h2 class="titulo">Bienvenidos al Modulo de Reporte de Evento</h2>
                <div class="contenedor">
                    <p class="texto">
                        Aqui podras dar de alta los eventos que estan sucediendo en tiempo real en cualquier módulo del sistema
                        </br>ademas de poder generar reportes sobre alguna incidencia que ocurra dentro de los módulos
                    </p>
                </div>
            </section>
            <section id="bienvenidos">

                <div class="contenedor">

                    <h1>Eventos Actuales</h1>
                </div>
            </section>
            <object height="500" data="consultarEmergencia.jsp">

            </object>
            
             <%
                         if(nombre!="Ingeniero de Software"){
                             out.print("<div id='aparece' style='align-items: center;'><a class='btn-floating btn tooltipped btn-large waves-effect waves-light black' data-position='top' data-tooltip='Agregar Reporte' onclick='divAparece()'><i class='material-icons'>add</i></a></div>");
                         }
                         else{
                             
                         }

                     %>        
            
            <div id="caja">
                <h1 style="text-align: center;color: #ffffff;">Registra el reporte</h1>
                <form action="generarEmergencia2.jsp" onsubmit="return validarEmergencia(this)" method="post" class="form-register" id="form-register">

                    <div class="contenedor-inputs">
                        <div class="row">

                            <br/>
                            <div class="input-field col s12">
                                <input id="first_name" type="text" class="validate" name="name"  onlyread value="<%=nombre%>"/>
                                <label for="first_name">Nombre</label>
                            </div>

                            <div class="input-field col s12">
                                <select name="areaEm" id="areaEm" autofocus>
                                    <option value="" disabled selected>Selecciona el area en donde ocurre</option>
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
                                <label>Tipo de alerta:</label><br/><br/>
                                <p>
                                    <label>
                                        <input class="with-gap" name="alertaEm" id="alertaEm" value="Roja" type="radio" />
                                        <span>Roja</span>
                                    </label>
                                </p>
                                <p>
                                    <label>
                                        <input class="with-gap" name="alertaEm"  id="alertaEm" value="Azul"type="radio" />
                                        <span>Azul</span>
                                    </label>
                                </p>
                                <p>
                                    <label>
                                        <input class="with-gap" name="alertaEm"  id="alertaEm" value="Verde" type="radio" />
                                        <span>Verde</span>
                                    </label>
                                </p>
                                <p>
                                    <label>
                                        <input class="with-gap" name="alertaEm" id="alertaEm" value="Amarillo" type="radio" />
                                        <span>Amarillo</span>
                                    </label>
                                </p>
                            </div> 
                            <!--<div class="input-field col s12">
                                <textarea pattern="[A-Za-z]{3}"name="describeEm" id="textarea2" class="materialize-textarea" data-length="150" maxlength="150" ></textarea>
                                <label for="textarea2">Descripcion del problema</label>
                            </div>-->
                            <div class="input-field col s12">    
                            <label>Descripcion</label>
                                <input type="text" name="describeEm" id="describeEm" maxlenght="150"
         minlength="5" maxlength="40"/>
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