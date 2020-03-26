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
        <link type="text/css" rel="stylesheet" href="css/slider.css" />
        
        <link rel="icon" type="image/png" href="imagen/pc.jpg"/>
        <title>Inicio de la página</title>
         <script type="text/javascript">
            history.forward();
        </script>
    </head>

    <body onload="cargar()">
        <header id="main-header">

            <a id="logo-header" href="#">
                <span class="site-name">World Real Games</span>
                <span class="site-desc">Productos / De calidad / Originales</span>
            </a> <!-- / #logo-header -->
            <%
                String codigo = (String) session.getAttribute("parametroCodigo");

                Usuario usu = Usuario_DB.listarUsuarioPorCodigo(codigo);
                String cliente = usu.getNombreUsuario() + ", " + usu.getApellidosUsuario();
            %>
            <nav>
                <ul>
                    <li> <a href="Login.jsp" class="link" id="lnkLogin">Iniciar Sesi&oacute;n</a></li>
                    
                    <li><a href="quienes.jsp" class="link">Contactanos</a></li>

                </ul>
            </nav><!-- / nav -->

        </header><!-- / #main-header -->

        

        <article>
            <!-- agregamos la clase Slider para el slider de la página -->
            <div class="slider">
                <ul>
                    <li>
                        <div align="center"><img src="imagen/img 1.jpg" alt=""></div>
                    </li>
                    <li>
                        <div align="center"><img src="imagen/img 3.png" alt=""></div>
                    </li>
                    <li>
                        <div align="center"><img src="imagen/img 2.jpg" alt=""></div>
                    </li>
                    <li>
                        <div align="center"> <img src="imagen/img (3).jpg" alt=""></div>
                    </li>
                </ul>
            </div>        
            <h1>YA LLEGARON LAS PROMOCIONES DE VERANO, PARA MÁS INFORMACIÓN INICIA SESIÓN</h1>
             <h1>REGISTRATE PARA MÁS BENEFICIOS.</h1>
            <br>
            <br>
 <!--Fin de la etiqueta del Slider-->
            <div class="section">
                <img class="materialboxed" width="25%" height="auto" src="ImagenWorldRealGames/Alienware-Aurora-R5.png">
                
                <img class="materialboxed" width="25%" height="auto" src="imagen/img (4).png" alt=""/>
                <img class="materialboxed" width="25%" height="auto" src="imagen/img(5).png" alt=""/>
                <img class="materialboxed" width="23%" height="auto" src="imagen/img(6).png" alt=""/>
            </div>
           

            <form action="#" method="post" id="frmCabecera">

                <input type="hidden" name="accion" value="logout">
            </form>
        </div>

    </article> <!-- /article -->


    <footer id="main-footer">
        <p>&copy; 2020 <a>World Real Games</a></p>
        <br>
        <img src="ImagenWorldRealGames/wrg.png" width="250" height="67" scale="1.5">
    </footer> 

</body>
</html>