<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@page import="Clase.*" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
        <script type="text/javascript" src="js/ModificarProd.js"></script>
        <link type="text/css" rel="stylesheet" href="css/cssmaster.css" />
        <title>Modificar producto</title>
         <script type="text/javascript">
            history.forward();
        </script>
            <div align="center"><img src="ImagenWorldRealGames/WRGrosa.jpg" width="15%"></div>
    </head>
       <%
        Producto p = Producto_DB.listarProductoPorCodigo(request.getParameter("codigoP"));
    %>
    <%
        String codigo = (String)session.getAttribute("parametroCodigo");
        Usuario usu = Usuario_DB.listarUsuarioPorCodigo(codigo);
        String cliente = usu.getNombreUsuario() + ", " + usu.getApellidosUsuario();
    %>

        <header id="main-header">

            <a id="logo-header" href="Catalogo.jsp"></a>
                <span class="site-name">World Real Games</span>
			<span class="site-desc">Productos / De calidad / Originales</span>
		<nav>
			<ul>
                            <li><a href="Catalogo.jsp">Inicio</a></li>
                            <li><a href="RegistrarVenta.jsp" class="link" id="lnkCompra">Mi compra</a></li>
                            <li><a href="MiPerfil.jsp?codigoU=<%=usu.getCodigoUsuario() %>" class="link" id="lnkPerfil">Mi cuenta</a></li>
                            <li> <a href="CuentaAdministrador.jsp" class="link" id="lnkAdm">Administrar</a></li>
                            <li><a href="index.jsp" class="link" id="lnkLogout">Salir</a></li>
			</ul>
		</nav><!-- / nav -->
                
    </form>               
</header><!-- / #main-header -->

 <body onload="cargar()">
        <form name="frm" action="Servlet_Prod" method="post" id="frmModificarProd">
            <table id="tablaModificarProd">
                <tr>
                    <th colspan="2"  style="color:#bd0073">
                        <h1>Modificar producto</h1>
                    </th>
                </tr>
                <tr>
                    <td colspan="2">
                        <input type="hidden" name="txtCodigo" value="<%=p.getCodigoP() %>">
                    </td>
                </tr>
                <tr>
                    <td class="primeraColumna">
                        C&oacute;digo producto :
                    </td>
                    <td>
                        <dd> <%=p.getCodigoP() %> </dd>
                    </td>
                </tr>
                <tr>
                    <td class="primeraColumna">
                        Nombre CP :
                    </td>
                    <td>
                        <dd> <input type="text" name="txtNombreCP" id="txtNombreCP" value="<%=p.getClaseProducto() %>" size="30" maxlength="30"> </dd>
                    </td>
                </tr>
                <tr>
                    <td class="primeraColumna">
                        Nombre MP :
                    </td>
                    <td>
                        <dd> <input type="text" name="txtNombreMP" id="txtNombreMP" value="<%=p.getMarcaProducto() %>" size="30" maxlength="30"> </dd>
                    </td>
                </tr>
                <tr>
                    <td class="primeraColumna">
                        Descripci&oacute;n del producto :
                    </td>
                    <td>
                        <dd> <input type="text" name="txtDescripcionP" id="txtDescripcionP" value="<%=p.getDescripcion() %>" size="30" maxlength="30"> </dd>
                    </td>
                </tr>
                <tr>
                    <td class="primeraColumna">
                        Precio producto :
                    </td>
                    <td>
                        <dd> <input type="text" name="txtPrecioP" id="txtPrecioP" value="<%=p.getPrecioP() %>" size="30" maxlength="30"> </dd>
                    </td>
                </tr>
                <tr>
                    <td class="primeraColumna">
                        Imagen actual : 
                    </td>
                    <td>
                            <dd> <input type="radio" name="selected" value="SelectImagenActual" id="SelectImagenActual" checked="checked"> 
                            <input type="text" name="txtImagen" id="txtImagen" value="<%=p.getImagenP() %>" size="30" maxlength="30"> </dd>
                    </td>
                </tr>
                <tr>
                    <td class="primeraColumna">
                        Modificar imagen : 
                    </td>
                    <td>
                            <dd> <input type="radio" name="selected" value="SelectModificarImagen" id="SelectModificarImagen"> 
                            <input type="file" name="txtModificarImagen" id="txtModificarImagen" size="30"> </dd>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="Botones">
                        <br>
                        <input type="button" name="btnCancelar" id="btnCancelar" class="button" value="Cancelar">
                        <input type="button" name="btnGuardar" id="btnGuardar" class="button" value="Guardar">
                    </td>
                </tr>
                <tr>
                    <td>
                        <br>
                    </td>
                </tr>
            </table>
                    <input type="hidden" name="accion" value="actualizar">
        </form>
   
              <footer id="main-footer">
        <p>&copy; 2020 <a>World Real Games</a></p>
        <br>
        <img src="ImagenWorldRealGames/wrg.png" width="250" height="67" scale="1.5">
    </footer> 
    </body>
</html>
