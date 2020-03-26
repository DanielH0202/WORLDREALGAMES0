<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Clase.*" %>
<%@page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link type="text/css" rel="stylesheet" href="css/cssmaster.css" />
        <script type="text/javascript" src="js/script.js"></script>
        <title>Mostrar Producto</title>
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

        <%
            String codigo = (String) session.getAttribute("parametroCodigo");

            Usuario usu = Usuario_DB.listarUsuarioPorCodigo(codigo);
            String cliente = usu.getNombreUsuario() + ", " + usu.getApellidosUsuario();
        %>

        <header id="main-header">

            <a id="logo-header" href="index.jsp">
                <span class="site-name">World Real Games</span>
                <span class="site-desc">Siempre con la calidad de nuestros productos</span>
                <form action="Servlet_Usu" method="post" id="frmCabecera">
                    <input type="hidden" value="<%=usu.getTipoUsuario()%>" name="txtTipo" id="txtTipo">
                    <center><h3>BIENVENIDO : <%=usu.getNombreUsuario()%> <%=usu.getApellidosUsuario()%></h3></center>
            </a> <!-- / #logo-header -->

            <nav>
                <ul>
                    <li><a href="Catalogo.jsp">Inicio</a></li>

                    <li><a href="MiPerfil.jsp?codigoU=<%=usu.getCodigoUsuario()%>" class="link" id="lnkPerfil">Mi cuenta</a></li>
                    <li> <a href="CuentaAdministrador.jsp" class="link" id="lnkAdm">Administrar</a></li>
                    <li><a href="index.jsp" class="link" id="lnkLogout">Salir</a></li>
                </ul>
            </nav><!-- / nav -->

        </form>                
    </header><!-- / #main-header -->
    <form id="frmMostrarCabeceraCP">
        <table id="tablaMostrarCabeceraCP">
            <tr>
                <th style="color: #000000">
            <h1> Clase productos habilitados </h1>
            </th>
            </tr>
            <tr>
                <td>
                    <a href="CuentaAdministrador.jsp" class="link"><h4> P&aacute;gina principal </h4></a>
                </td>
            </tr>
        </table>
    </form>

    <hr>

    <form id="frmMostrarCuerpoCP">
        <table id="tablaMostrarCuerpoCP">
            <tr>
                <th class="Titulo">
                    C&Oacute;DIGO
                </th>
                <th class="Titulo">
                    NOMBRE
                </th>
                <th class="Titulo">
                    ESTADO
                </th>
                <th colspan="2" class="Titulo">
                    OPCI&Oacute;N
                </th>
            </tr>    

            <%
                ArrayList<ClaseP> lista = ClaseP_DB.ObtenerCPHabilitados();
                for (int i = 0; i < lista.size(); i++) {
                    ClaseP CP = lista.get(i);
            %>

            <tr>
                <td>
                    <%=CP.getCodigoCP()%>
                </td>
                <td>
                    <%=CP.getNombreCP()%>
                </td>
                <td>
                    <%=CP.getEstadoCP()%>
                </td>

                <td class="Opcion">
                    <input type="button" name="btnEliminar" value="Inhabilitar" id="btnEliminar" class="button" onclick="location.href = 'Servlet_CP?codigoCP=<%=CP.getCodigoCP()%>&&accion=eliminar'">

                <td>
                    <div id="detalleObra"></div>
                </td>
                </td>
            </tr>

            <%
                }
            %>

        </table>
    </form>
</body>


</html>