<%-- 
    Document   : MaterialFaltante
    Created on : 06-abr-2018, 22:59:15
    Author     : Juan
--%>

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
        <title>Reporte de Mantenimiento</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
        <script type="text/javascript" src="JAVASCRIPT/materialize.js"></script>
        <link rel="stylesheet" type="text/css" href="CSS/estiloModulos.css">
        <link type="text/css" rel="stylesheet" href="CSS/materialize.css" media="screen,projection">
        <link type="text/css" rel="stylesheet" href="CSS/materialize.css" media="screen,projection">
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
            <!--<section class="bannerM">
                <img src="IMAGENES/document-3271743_960_720.jpg" alt="">
                <div class="contenedor">
                    <h2>Material Requerido</h2>
                </div>
            </section>-->
            <section class="principal">
            <section class="primerM">
            <div class="posicion">
                <h1 class="letratitulo"><span class="title"><b>MATENIMIENTO</b></span></h1>
            </div>
            </section>
            <section id="bienvenidos">
                <h2 class="titulo">Bienvenidos al Modulo de Mantenimiento</h2>
                <div class="contenedor">
                    <p class="texto">
                        La principal función del módulo Mantenimiento, es permitirte reportar cualquier<br>
                        tipo de anomalía en cuestion a la funcionalidad del sistema <br>
                       
                    </p>
                </div>
            </section>
            
            <div class="adjust">
                <section class="adjust1">
                    
                     <div class="row">
                <div class="col s12 m6">
                    <div class="card">
                        <div class="card-image">
                            <img src="IMAGENES/mantenimiento.jpeg">
                            <span class="card-title">Mandar a Mantenimiento</span>
                            <a class="btn-floating halfway-fab waves-effect waves-light black" href="despliegaS.jsp"><i class="material-icons">add</i></a>
                            
                        </div>
                        <div class="card-content">
                            <p>Mandar Reporte de Evento a Mantenimiento</p>
                        </div>
                    </div>
                </div>
            </div>
                </section>
                
            </div>

        </section>
        <footer class="footer">
            <p>AetherCode <br> BangleBond</p>
            &COPY; 2019
        </footer>
    </body>
</html>
