<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Clase.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
        <script type="text/javascript" src="js/CambiarPass.js"></script>
        <link type="text/css" rel="stylesheet" href="css/css1.css" />
        <link type="text/css" rel="stylesheet" href="css/cssmaster.css" />
        <title>Modificar Contraseña</title>
         <script type="text/javascript">
            history.forward();
        </script>
   <div align="center"><img src="ImagenWorldRealGames/WRGrosa.jpg" width="15%"></div>
</head>

<%
    Usuario usu = Usuario_DB.listarUsuarioPorCodigo(request.getParameter("codigoU"));
%>


<body onload="cargar()">
    <header id="main-header">

        <a id="logo-header" href="#">
            <span class="site-name">World Real Games</span>
            <span class="site-desc">Siempre con la calidad de nuestros productos</span>
        </a> <!-- / #logo-header -->

        <nav>
            <ul>
                <li><a href="Catalogo.jsp" class="link" id="lnkLogin">Inicio</a></li>

            </ul>
        </nav><!-- / nav -->

    </header><!-- / #main-header -->

    <form action="Servlet_Usu" method="post" id="frmModificarClave">
        <table id="tablaModificarClave">
            <tr>
                <th colspan="2">
            <h1>Cambiar contrase&ntildea</h1>
            </th>
            </tr>
            <tr>
                <td colspan="2">
                    <input type="hidden" name="txtCodigo" value="<%=usu.getCodigoUsuario()%>">
                    <input type="hidden" name="txtCaracter" value="<%=usu.getClaveUsuario()%>">
                </td>
            </tr>
            <tr>
                <td class="primeraColumna">
                    Ingrese su contrase&ntildea actual : 
                </td>
                <td>
            <dd> <input type="password" name="txtClaveActual" id="txtClaveActual" class="textBox" size="20" maxlength="20"> </dd>
            </td>
            </tr>
            <tr>
                <td class="primeraColumna">
                    Ingrese nueva contrase&ntildea : 
                </td>
                <td>
            <dd> <input type="password" name="txtClave" id="txtClave" class="textBox" size="20" maxlength="20"> </dd>
            </td>
            </tr>
            <tr>
                <td class="primeraColumna">
                    Confirmar su contrase&ntildea :
                </td>
                <td>
            <dd> <input type="password" name="txtConfirmarClave" id="txtConfirClave" class="textBox" size="20" maxlength="20"> </dd>
            </td>
            </tr>
            <tr>
                <td class="Botones">
                    <br>
                 
                    <input type="button" name="btnGuardar" id="btnGuardar" class="button" value="Guardar">
                </td>
            </tr>
            <tr>
                    <td>
                        <a href="Catalogo.jsp" class="link" style="color:#000000">REGRESAR</a>
                    </td>
                </tr>
            <tr>
                <td>
                    <br>
                </td>
            </tr>
        </table>
        <input type="hidden" name="accion" value="modificarClave">
    </form>
   <footer id="main-footer">
        <p>&copy; 2020 <a>World Real Games</a></p>
        <br>
        <img src="ImagenWorldRealGames/wrg.png" width="250" height="67" scale="1.5">
    </footer> 
</body>
</html>
