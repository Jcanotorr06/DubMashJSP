/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Procesos;

import Entidades.Temas;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
/**
 *
 * @author Joseph Cano
 */
public class ProcesosTemas {
    
    Connection _cn;
    
    public ProcesosTemas(){
        _cn = new Conexion().OpenDb();
    };
    
    public List<Temas> BuscarTemasSugeridos(String sesId){
        try{
            Statement smtm = _cn.createStatement();
            
            String query = "CALL BuscarTemasSugeridos('"+sesId+"')";
            
            List<Temas> sugeridos = new ArrayList<>();
            
            ResultSet result = smtm.executeQuery(query);
            
            while(result.next()){
                Temas tema = new Temas();
                tema.setId(result.getInt("Id"));
                tema.setNombre(result.getString("Nombre"));
                tema.setURL_Imagen(result.getString("URL_Imagen"));
                
                sugeridos.add(tema);
            }
            
            return sugeridos;
        }
        catch(Exception e){
            return null;
        }
    };
    
    public List<Temas> ListarTemas(){
        try{
            Statement smtm = _cn.createStatement();
            
            List<Temas> temas = new ArrayList<>();
            
            ResultSet result = smtm.executeQuery("SELECT * FROM tema");
            
            while(result.next()){
                Temas tema = new Temas();
                tema.setId(result.getInt("Id"));
                tema.setNombre(result.getString("Nombre"));
                tema.setURL_Imagen(result.getString("URL_Imagen"));
                
                temas.add(tema);
            }
            
            return temas;
            
        }
        catch(Exception e){
            return null;
        }
    }
    
    public int SeguirTema(String Id_Usuario, String Id_Tema){
        try{
            Statement smtm = _cn.createStatement();
            String query = "CALL SeguirTema('"+Id_Usuario+"','"+Id_Tema+"')";
            
            int res = smtm.executeUpdate(query);
            return res;
            
        }
        catch(Exception e){
            return 0;
        }
    };
    
    public int DejarSeguirTema(String Id_Usuario, String Id_Tema){
        try{
            Statement smtm = _cn.createStatement();
            String query = "CALL DejarSeguirTema('"+Id_Usuario+"','"+Id_Tema+"')";
            
            int res = smtm.executeUpdate(query);
            System.out.println(res);
            return res;
        }
        catch(SQLException e){
            System.out.println(e);
            return 754;
        }
    }
    
    public boolean ValidarTemaSeguido(String Id_Usuario, int Id_Tema){
        try{
            Statement smtm = _cn.createStatement();
            String query = "CALL ValidarTemaSeguido('"+Id_Usuario+"','"+Id_Tema+"')";
            
            ResultSet res = smtm.executeQuery(query);
            
            while(res.next()){
                int count = res.getInt("rowcount");
                return count == 1;
            }
        }
        catch(SQLException e){
            return false;
        }
        return false;
    }
    
    public String BuscarNombreTema(int Id){
        try{
            Statement smtm = _cn.createStatement();
            
            String res="";
            String query = "SELECT Nombre FROM tema WHERE Id='"+Id+"';";
            ResultSet result = smtm.executeQuery(query);
            
            while(result.next()){
                 res = result.getString("Nombre");
                return res;
            }
            
            return res;
        }
        catch(Exception e){
            return "";
        }
    };
    
    public Temas BuscarTema(int Id){
        try{
            Statement smtm = _cn.createStatement();
            
            String query = "SELECT * FROM tema WHERE Id='"+Id+"';";
            ResultSet result = smtm.executeQuery(query);
            Temas tema = new Temas();
            while(result.next()){
               tema.setId(result.getInt("Id"));
               tema.setNombre(result.getString("Nombre"));
               
               return tema;
            }
            return tema;
        }
        catch(Exception e){
            return null;
        }
    }
}
