/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function validarEmergencia(){
   var indice=document.getElementById("areaEm").selectedIndex;
   var opciones=document.getElementsByName("alertaEm");
   var seleccionado=false;
   var valor=document.getElementById("textarea2").value;
   if(indice === null || indice === 0){
       alert("Indica en que area esta la emergencia");
       return false;
   }
    for (var i = 0; i < opciones.length; i++) {
        if(opciones[i].checked){
            seleccionado=true;
            break;
        }
    }
    if(!seleccionado){
        alert("Indica el tipo de Emergencia");
        return false;
    }
    if(valor === null || valor.length === 0 || /^\s+$/.test(valor)){
        alert("Introduce una descripcion del reporte");
        return false;
    }
}
/*function validarEspecialista(){
      var indice=document.getElementById("areaEs").selectedIndex;
       var indice2=document.getElementById("personalEs").selectedIndex;
   var valor=document.getElementById("textarea2").value;
   if(indice === null || indice === 0){
       alert("Indica en que area en la que se necesita");
       return false;
   }
   if(indice2 === null || indice2 === 0){
       alert("Indica en el personal que necesitas");
       return false;
   }
    if(valor === null || valor.length === 0 || /^\s+$/.test(valor)){
        alert("Introduce una descripcion de la peticion");
        return false;   
    } 
}*/
/*function validarMatFalt(){
      var indice=document.getElementById("areaMatFalt").selectedIndex;
       var indice2=document.getElementById("materialMatFalt").selectedIndex;
   var valor=document.getElementById("textarea2").value;
   if(indice === null || indice === 0){
       alert("Indica en que area en la que se necesita");
       return false;
   }
   if(indice2 === null || indice2 === 0){
       alert("Indica en el material faltante");
       return false;
   }
    if(valor === null || valor.length === 0 || /^\s+$/.test(valor)){
        alert("Introduce una especificacion");
        return false;   
    } 
}*/
/*function validarMatSob(){
     var indice=document.getElementById("areaMatSob").selectedIndex;
       var indice2=document.getElementById("materialMatSob").selectedIndex;
   var valor=document.getElementById("textarea2").value;
   if(indice === null || indice === 0){
       alert("Indica en que area en la que se encuentra");
       return false;
   }
   if(indice2 === null || indice2 === 0){
       alert("Indica en el material sobrante");
       return false;
   }
    if(valor === null || valor.length === 0 || /^\s+$/.test(valor)){
        alert("Introduce una especificacion");
        return false;   
    }  
}*/



//aperecer div de registro
var clic=1;

function divAparece(){
    if(clic === 1){
        document.getElementById("caja").style.display="block";
        document.getElementById("caja").style.height="768px";
        document.getElementById("caja").style.transition="height .10s";
        clic=clic+1;
    }else{
        document.getElementById("caja").style.display="none";
        document.getElementById("caja").style.height="0px";
        clic=1;
    }
    
}
//validar que solo sean letras