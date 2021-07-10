/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Procesos;

import Entidades.Usuarios;
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
public class ProcesosUsuarios {
    
    Connection _cn;
    
    public ProcesosUsuarios(){
        _cn = new Conexion().OpenDb();
    };
    
    public int CrearUsuario(Usuarios usuario){
        int resultado;
        try{
            Statement smtm = _cn.createStatement();
            
            String check = "SELECT COUNT(*) AS rowcount FROM usuario WHERE Usuario='"+usuario.getUsuario()+"' OR Email='"+usuario.getEmail()+"'";
            ResultSet r = smtm.executeQuery(check);
            while(r.next()){
                int count = r.getInt("rowcount");
                if(count > 0){
                    resultado = 1;
                    return resultado;
                }
            }
            
            String query = "INSERT INTO usuario (Nombre, Usuario, Email, Contraseña, Nacimiento) VALUES('"+usuario.getNombre()+"','"+usuario.getUsuario()+"','"+usuario.getEmail()+"','"+usuario.getContraseña()+"','"+usuario.getNacimiento()+"')";
            
            resultado = smtm.executeUpdate(query);
            smtm.close();
            resultado = 0;
            return resultado;
        }
        catch(Exception e){
            resultado = 2;
        }
        return resultado;
    };
    
    public Usuarios ValidarInicio(Usuarios usuario){
        try{
            Statement smtm = _cn.createStatement();
            
            String query = "Call ValidarInicio('"+usuario.getUsuario()+"','"+usuario.getContraseña()+"')";
            
            ResultSet result = smtm.executeQuery(query);
            while(result.next()){
                Usuarios respuesta = new Usuarios();
                respuesta.setId(result.getInt("Id"));
                respuesta.setNombre(result.getString("Nombre"));
                respuesta.setUsuario(result.getString("Usuario"));
                respuesta.setEmail(result.getString("Email"));
                respuesta.setContraseña(result.getString("Contraseña"));
                respuesta.setNacimiento(result.getString("Nacimiento"));
                respuesta.setColor(result.getString("Color"));
                respuesta.setImagen(result.getString("Imagen"));
                
                return respuesta;
            }
        }
        catch(Exception e){
            return null;
        }
        return null;
    };
    
    public Usuarios BuscarPerfil(String usuario){
        try{
            Statement smtm = _cn.createStatement();
            
            String query = "Call BuscarPerfil('"+usuario+"')";
            
            ResultSet result = smtm.executeQuery(query);
            while(result.next()){
                Usuarios respuesta = new Usuarios();
                respuesta.setId(result.getInt("Id"));
                respuesta.setNombre(result.getString("Nombre"));
                respuesta.setUsuario(result.getString("Usuario"));
                respuesta.setColor(result.getString("Color"));
                respuesta.setImagen(result.getString("Imagen"));
                respuesta.setSeguidores(result.getInt("Seguidores"));
                respuesta.setSeguidos(result.getInt("Seguidos"));
                respuesta.setPublicaciones(result.getInt("Publicaciones"));
                
                return respuesta;
            }
        }
        catch(Exception e){
            return null;
        }
        return null;
    };
    
    public List<Usuarios> BuscarUsuariosSugeridos(String sesId){
        try{
            Statement smtm = _cn.createStatement();
            
            String query = "CALL BuscarUsuariosSugeridos('"+sesId+"')";
            
            List<Usuarios> sugeridos = new ArrayList<>();
            
            ResultSet result = smtm.executeQuery(query);
            
            while(result.next()){
                Usuarios usuario = new Usuarios();
                usuario.setId(result.getInt("Id"));
                usuario.setUsuario(result.getString("Usuario"));
                usuario.setColor(result.getString("Color"));
                usuario.setImagen(result.getString("Imagen"));
                
                sugeridos.add(usuario);
            }
            
            return sugeridos;
        }
        catch(Exception e){
            return null;
        }
    };
    
    public int SeguirUsuario(String Id_Usuario_ses, String Id_Usuario_seg){
        try{
            Statement smtm = _cn.createStatement();
            
            String query = "CALL SeguirUsuario('"+Id_Usuario_ses+"','"+Id_Usuario_seg+"')";
            
            int res = smtm.executeUpdate(query);
            smtm.close();
            
            return res;
        }
        catch(Exception e){
            return 0;
        }
    };
    
    public int DejarSeguirUsuario(String Id_Usuario_ses, String Id_Usuario_seg){
        try{
            Statement smtm = _cn.createStatement();
            
            String query = "CALL DejarSeguirUsuario('"+Id_Usuario_ses+"','"+Id_Usuario_seg+"')";
            
            int res = smtm.executeUpdate(query);
            smtm.close();
            return res;
        }
        catch(Exception e){
            return 0;
        }
    };
    
    public boolean ValidarUsuarioSeguido(String Id_Usuario_ses, String Id_Usuario_seg){
        try{
            Statement smtm = _cn.createStatement();
            
            String query = "Call ValidarUsuarioSeguido('"+Id_Usuario_ses+"','"+Id_Usuario_seg+"')";
            ResultSet r = smtm.executeQuery(query);
            
            while(r.next()){
                int count = r.getInt("rowcount");   
                return count > 0;
            }            
        }
        catch(Exception e){
            return false;
        }
        return false;
    };
    
    public String BuscarNombreUsuario(int Id){
        try{
            Statement smtm = _cn.createStatement();
            
            String res="";
            String query = "SELECT Usuario FROM usuario WHERE Id='"+Id+"';";
            ResultSet result = smtm.executeQuery(query);
            
            while(result.next()){
                 res = result.getString("Usuario");
                return res;
            }
            
            return res;
        }
        catch(Exception e){
            return "";
        }
    }
    
    public String BuscarColorUsuario(int Id){
        try{
            Statement smtm = _cn.createStatement();
            
            String res="";
            String query = "SELECT Color FROM usuario WHERE Id='"+Id+"';";
            ResultSet result = smtm.executeQuery(query);
            
            while(result.next()){
                 res = result.getString("Color");
                return res;
            }
            
            return res;
        }
        catch(Exception e){
            return "";
        }
    }
    
    public String BuscarImagenUsuario(int Id){
        try{
            Statement smtm = _cn.createStatement();
            
            String res="";
            String query = "SELECT Imagen FROM usuario WHERE Id='"+Id+"';";
            ResultSet result = smtm.executeQuery(query);
            
            while(result.next()){
                 res = result.getString("Imagen");
                return res;
            }
            
            return res;
        }
        catch(Exception e){
            return "";
        }
    }
    
    public int EditarPerfil(String sesId, String Color, String Imagen){
        try{
            Statement smtm = _cn.createStatement();
            
            String query = "CALL EditarPerfil('"+sesId+"','"+Color+"','"+Imagen+"')";
            
            int res = smtm.executeUpdate(query);
            smtm.close();
            return res;
        }
        catch(Exception e){
            return 0;
        }
    };
    
    public List<Usuarios> BuscarUsuariosLike(int memeId){
        try{
            List<Usuarios> likes = new ArrayList<>();
            Statement smtm = _cn.createStatement();
            
            String query = "SELECT * FROM likes WHERE Id_Meme='"+memeId+"';";
            
            ResultSet result = smtm.executeQuery(query);
            
            while(result.next()){
                Usuarios usuario = new Usuarios();
                usuario.setId(result.getInt("Id_Usuario"));
                
                likes.add(usuario);
            }
            
            return likes;
        }
        catch(SQLException e){
            System.out.println(e);
            return null;
        }
    }
    
    public List<String>BuscarTodosUsuarios(){
        try{
            Statement smtm = _cn.createStatement();
            
            ResultSet result = smtm.executeQuery("SELECT * FROM usuario");
            List<String> usuarios = new ArrayList();
            
            while(result.next()){
                usuarios.add(result.getString("Usuario"));
            }
            
            return usuarios;
        }
        catch(Exception e){
            return null;
        }
    }
}
