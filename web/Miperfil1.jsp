<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Clase.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
        <script type="text/javascript" src="js/MiPerfil.js"></script>
        <link type="text/css" rel="stylesheet" href="css/cssmaster.css" />
        <title>Mi perfil</title>
         <script type="text/javascript">
            history.forward();
        </script>
            <div align="center"><img src="ImagenWorldRealGames/WRGrosa.jpg" width="15%"></div>
    </head>
    <body onload="cargar()">
        
        
    <%
        Usuario usu = Usuario_DB.listarUsuarioPorCodigo(request.getParameter("codigoU"));
    %>
 <header id="main-header">

            <a id="logo-header" href="index.jsp">
                <span class="site-name">World Real Games</span>
			<span class="site-desc">Siempre con la calidad de nuestros productos</span>
                       <form action="Servlet_Usu" method="post" id="frmCabecera">
                <input type="hidden" value="<%=usu.getTipoUsuario()%>" name="txtTipo" id="txtTipo">
                <center><h3>Bienvenido : <%=usu.getNombreUsuario()%> <%=usu.getApellidosUsuario()%></h3></center>
		</a> <!-- / #logo-header -->
                
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
        
        <form action="Servlet_Usu" method="post" id="frmModificarUsuario">
            <table id="tablaModificarUsuario">
                <tr>
                    <th colspan="3">
                        <h1>Mi perfil</h1>
                    </th>
                </tr>
                <tr>
                    <td colspan="3">
                        <input type="hidden" name="txtCodigo" value="<%=usu.getCodigoUsuario() %>"> 
                    </td>
                </tr>
                <tr>
                    <td class="primeraColumna">
                        Nombre : 
                    </td>
                    <td>
                        <dd class="soloTexto"> <%=usu.getNombreUsuario() %> </dd>
                        <dd> <input type="text" name="txtNombre" id="txtNombre" class="campoOculto" value="<%=usu.getNombreUsuario() %>" size="30" maxlength="50"> </dd>
                        
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td class="primeraColumna">
                        Apellidos : 
                    </td>
                    <td>
                        <dd class="soloTexto"> <%=usu.getApellidosUsuario()%> </dd>
                        <dd> <input type="text" name="txtApellidos" id="txtApellido" class="campoOculto" value="<%=usu.getApellidosUsuario() %>" size="30" maxlength="50"> </dd>
                    </td>
                    <td></td>
                </tr>    
                <tr>
                    <td class="primeraColumna">
                        Email :
                    </td>
                    <td>
                        <dd> <%=usu.getEmailUsuario()%> </dd>
                    </td>
                    <td>
                        <dd> <a href="ModificarEmail.jsp?codigoU=<%=usu.getCodigoUsuario() %>" class="Enlace">Cambiar email</a> </dd>
                    </td>
                </tr>
                <tr>
                    <td class="primeraColumna">
                        Contraseña :
                    </td>
                    <td>
                        <dd> ********** </dd>
                    </td>
                    <td>
                        <dd> <a href="ModificarContraseña.jsp?codigoU=<%=usu.getCodigoUsuario() %>" class="Enlace">Cambiar contraseña</a> </dd>
                    </td>
                </tr>
                <tr>
                    <td class="primeraColumna">
                        Direcci&oacute;n 1 :
                    </td>
                    <td>
                        <dd class="soloTexto"> <%=usu.getDireccion1Usuario()%> </dd>
                        <dd> <input type="text" name="txtDireccion1" id="txtDireccion1" class="campoOculto" value="<%=usu.getDireccion1Usuario() %>" size="30" maxlength="50"> </dd>
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td class="primeraColumna">
                        Direcci&oacute;n 2 :
                    </td>
                    <td>
                        <dd class="soloTexto"> <%=usu.getDireccion2Usuario()%> </dd>
                        <dd> <input type="text" name="txtDireccion2" id="txtDireccion2" class="campoOculto" value="<%=usu.getDireccion2Usuario() %>" size="30" maxlength="50"> </dd>
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td class="primeraColumna">
                        Tel&eacute;fono :
                    </td>
                    <td>
                        <dd class="soloTexto"> <%=usu.getTelefonoUsuario()%> </dd>
                        <dd> <input type="text" name="txtTelefono" id="txtTelefono" class="campoOculto" value="<%=usu.getTelefonoUsuario() %>" size="30" maxlength="10"> </dd>
                    </td>
                    <td></td>
                </tr>
                <tr>
                    
                </tr>
                <tr>
                    <td colspan="3" class="Botones">
                        <br>
                        <input type="button" name="btnCancelar" id="btnCancelar" class="button" value="Cancelar">
                        <input type="button" name="btnModificar" id="btnModificar" class="button" value="Modificar">
                        <input type="button" name="btnGuardar" id="btnGuardar" class="campoOculto" value="Guardar">
                    </td>
                </tr>
                <tr>
                    <td>
                        <br>
                    </td>
                </tr>
            </table>
                    <input type="hidden" name="accion" value="modificarUsuario">
        </form>
                <footer id="main-footer">
        <p>&copy; 2020 <a>World Real Games</a></p>
        <br>
        <img src="ImagenWorldRealGames/wrg.png" width="250" height="67" scale="1.5">
    </footer> 
    </body>
</html>