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
        <link rel="icon" type="image/png" href="imagen/bra.png"/>

        <title>PDF</title>
         <script type="text/javascript">
            history.forward();
        </script>

    </head>

    <body>
        <header id="main-header">

            <a id="logo-header" href="#">
                <span class="site-name">Lencer&iacute;a y Fajas Colombianas</span>
                <span class="site-desc">Siempre con la calidad de nuestros productos</span>
            </a> <!-- / #logo-header -->

            <nav>
                <ul>
                    <li><a href="Catalogo.jsp" class="link" id="lnkLogin">Inicio</a></li>
                    
                </ul>
            </nav><!-- / nav -->

        </header><!-- / #main-header -->
        
        <section id="main-content">
            <article>
                <header>
                    <center><h2 style="color:#000000">BIENVENIDO A LENCERÍA Y FAJAS COLOMBIANAS</h2></center>
                </header>

                <div id="inicio">

                    <table width="100%" border="1">
                        <tr>
                            <td width="20%">

                                <input type="radio" id="o3" name="opcion" value="" onclick="buscaOpcion('3')">CATALOGO "VEDETTE 2020"<br>

                            </td>
                        <br>
                        <td>
                        <td width="20%">

                            <input type="radio" id="o3" name="opcion" value="" onclick="buscaOpcion('4')">CATALOGO "Cata1og MX"<br>

                        </td>

                        <td>
                            <div id="detalle"></div>
                        </td>
                        </tr>
                    </table>
                </div>

                <form action="#" method="post" id="frmCabecera">

                    <input type="hidden" name="accion" value="logout">
                </form>
                </div>

            </article> <!-- /article -->

        </section> <!-- / #main-content -->
        <footer id="main-footer">
            <p>&copy; 2016 <a href="https://lenceriayfajascolombianas.com.mx">Lencer&iacute;a y Fajas Colombianas</a></p>
            <br>
            <img src="imagen/logo.jpg" width="173" height="67" scale="1.5">
        </footer> <!-- / #main-footer -->

</body>
</html>