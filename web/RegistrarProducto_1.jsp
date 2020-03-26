<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Clase.*" %>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
        <script type="text/javascript" src="js/RegistrarProd.js"></script>
        <link type="text/css" rel="stylesheet" href="css/cssmaster.css" />
        <title>REGISTRO</title>
         <script type="text/javascript">
            history.forward();
        </script>
            <div align="center"><img src="ImagenWorldRealGames/WRGrosa.jpg" width="15%"></div>

    </head>

    <%
        String Codigo_P = ObtenerCodigo.CodigoProducto();
    %>

    <body onload="cargar()">
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
    <%
        Connection con;
        String url = "jdbc:mysql://localhost:3306/proyecto";
        String Driver = "com.mysql.jdbc.Driver";
        Class.forName(Driver).newInstance();
        String user = "root";
        String clave = "";
        Class.forName(Driver);
        con = DriverManager.getConnection(url, user, clave);

        PreparedStatement ps;
        ResultSet rs;
    %>
    <form name="frm" action="Servlet_Prod" method="post" id="frmRegistrarProd">
        <table id="tablaRegistrarProd">
            <tr>
                <th colspan="2" style="color:#bd0073">
                    <h1> Registrar producto  </h1>
                </th>
            </tr>
            <tr>
                <td class="primeraColumna">
                    C&oacute;digo :
                </td>
                <td>
            <dd> <input type="text" name="txtCodigo" value="<%=Codigo_P%>" readonly="readonly"> </dd>
            </td>
            </tr>
            
            <tr>
                <td class="primeraColumna">
                    Descripci&oacute;n :
                </td>
                <td>
            <dd> <input type="text" name="txtDescripcion" id="txtDescripcion" class="textBox"> </dd>
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
   <footer id="main-footer">
        <p>&copy; 2020 <a>World Real Games</a></p>
        <br>
        <img src="ImagenWorldRealGames/wrg.png" width="250" height="67" scale="1.5">
    </footer> 
</body>
</html>
