/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Conexion;
import java.sql.*;

public class Conexion {
    Connection conectar = null;
    private Statement sentenciaSQL = null;
    
    public Connection conectar(){
        try{
            Class.forName("com.mysql.jdbc.Driver");
            conectar = DriverManager.getConnection("jdbc:mysql://localhost:3306/proyecto","root","");
            sentenciaSQL = getConexion().createStatement();
        }catch (ClassNotFoundException | SQLException e){
            System.out.println("Error al conectar: "+e.getMessage());
        }
        return conectar;
    }
    public void cerrar() {
        try {
            if (getSentenciaSQL() != null) {
                getSentenciaSQL().close();
            }

            if (getConexion() != null) {
                getConexion().close();
            }
        } catch (Exception e) {
        }
    }

    public Connection getConexion() {
        return conectar;
    }

    public Statement getSentenciaSQL() {
        return sentenciaSQL;
    }
}

 