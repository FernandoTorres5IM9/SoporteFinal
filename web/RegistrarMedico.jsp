<%-- 
    Document   : RegistrarMedico
    Created on : 18/05/2018, 03:25:02 AM
    Author     : carlosyarmando
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
        <title>W.U. "Contigo"</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="CSS/estiloModulos.css">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link type="text/css" rel="stylesheet" href="CSS/materialize.css" media="screen,projection">
        <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
        <script type="text/javascript" src="JAVASCRIPT/materialize.js"></script>
        <script >
            function validarEspe() {
                var indice = document.getElementById("areaEs").selectedIndex;
                var indice2 = document.getElementById("personalEs").selectedIndex;
                var valor = document.getElementById("describeEs").value;
                if (indice === null || indice === 0) {
                    alert("Indica en que area en la que se necesita");
                    return false;
                }
                if (indice2 === null || indice2 === 0) {
                    alert("Indica en el personal que necesitas");
                    return false;
                }
                if (valor === null || valor.length === 0 || /^\s+$/.test(valor)) {
                    alert("Introduce una descripcion de la peticion");
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
        <script>
            $(document).ready(function () {
                $('.datepicker').datepicker();
            });
        </script>
        <!--ESTE SCRIPT SOLAMENTE SERVIRA PARA APARECER EL DIV DE GENERAR--><script src="JAVASCRIPT/validaciones.js"></script>
    </head>
    <body>
        <!--Todos los elementos del nav -->
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
            <section class="primerE">
                <div class="posicion">
                    <h1 class="letratitulo"><span class="title"><b>MEDICOS</b></span></h1>
                </div>
            </section>
            <!--<section class="bannerM">
              <img src="IMAGENES/aid-1822458_960_720.jpg" alt="">
                  <div class="contenedor">
                      <h2>Especialistas</h2>
                  </div>
              </section>-->
            <section id="bienvenidos">
                <h2 class="titulo">Bienvenidos al Modulo de Registrar Doctores</h2>
                <div class="contenedor">
                    <p class="texto">
                        Como director puedes registrar al nuevos miembros del plantel
                    </p>
                </div>
            </section>
            <section id="bienvenidos">

                <div class="contenedor">
            <div id="aparece" style="align-items: center;">
                <a class="btn-floating btn tooltipped btn-large waves-effect waves-light black" data-position="top" data-tooltip="Agregar Solicitud de Especialista" onclick="divAparece()"><i class="material-icons">add</i></a>
            </div>
            <div id="caja">
                <h1 style="text-align: center;color: #ffffff;">Registra a un Nuevo Medico</h1>
                <form action="registrarMedico.jsp" onsubmit="return validarEspe(this)" method="post" class="form-register" id="form-register" enctype="multipart/form-data">

                    <div class="contenedor-inputs">
                        <div class="row">


                            <div class="input-field col s12">
                                <input value="<%=nombre%>" id="first_name" type="text" class="validate" name="nombre">
                                <label for="first_name">Nombre</label>
                            </div>
                            <div class="input-field col s12">
                                <input value="" id="pat" type="text" class="validate" name="pat">
                                <label for="pat">Paterno</label>
                            </div>
                            <div class="input-field col s12">
                                <input value="" id="mat" type="text" class="validate" name="mat">
                                <label for="mat">Materno</label>
                            </div>
                            <div class="input-field col s12">
                                <input value="" id="matri" type="text" class="validate" name="matricula">
                                <label for="matri">Matricula</label>
                            </div>    
                            <div class="input-field col s12">
                                <select name="areaEs" id="areaEs" autofocus>
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
                                <select name="Tipo" id="areaEs" autofocus>
                                <option value="" disabled selected>Selecciona el area en donde se necesita</option>
                                <option value="1">Personal</option>
                                <option value="2">Jefe de Area</option>
                                <option value="3">Director</option> 
                                </select>
                                <label>Tipo de Empleado: </label>
                        </div>
                                <input type="file" name="imagen"><br>Imagen del Empleado  <br>      
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
            <p>WU- With U <br> WU What U need</p>
            &COPY; 2018
        </footer>
        
    </body>
</html>