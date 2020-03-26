<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@page import="Clase.*" %>
<%@page import="java.text.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link type="text/css" rel="stylesheet" href="css/css1.css" />
        <link type="text/css" rel="stylesheet" href="css/cssmaster.css" />
        <title>Detalle Venta</title>
         <script type="text/javascript">
            history.forward();
        </script>
           <div align="center"><img src="ImagenWorldRealGames/WRGrosa.jpg" width="15%"></div>
    </head>

    <%
        String CodigoVenta = (String) session.getAttribute("CodigoVenta");
        String CodigoCliente = (String) session.getAttribute("CodigoCliente");
        String Cliente = (String) session.getAttribute("Cliente");
        String Fecha = (String) session.getAttribute("FechaVenta");
        String Importe = (String) session.getAttribute("Importe");
    %>

    <body>
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
        
        <form action="Servlet_Prod" method="post" id="frmMostrarDetalleVenta">
            <br>
            <table id="tablaMostrarDetalleVenta">
                <tr>
                    <th colspan="5" class="TituloDV">
                <h3>VENTA - <%=CodigoVenta%> </h3>
                </th>
                </tr>
                <tr>
                    <th class="TituloDV">
                        CLIENTE :  
                    </th>
                    <td colspan="4" class="Contenido">
                        <%=Cliente%>
                    </td>
                </tr>
                <tr>
                    <td colspan="5" class="FilaEnBlanco">
                        <br>
                    </td>
                </tr>
                <tr>
                    <th class="TituloDV">
                        PRODUCTO 
                    </th>
                    <th class="TituloDV">
                        P/U (MX)
                    </th>
                    <th class="TituloDV">
                        CANTIDAD 
                    </th>
                    <th class="TituloDV">
                        DESC (MX)
                    </th>
                    <th class="TituloDV">
                        SUBTOTAL (MX)
                    </th>
                </tr>

                <%
                    DecimalFormat df = new DecimalFormat("0.00");
                    DecimalFormatSymbols dfs = df.getDecimalFormatSymbols();
                    dfs.setDecimalSeparator('.');
                    df.setDecimalFormatSymbols(dfs);

                    ArrayList<DetalleVenta> lista = DetalleVenta_DB.obtenerDetalleVenta(CodigoVenta);
                    for (int i = 0; i < lista.size(); i++) {
                        DetalleVenta dv = lista.get(i);
                %>
                <tr>
                    <td class="Contenido"><%=dv.getNombreProducto()%></td>
                    <td class="Contenido"><%=df.format(dv.getPrecio())%></td>
                    <td class="Contenido"><%=df.format(dv.getCantidad())%></td>
                    <td class="Contenido"><%=df.format(dv.getDescuento())%></td>
                    <td class="Contenido"> <div> <%=df.format(dv.getSubTotal())%> </div> </td>
                </tr>
                <%
                    }
                %>
                <tr>
                    <th colspan="4" class="TituloDV">
                <div> TOTAL (MX)  </div>
                </th>
                <th class="Contenido">
                <div> <%=df.format(Double.parseDouble(Importe))%> </div>
                </th>
                </tr>
                <tr>
                    <td colspan="5" class="FilaEnBlanco">
                        <br>
                    </td>
                </tr>
            </table>

        </form>
                <br>
        <form id="frmMostrarDatosCliente">
          
            <table id="tablaMostrarDatosCliente">
                <%
                    Usuario usu = Usuario_DB.listarUsuarioPorCodigo(CodigoCliente);
                %>
                <tr>
                <h1>¡POR FAVOR DE CONTACTAR AL CLIENTE PARA CONFIRMAR LA COMPRA!</h1>   |
                    <td class="primeraColumna">
                <dd> Fecha : </dd>
                </td>
                <td>
                <dd> <%=Fecha%> </dd>
                </td>
                </tr>
                <tr>
                    <td class="primeraColumna">
                <dd> C&oacute;digo cliente : </dd>
                </td>
                <td>
                <dd> <%=usu.getCodigoUsuario()%> </dd>
                </td>
                </tr>
                <tr>
                    <td class="primeraColumna">
                <dd> Cliente : </dd>
                </td>
                <td>
                <dd> <%=usu.getNombreUsuario()%>, <%=usu.getApellidosUsuario()%> </dd>
                </td>
                </tr>
               
                <tr>
                    <td class="primeraColumna">
                <dd> Email : </dd>
                </td>
                <td>
                <dd> <%=usu.getEmailUsuario()%> </dd>
                </td>
                </tr>
                
                    
               
                <tr>
                    <td class="primeraColumna">
                <dd> Domicilio1 : </dd>
                </td>
                <td>
                <dd> <%=usu.getDireccion1Usuario()%> </dd>
                </td>
                </tr>
                <tr>
                    <td class="primeraColumna">
                <dd> Domicilio2 : </dd>
                </td>
                <td>
                <dd> <%=usu.getDireccion2Usuario()%> </dd>
                </td>
                </tr>
                <tr>
                    <td class="primeraColumna">
                <dd> Tel&eacute;fono : </dd>
                </td>
                <td>
                <dd> <%=usu.getTelefonoUsuario()%> </dd>
                </td>
                </tr>
                <table id="tablaRegresar">
                    
            <!-----------------Send Email-------------------->
                
            <!-------------------------Finish Email----------------------->   
            <tr>
                    <td>
                        <a href="MostrarVenta.jsp" class="link" style="color:#000000">REGRESAR</a>
                        <br>
                        <a href="http://www.dhl.com.mx/es/express.html" class="link" style="color:#FFA006">PAQUETERIA</a>
                        
                    </td>
                </tr>
            </table>
            </table>
        </form>
        <footer id="main-footer">
        <p>&copy; 2020 <a>World Real Games</a></p>
        <br>
        <img src="ImagenWorldRealGames/wrg.png" width="250" height="67" scale="1.5">
    </footer> 
    </body>
</html>
