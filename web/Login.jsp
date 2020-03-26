
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
        <script type="text/javascript" src="js/Login.js"></script>
        <link type="text/css" rel="stylesheet" href="css/login.css" />
        <title>Iniciar Sesi&oacute;n </title>
        <link rel="icon" type="image/png" href="imagen/pc.jpg"/>
        <script type="text/javascript">
            history.forward();
        </script>
        
    </head>
    
    <body>
        
        <div>
    <form class="sign-up"method="post" action="Servlet_Usu" id="frmLogin">
    <h1 class="sign-up-title" style="color: #000000">Inicia sesi&oacute;n</h1>
    <div align="center"><img src="imagen/log.png" width="45%" height="40%"></div>
    <input type="text" class="sign-up-input" name="txtUsuario" placeholder="Ingrese usuario" id="txtUsuario" class="textBox">
    <input type="password" class="sign-up-input" name="txtClave" placeholder="Ingrese contraseña" id="txtClave" class="textBox">
    <input type="submit" value="Iniciar Sesión" class="sign-up-button" name="btnIngresar" value="Ingresar" id="btnIngresar" >
    

    
        <td class="centrarBoton">
            <a href="RegistrarCliente.jsp" id="lnkRegistrarUsuario"><h4 style="color:#000;">Registrate aqu&iacute;</h4></a>
            <a href="index.jsp" class="link"> <h4 style="color:#000000">REGRESAR</h4></a>
        </td>
                   
                    
               
            <input type="hidden" name="accion" value="login">
            </form>
        </div>
    </body>
</html>




