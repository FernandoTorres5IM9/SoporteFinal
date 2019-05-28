<%-- 
    Document   : DesplegarHos
    Created on : 2/05/2018, 11:06:48 PM
    Author     : Julian
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%


    HttpSession miSess = request.getSession();    
    String idPer = miSess.getAttribute("idPersona") == null ? "0" : miSess.getAttribute("idPersona").toString();
    ldn.Usuario perX = new ldn.Usuario(Integer.parseInt(idPer));

    seguridad.Acceso seg = new seguridad.Acceso(Integer.parseInt(idPer));
    


    if(!seg.VALIDO()){
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
        <link type="text/css" rel="stylesheet" href="CSS/materialize.css" media="screen,projection">
        <style>
       #map {
        
        height: 999px;
        width: 100%;
       }
       #macrom{
          height: 50px;
          width: 100%;
       }
    </style>
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
            <section id="contenedor1">
                <div id="macrom"></div>
                <div id="map"></div>
         
    <script>
      function initMap() {
        var uluru = {lat: 19.4535061, lng: -99.17529769999999};
        var map = new google.maps.Map(document.getElementById('map'), {
          zoom: 18,
          center: uluru
        });
        var marker = new google.maps.Marker({
          position: uluru,
          map: map
        });
      }
      function Lindavista() {
        var uluru = {lat: 19.486807, lng: -99.129488};
        var map = new google.maps.Map(document.getElementById('map'), {
          zoom: 18,
          center: uluru
        });
        var marker = new google.maps.Marker({
          position: uluru,
          map: map
        });
      }
      function Metro() {
        var uluru = {lat: 19.4069696, lng: -99.16700029999998};
        var map = new google.maps.Map(document.getElementById('map'), {
          zoom: 18,
          center: uluru
        });
        var marker = new google.maps.Marker({
          position: uluru,
          map: map
        });
      }
      function Santa() {
        var uluru = {lat: 19.434271, lng: -99.19184790000003};
        var map = new google.maps.Map(document.getElementById('map'), {
          zoom: 18,
          center: uluru
        });
        var marker = new google.maps.Marker({
          position: uluru,
          map: map
        });
      }
    </script>
    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCZrzYVK5JgpI_BhXjff-oCfIY3meItpTs&callback=initMap">
    </script>
    
     <div class="input-field col s12">
          <table width="100%" class="responsive-table">
        <thead>
        
            <tr>
              <th width="20%">Hospitales</th>
              <th width="60%">Direccion</th>
              <th width="20%">Areas</th>
          </tr>
        
        </thead>

        <tbody>
            <tr onclick="Lindavista()">
            <td>Hospital Los Angeles Lindavista</td>
            <td>Calle Riobamba 639, Magdalena de las Salinas, 07760 Ciudad de México, CDMX</td>
            <td></td>
          </tr>
          <tr onclick="Metro()">
            <td>Hospital Ángeles Metropolitano</td>
            <td>Tlacotalpan 59, Roma Sur, 06760 Ciudad de México, CDMX</td>
            <td></td>
          </tr>
          <tr onclick="Santa()">
            <td>Hospital Angeles Santa Mónica</td>
            <td>Temístocles 210, Polanco IV Sección, 11560 miguel Hidalgo, CDMX</td>
            <TD></TD>
          </tr>
        </tbody>
      </table>
         </div>
</section></section>
         
         <footer class="footer">
            <p>WU- With U <br> WU What U need</p>
            &COPY; 2018
        </footer>
    </body>
</html>