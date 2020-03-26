$(document).ready(function (){
    limpiarCampos();
    
    $('#btnRegistrar').click(function (){
        validarDatos();
    });
    
    $('#btnCancelar').click(function (){
        history.back();
    });
    
    $('#SelectDepartamento').change(function (){
        $('#text_depart').val("1");
        $.pos
        $.post("cbProvincia.jsp","#frmDepartamento".serialize(),function(data){
            $('#SelectProvincia').html(data);
        });
    });
});

function limpiarCampos(){
    $('.textBox').val("");
}

function validarDatos(){
    var nombre = $('#txtNombre').val();
    var apellido = $('#txtApellido').val();
    var dni = $('#txtDni').val();
    var email = $('#txtEmail').val();
    var email2 = $('#txtConfirEmail').val();
    var departamento = $('#txtDepartamento').val();
    var provincia = $('#txtProvincia').val();
    var distrito = $('#txtDistrito').val();
    var direccion1 = $('#txtDireccion1').val();
    var direccion2 = $('#txtDireccion2').val();
    var telefono = $('#txtTelefono').val();
    var usuario = $('#txtUsuario').val();
    var pass1 = $('#txtClave').val();
    var pass2 = $('#txtConfirClave').val();
    
    if(nombre == ""){
        alert("El campo nombre no puede estar vacío");
        $('#txtNombre').focus();
    }
    else if(apellido == ""){
        alert("El campo apellido no puede estar vacío");
        $('#txtApellido').focus();
    }
    else if(dni == ""){
        alert("El campo dni no puede estar vacío");
        $('#txtDni').focus();
    }
    else if(email == ""){
        alert("El campo email no puede estar vacío");
        $('#txtEmail').focus();
    }
    else if(email2 == ""){
        alert("El campo confirmar email no puede estar vacío");
        $('#txtConfirEmail').focus();
    }
    else if(departamento == ""){
        alert("El campo departamento no puede estar vacío");
        $('#txtDepartamento').focus();
    }
    else if(provincia == ""){
        alert("El campo provincia no puede estar vacío");
        $('#txtProvincia').focus();
    }
    else if(distrito == ""){
        alert("El campo distrito no puede estar vacío");
        $('#txtDistrito').focus();
    }
    else if(direccion1 == ""){
        alert("El campo dirección1 no puede estar vacío");
        $('#txtDireccion1').focus();
    }
    else if(telefono == ""){
        alert("El campo teléfono no puede estar vacío");
        $('#txtTelefono').focus();
    }
    else if(usuario == ""){
        alert("El campo usuario no puede estar vacío");
        $('#txtUsuario').focus();
    }
    else if(pass1 == ""){
        alert("El campo clave no puede estar vacío");
        $('#txtClave').focus();
    }
    else if(pass2 == ""){
        alert("El campo confirmar clave no puede estar vacío");
        $('#txtConfirClave').focus();
    }
    else{
        if(email != email2){
            alert("Los correos electrónicos no son iguales");
        }
        else if(pass1 != pass2){
            alert("Las contraseñas no son iguales");
        }
        else{
            $('#frmRegistrarUsuario').submit();
        }
        
    }
}