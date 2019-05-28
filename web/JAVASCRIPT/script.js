/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
window.onload = function Requerir (){
    Push.Permission.request();
};

var noti = document.getElementsByClassName("enviar");    
noti.addEventListener('click', function(){
    Push.create('Torre 1, Enfermera Vásquez',{
        body: 'Área de oftalmología',
        icon: '../IMGSOCUPABILIDAD/icon.png',
        timeout: 5000
    });
});
    
