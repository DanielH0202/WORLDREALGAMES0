

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@page import="Clase.*" %>
<%@page import="java.text.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link type="text/css" rel="stylesheet" href="css/cssmaster.css" />
        <link type="text/css" rel="stylesheet" href="css/nav.css" />
        <title>Administrador</title>
        <link rel="icon" type="image/png" href="imagen/pc.jpg"/>
        <script type="text/javascript">
            history.forward();
        </script>
    <div style="color: #000000" align='center'>
    <h2>Administrador</h2>
    </div>
    <div align="center"><img src="ImagenWorldRealGames/WRGrosa.jpg" alt=""></div>
    <link rel="icon" type="image/png" href="imagen/pc.jpg"/>
</head>
<body onload="cargar()">
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
                <h3>Bienvenido: <br> <%=usu.getNombreUsuario()%> <%=usu.getApellidosUsuario()%></h3>
        </a> <!-- / #logo-header -->
        <br>

        <div id="header">
           
            <ul class="nav">
                <li><a href="Catalogo.jsp">Inicio</a></li>
                <li><a href="">Productos</a>
                    <ul>
                        <li><a href="RegistrarClaseProducto.jsp">Registrar Clase de producto</a></li>
                        <li><a href="RegistrarMarcaProducto.jsp">Registrar marca del producto</a></li>
                        <li><a href="RegistrarProducto.jsp">Agregar imagen del producto</a></li>
                        <li><a href="MostrarCP.jsp">Modificar los productos</a>
                        <li><a href="MostrarCPEliminados.jsp">Habilitar la clase de productos "inhabilitados"</a>
                        <li><a href="MostrarCP_1.jsp">Recuperar la clase de productos "inhabilitados"</a>
                        <li><a href="MostrarMP.jsp">Modificar marca de los productos</a>
                        <li><a href="MostrarMP2.jsp">Inhabilitar temporalmente marca de producto</a>
                        <li><a href="MostrarUsuarioEliminado.jsp">Recuperar la marca de productos inhabilitados</a>
                        <li><a href="MostrarProducto_1.jsp">Inhabilita productos completos registrados</a>
                        <li><a href="MostrarMPEliminados.jsp">Recuperar los productos completos</a>
                        <li><a href="MostrarCP_1_1.jsp">Visualizar los productos habilitados</a>
                        <li><a href="MostrarCPEliminados_2.jsp">Visualizar los productos Inhabilitados</a></li>
                    </ul>
                </li>
                <li><a href="">Usuarios</a>
                    <ul>
                        <li><a href="MostrarUsuario.jsp">Eliminar usuarios registrados</a></li>
                        <li><a href="MostrarUsuarioEliminado.jsp">Recuperar usuarios eliminados</a></li>
                    </ul>
                </li>
                <li><a href="">Ventas</a>
                    <ul>
                        <li><a href="MostrarVenta.jsp">Pedidos Realizados</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </form>                 
</header><!-- / #main-header --> 
<footer id="main-footer">
        <p>&copy; 2020 <a>World Real Games</a></p>
        <br>
        <img src="ImagenWorldRealGames/wrg.png" width="250" height="67" scale="1.5">
    </footer> 
</body>
</html>
