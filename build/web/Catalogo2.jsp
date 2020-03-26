<%-- 
    Document   : Catalogo1
    Created on : 07-nov-2019, 10:20:25
    Author     : Tecamac
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList" %>
<%@page import="Clase.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
        <script type="text/javascript" src="js/Catalogo1.js"></script>
        <link type="text/css" rel="stylesheet" href="css/cssmaster.css" />
        
        <title>Catálogo</title>
        <link rel="icon" type="image/png" href="imagen/pc.jpg"/>
        <script type="text/javascript">
            history.forward();
        </script>
           <div align="center"><img src="ImagenWorldRealGames/WRGrosa.jpg" width="15%"></div>
    </head>
    
    <body onload="cargar()">
        
        <%
            String codigo = (String)session.getAttribute("parametroCodigo");
            
            Usuario usu = Usuario_DB.listarUsuarioPorCodigo(codigo);
            String cliente = usu.getNombreUsuario() + ", " + usu.getApellidosUsuario();
        %>
    <header id="main-header">

            <a id="logo-header" href="Catalogo1.jsp">
			<span class="site-name">World Real Games</span>
                        <span class="site-desc">Siempre con la calidad de nuestros productos</span>
                       <form action="Servlet_Usu" method="post" id="frmCabecera">
                <input type="hidden" value="<%=usu.getTipoUsuario()%>" name="txtTipo" id="txtTipo">
                <center><h3>Bienvenido : <%=usu.getNombreUsuario()%> <%=usu.getApellidosUsuario()%></h3></center>
		</a> <!-- / #logo-header -->
                
		<nav>
			<ul>
                            <li><a href="Catalogo.jsp">Inicio</a></li>
                            <li> <a href="CuentaAdministrador.jsp" class="link" id="lnkAdm">Administrador</a></li>
                            <li><a href="MiPerfil.jsp?codigoU=<%=usu.getCodigoUsuario() %>" class="link" id="lnkPerfil">Mi cuenta</a></li>
                            <li><a href="index.jsp" class="link" id="lnkLogout">Salir</a></li>
			</ul>
		</nav><!-- / nav -->
                
        </form>                
</header><!-- / #main-header -->    
        
       
        
        <form action="Servlet_Usu" method="post" id="frmCabecera">
            <input type="hidden" value="<%=usu.getTipoUsuario() %>" name="txtTipo" id="txtTipo">
            <table id="tablaCabecera">
                
            <input type="hidden" name="accion" value="logout">
        </form>
        <hr>

        <form id="frmCatalogo">
            
            <table width="800" id="tablaCatalogo">
                <tr>
                    <th colspan="3">
                        <h1> Cat&aacute;logo de productos m&aacute;s recientes </h1>
                    </th>
                </tr>
                
                <tbody>
                <%
                    ArrayList<Producto> lista = Producto_DB.obtenerProductosHabilitados();
                    int salto = 0;
                    for(int i=0; i<lista.size(); i++){
                        Producto p = lista.get(i);
                %>
                        
                            <th><img src="imagen/<%=p.getImagenP() %>" width="100" height="100"><br>
                                <%=p.getClaseProducto()%> <%=p.getMarcaProducto()%> <br>
                                <%=p.getDescripcion()%><br>
                                S/ <%=p.getPrecioP() %><br>
                            
                             <input type="button" class="BotonModificar" name="btnModificar" value="Modificar" onclick="location.href='ModificarProducto.jsp?codigoP=<%=p.getCodigoP() %>'">
                            </th>
                <%
                        salto++;
                        if(salto == 3){
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
    </body>
</html>