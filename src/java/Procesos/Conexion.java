/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Procesos;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Joseph Cano
 */
public class Conexion {
    public Connection OpenDb(){
        try{
            Class.forName("org.mariadb.jdbc.Driver");
            return DriverManager.getConnection("jdbc:mariadb://127.0.0.1:3306/dubmash", "root", "password");
        }
        catch(ClassNotFoundException cnfe){
            System.out.println("Error en la libreria mariadb");
        }
        catch(SQLException se){
            System.out.println("Error al conectarse a la db");
        }
        return null;
    }
}

