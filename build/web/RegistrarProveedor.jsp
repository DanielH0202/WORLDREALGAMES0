<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Clase.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
        <script type="text/javascript" src="js/RegistrarProvee.js"></script>
        <link type="text/css" rel="stylesheet" href="css/css1.css" />
        <title>Registro</title>
         <script type="text/javascript">
            history.forward();
        </script>
            <div align="center"><img src="ImagenWorldRealGames/WRGrosa.jpg" width="15%"></div>
    </head>
    
    
    
    <body onload="cargar()">
        <form name="frm" action="Servlet_Provee" method="post" id="frmRegistrarProd">
            <table id="tablaRegistrarProd">
                <tr>
                    <th colspan="2">
                        <h1> Registrar Proveedor  </h1>
                    </th>
                </tr>
                </tr>
                <tr>
                    <td class="primeraColumna">
                        Nombre :
                    </td>
                    <td>
                        <dd> <input type="text" name="txtClase" id="txtClase" class="textBox"> </dd>
                    </td>
                </tr>
                <tr>
                    <td class="primeraColumna">
                       Apellido Paterno :
                    </td>
                    <td>
                        <dd> <input type="text" name="txtMarca" id="txtMarca" class="textBox"> </dd>
                    </td>
                </tr>
                <tr>
                    <td class="primeraColumna">
                        Apellido Materno :
                    </td>
                    <td>
                        <dd> <input type="text" name="txtDescripcion" id="txtDescripcion" class="textBox"> </dd>
                    </td>
                </tr>
                <tr>
                    <td class="primeraColumna">
                       Edad :
                    </td>
                    <td>
                        <dd> <input type="text" name="txtPrecio" id="txtPrecio" class="textBox"> </dd>
                    </td>
                </tr>
                <tr>
                    <td class="primeraColumna">
                        C&oacute;digo Proveedor :
                    </td>
                    <td>
                        <dd> <input type="text" name="txtPrecio" id="txtPrecio" class="textBox"> </dd>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="Botones">
                        <br>
                        <input type="button" name="btnCancelar" id="btnCancelar" class="button" value="Cancelar">
                        <input type="button" name="btnRegistrar" id="btnRegistrar" class="button" value="Registrar">
                    </td>
                </tr>
                <tr>
                    <td>
                        <br>
                    </td>
                </tr>
            </table>
                    <input type="hidden" name="accion" value="insertar">
        </form>
    </body>
</html>