/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
var divInicio = "inicio", xhr;

function DinamicoDiv(divActual) {
    document.getElementById(divActual).style.display = 'block';
    if (divInicio != divActual) {
        document.getElementById(divInicio).style.display = 'none';
    }
    divInicio = divActual;
}

function createObjeto() {
    if (window.ActiveXObject) {
        xhr = new ActiveXObject("Microsoft.XMLHttp");
    } else if ((window.XMLHttpRequest) || (typeof XMLHttpRequest) != undefined) {
        xhr = new XMLHttpRequest();
    } else {
        alert("su navegador no soporta AJAX");
        return;
    }
}

///////////////////////////////////////////////////////////////////////////// INICIO ///////////////////////////////////////////////////////////////////

function buscaOpcion(numero) {
    createObjeto();
    llenacb1_2(numero);
}

function llenacb1_2(numero) {
    xhr.open("GET", "DetalleTeatro?num=" + numero, true);
    xhr.onreadystatechange = verficaDetalle;
    //xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    xhr.send();
}

function verficaDetalle() {
    if (xhr.readyState === 4) {
        document.getElementById("detalle").innerHTML = "<em>" + xhr.responseText + "</em>";
    }
}

/*********************************************************************************************************************/

function obrasEliminar() {
    crearObjeto();
    enviarEliminacionObras();
}

function enviarEliminacionObras() {
    xhr.open("GET", "ObrasEliminar", true);
    xhr.onreadystatechange = verificarDetalleObrasEliminar;
    xhr.send(null);
}

function verificarDetalleObrasEliminar() {
    if (xhr.readyState == 4) {
        document.getElementById("detalle1").innerHTML = "<em>" + xhr.responseText + "</em>";
    }
}

function obrasEliminarI(){
    crearObjeto();
    enviarEliminacionObrasI();
}
    
function enviarEliminacionObrasI(){
    var Nombre=document.getElementById("Nombre").value;
    xhr.open("GET","ObrasEliminarI?Nombre="+Nombre,true);
    xhr.onreadystatechange=verificarDetalleObrasEliminarI;
    xhr.send(null);
}

function verificarDetalleObrasEliminarI(){
    if(xhr.readyState==4){
        document.getElementById("eliminacion").innerHTML="<em>"+xhr.responseText+"</em>";
    }
}

/*********************************************************************************************************************/






