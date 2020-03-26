<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList" %>
<%@page import="Clase.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
        <script type="text/javascript" src="js/Catalogo.js"></script>
        <link type="text/css" rel="stylesheet" href="css/cssmaster.css" />
        <script type="text/javascript" src="js/script.js"></script>

        <title>Cat&aacute;logo</title>
        <link rel="icon" type="image/png" href="imagen/pc.jpg"/>
        <script type="text/javascript">
            history.forward();
        </script>

    </head>

    <body onload="cargar()">
        <h1 align="center">
            <%
                if(request.getParameter("mens")!=null){
                    out.println(request.getParameter("mens"));
                }
            %>
        </h1><br>
        
        <%
            String codigo = (String) session.getAttribute("parametroCodigo");

            Usuario usu = Usuario_DB.listarUsuarioPorCodigo(codigo);
            String cliente = usu.getNombreUsuario() + ", " + usu.getApellidosUsuario();
            if (codigo == null) {
                 response.sendRedirect("Login.jsp");
            }
        %>

        <header id="main-header">

            <a id="logo-header" href="index.jsp">
                <span class="site-name">World Real Games</span>
                <span class="site-desc">Productos / De calidad / Originales</span>
                <form action="Servlet_Usu" method="post" id="frmCabecera">
                    <input type="hidden" value="<%=usu.getTipoUsuario()%>" name="txtTipo" id="txtTipo">
                    <center><h3>Bienvenido: <%=usu.getNombreUsuario()%> <%=usu.getApellidosUsuario()%></h3></center>
            </a> <!-- / #logo-header -->

            <nav>
                <ul>
                    <li><a href="Catalogo.jsp">Inicio</a></li>
                    <!-- <li><a href="SubirPDF.jsp" class="link" id="lnkPerfil">Cat&aacute;logo recientes</a></li> -->
                    <li><a href="MiPerfil.jsp?codigoU=<%=usu.getCodigoUsuario()%>" class="link" id="lnkPerfil">Mi cuenta</a></li>
                    <li><a href="Catalogo1.jsp">Productos</a></li>
                    <li> <a href="CuentaAdministrador.jsp" class="link" id="lnkAdm">Administrar</a></li>
                    <li><a href="ServletLoOut" class="link" id="lnkLogout">Salir</a></li>
                </ul>
            </nav><!-- / nav -->

        </form>                
    </header><!-- / #main-header -->
    <div align="center"><img src="ImagenWorldRealGames/WRGrosa.jpg"></div>
    <!-- <div class="section">
                            <img class="materialboxed" width="15%" height="auto" src="ImagenWorldRealGames/Alienware-Aurora-R5.png">

                            <img class="materialboxed" width="15%" height="auto" src="imagen/img (4).png" alt=""/>
                            <img class="materialboxed" width="15%" height="auto" src="imagen/img(5).png" alt=""/>
                            <img class="materialboxed" width="13%" height="auto" src="imagen/img(6).png" alt=""/>
                            <img class="materialboxed" width="15%" height="auto" src="imagen/m.jpg" alt=""/>
                            
                            <img class="materialboxed" width="20%" height="auto" src="imagen/r_1.jpg" alt=""/>
                        </div>-->
    <section id="main-content">
        <article>
            <div class="content">
                <input type="hidden" name="accion" value="logout">
                </form>

                <hr>

                <form id="frmCatalogo">

                    
                   
                    <table width="800" id="tablaCatalogo">
                <tr>
                    <th colspan="3">
                <h2>Productos más recientes</h2>
                    </th>
                </tr>
                    <tbody>
                            <%
                                ArrayList<Producto> lista = Producto_DB.obtenerProductosHabilitados();
                                int salto = 0;
                                for (int i = 0; i < lista.size(); i++) {
                                    Producto p = lista.get(i);
                            %>

                        <th><img src="imagen/<%=p.getImagenP()%>" width="100" height="100"><br>
                            <%=p.getClaseProducto()%> <%=p.getMarcaProducto()%> <br>
                            <%=p.getDescripcion()%><br>
                            MX$ <%=p.getPrecioP()%><br>
                            <input type="button" class="BotonModificar" name="btnModificar" value="Modificar" onclick="location.href = 'ModificarProducto.jsp?codigoP=<%=p.getCodigoP()%>'">

                        </th>
                        <%
                            salto++;
                            if (salto == 3) {
                        %>

                        <tr>

                            <%
                                        salto = 0;
                                    }
                                }
                            %>
                            </tbody>
                             </table>
                </form>  
            </div>
      </body>
        </article> <!-- /article -->
    </section> <!-- / #main-content -->
    <footer id="main-footer">
            <p>&copy; 2020 World Real Games</a></p>
                <br>
                <img src="ImagenWorldRealGames/wrg.png" width="173" height="67" scale="1.5">
	</footer> <!-- / #main-footer -->

</html>