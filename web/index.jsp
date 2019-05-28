<%-- 
    Document   : index
    Created on : 28/03/2018, 10:19:45 PM
    Author     : Luis Salinas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
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
        <link rel="stylesheet" type="text/css" href="CSS/estilo1.css"/>
        <link rel="stylesheet" type="text/css" href="CSS/fontello.css"/>
        <link type="text/css" rel="stylesheet" href="CSS/materialize.css" media="screen,projection">
    </head>
    <body>

        <!--<%=nombre%>-->
        <header>
            <!--Todos los elementos del nav -->
            <!--<div class="contenedorB">
                <div class="chip">
                    <img src="IMAGENES/nadia.jpg" alt="">
                    <p>Bienvenido <%=nombre%></p>
                </div>
            </div> -->

            <input type="checkbox" id="emenu">
            <label for="emenu"><img src="IMAGENES/android-icon-36x36.jpg" alt=""/></label>
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
        <!--Imagen principal con contenedor-->


                <section class="primer">
            <div class="row" style="margin-top: 10%;position: absolute;width: 60%;">
                <div class="col s12 m5" >
                    <div class="card-panel teal  white" style="border-left: solid #000033;">
                        <span class="black-text">Bienvenido <%=nombre%>
                        </span>
                    </div>
                </div>
            </div>
            <section class="contnom"> 
                <p>AetherCode </p>
            </section>
        </section>


        <section class="cajas">
            <section class="contenedor2" id="about">
                <section id="cont21">
                    <h1 class="titulo">Acerca de nosotros...</h1>
                    <p class="texto "> En conjunto nos comprometemos día a día a brindarte y tratarte como 
                        el cliente que merece nuestra atención y conocimiento, dando nuestro máximo potencial 
                        en virtud de tu beneficio además de la satisfacción que nos genera el hacer las cosas 
                        bien y con un grupo de trabajo unificado, joven y 100% mexicano.</p>
                </section>    


                <div class="adjust">
                    
                    <section class="adjust2">
                        <p class="texto1 contenidoAlado">BangleBond es una pulsera que permite al usuario andar 
                        con seguridad por la Ciudad de México ya que se trata de un sistema de seguridad conectado
                        con la aplicación previamente descargada en el teléfono</p>
                    </section>
                </div>
                <section id="cont23" >
                    <h1 class="titulo contenidoAlado">Objetivo General</h1>
                    <p class="texto1 contenidoAlado">Desarrollar programas computacionales, con la finalidad y 
                        capacidad de resolver situaciones reales a las personas para su desarrollo, y evoluciona 
                        miento tecnológico para atender sus necesidades y hacerlas mejores en su campo laboral, 
                        financiero, administrativo y económico, además de actualizarlos en el campo computacional.</p><br/>
                    <h1 class="titulo contenidoAlado">Mision</h1>
                    <p class="texto1 contenidoAlado">Proporcionar los sistemas de software más innovadoras a medida 
                        de las necesidades de nuestros clientes, con el objetivo de incrementar su competitividad 
                        y productividad. Para ello implementamos soluciones prácticas adaptadas a sus necesidades 
                        y desarrollamos nuevas soluciones creativas. Nuestra base parte del aprovechamiento de los 
                        lenguajes de programación como herramienta de trabajo.</p><br/>
                    <h1 class="titulo contenidoAlado">Vision</h1>
                    <p class="texto1 contenidoAlado">Ser una empresa comprometida con la sociedad, erradicando 
                        problemas que afectan a la sociedad a través de Software que cumpla con los más altos 
                        estándares de calidad aplicando herramientas vanguardistas que permitan una innovación 
                        a futuro</p><br/>
                </section>

            </section>    
        </section> 

        <section id="info">
            <h5>Conoce a los desarrolladores:</h5>
            <div class="contenedor">
                <div class="info-des">
                    <img src="IMAGENES/valdivia.jpg" alt="">
                    <h6>Alejandro</h6>
                </div>
                <div class="info-des">
                    <img src="IMAGENES/fernando.jpg" alt="">
                    <h6>Fernando</h6>
                </div>
                <div class="info-des">
                    <img src="IMAGENES/ethan.jpg" alt="">
                    <h6>Ethan</h6>
                </div>
                <div class="info-des">
                    <img src="IMAGENES/julian.jpg" alt="">
                    <h6>Julian</h6>
                </div>
                
            </div>
        </section>
        <section class="cajas">
            <section class="contenedor4">
                <h1 class="titulo">Conoce nuestros servicios: </h1>
            </section>
        </section>
        
        <a href="EmergenciasActuales.jsp">
            <section class="servicio">
                <img src="IMAGENES/evento.jpg" alt="">
                <div class="contenedor">
                    <h2>Reporte de Evento</h2>
                </div>
            </section>
        </a>
        <a href="MaterialFaltante.jsp">
            <section class='servicio'>
                <img src='IMAGENES/document-3271743_960_720.jpg' alt=''>
                <div class='contenedor'>
                    <h2>Reporte de Mantenimiento (interaccion)</h2>
                </div>
            </section>
        </a>
        <a href="Especialistas.jsp">
            <section class="servicio">
                <img src="IMAGENES/ingenieros.jpg" alt="">
                <div class="contenedor">
                    <h2>Asignar Ingenieros</h2>
                </div>
            </section>
        </a>
                        

        <footer>
            <p>AetherCode <br> BangleBond</p>
            &COPY; 2019
        </footer>
    </body>
</html>