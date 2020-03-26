<%-- 
    Document   : MostrarUsuario
    Created on : 15-dic-2015, 11:07:57
    Author     : Daniel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@page import="Clase.*" %> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link type="text/css" rel="stylesheet" href="css/cssmaster.css" />
        <title>Usuarios</title>
         <script type="text/javascript">
            history.forward();
        </script>
   
     <div align="center"><img src="ImagenWorldRealGames/WRGrosa.jpg" width="15%"></div>
</head>
<body>
    <h1 align="center">
        <%
            if (request.getParameter("mens") != null) {
                out.println(request.getParameter("mens"));
            }
        %>
    </h1><br>
    <header id="main-header">

            <a id="logo-header" href="index.jsp">
                <span class="site-name">World Real Games</span>
			<span class="site-desc">Siempre con la calidad de nuestros productos</span>
                       <form action="Servlet_Usu" method="post" id="frmCabecera">
               
		</a> <!-- / #logo-header -->
                
		<nav>
			<ul>
                            <li><a href="Catalogo.jsp">Inicio</a></li>
                            <li> <a href="CuentaAdministrador.jsp" class="link" id="lnkAdm">Administrar</a></li>
                            <li><a href="index.jsp" class="link" id="lnkLogout">Salir</a></li>
			</ul>
		</nav><!-- / nav -->
                
        </form>                
</header><!-- / #main-header -->
    <form id="frmMostrarCabeceraUsuario">
        <table id="tablaMostrarCabeceraUsuario">
            <tr>
                <th>
            <h1> Usuarios habilitados </h1>
            </th>
            </tr>
            <tr>
                <td>
                    <a href="CuentaAdministrador.jsp" class="link"><h4> Pagina principal </h4></a>
                </td>
            </tr>
        </table>
    </form>

    <hr>

    <form id="frmMostrarCuerpoUsuario">
        <table id="tablaMostrarCuerpoUsuario">
            <tr>
                <th class="Titulo">
                    CODIGO
                </th>
                <th class="Titulo">
                    NOMBRE
                </th>
                <th class="Titulo">
                    APELLIDO
                </th>
                <th class="Titulo">
                    PIN
                <th class="Titulo">
                    CORREO
                </th>
                <th class="Titulo">
                    TELEFONO
                </th>
                <th class="Titulo">
                    USUARIO
                </th>
                <th class="Titulo">
                    TIPO
                </th>
                <th class="Titulo">
                    ESTADO
                </th>
                <th class="Titulo">
                    OPCION
                </th>
            </tr>    

            <%
                ArrayList<Usuario> lista = Usuario_DB.MostrarUsuarioHabilitado();
                for (int i = 0; i < lista.size(); i++) {
                    Usuario usu = lista.get(i);
            %>

            <tr>
                <td>
                    <%=usu.getCodigoUsuario()%>
                </td>
                <td>
                    <%=usu.getNombreUsuario()%>
                </td>
                <td>
                    <%=usu.getApellidosUsuario()%>
                </td>
               
                <td>
                    <%=usu.getEmailUsuario()%>
                </td>
                <td>
                    <%=usu.getTelefonoUsuario()%>
                </td>
                <td>
                    <%=usu.getIdUsuario()%>
                </td>
                <td>
                    <%=usu.getTipoUsuario()%>
                </td>
                <td>
                    <%=usu.getEstadoUsuario()%>
                </td>
                <td class="Opcion">
                    <input type="button" name="btnEliminar" value="Eliminar" id="btnEliminar" class="button" onclick="location.href = 'Servlet_Usu?codigoU=<%=usu.getCodigoUsuario()%>&&accion=eliminar'">
                </td>
            </tr>

            <%
                }
            %>

        </table>
    </form>
    <footer id="main-footer">
        <p>&copy; 2020 <a>World Real Games</a></p>
        <br>
        <img src="ImagenWorldRealGames/wrg.png" width="250" height="67" scale="1.5">
    </footer> 
    </body>
</html>
