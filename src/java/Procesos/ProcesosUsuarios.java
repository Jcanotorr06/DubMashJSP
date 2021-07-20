/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Procesos;

import Entidades.Usuarios;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.SQLException;
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
    
    public int CrearUsuario(Usuarios usuario){ /*INSERTA UN USUARIO EN LA BASE DE DATOS SIEMPRE Y CUANDO EL NOMBRE DE USUARIO O EMAIL NO ESTEN EN USO*/
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
        catch(SQLException e){
            System.out.println(e);
            resultado = 2;
        }
        return resultado;
    };
    
    public Usuarios ValidarInicio(Usuarios usuario){/*VALIDA EL INICIO DE SESION*/
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
    
    public Usuarios BuscarPerfil(String usuario){/*REGRESA LA INFORMACION DE PERFIL DE UN USUARIO POR SU USERNAME*/
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
    
    public Usuarios BuscarPerfilId(int Id_usuario){/*REGRSA LA INFORMACION DE UN USUARIO POR SU ID*/
        try{
            Statement smtm = _cn.createStatement();
            
            String query = "Call BuscarPerfilId('"+Id_usuario+"')";
            
            ResultSet result = smtm.executeQuery(query);
            while(result.next()){
                Usuarios respuesta = new Usuarios();
                respuesta.setId(result.getInt("Id"));
                respuesta.setNombre(result.getString("Nombre"));
                respuesta.setUsuario(result.getString("Usuario"));
                respuesta.setColor(result.getString("Color"));
                respuesta.setImagen(result.getString("Imagen"));
                
                return respuesta;
            }
        }
        catch(SQLException e){
            System.out.println(e);
            return null;
        }
        return null;
    };
    
    public List<Usuarios> BuscarUsuariosSugeridos(String sesId){/*LISTA HASTA 5 USUARIOS QUE NO ESTAN SEGUIDOS POR EL USUARIO EN SESION*/
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
    
    public int SeguirUsuario(String Id_Usuario_ses, String Id_Usuario_seg){/*SIGUE A UN USUARIO*/
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
    
    public int DejarSeguirUsuario(String Id_Usuario_ses, String Id_Usuario_seg){/*PERMITE AL USUARIO EN SESION DEJAR DE SEGUIR A OTRO USUARIO*/
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
    
    public boolean ValidarUsuarioSeguido(String Id_Usuario_ses, String Id_Usuario_seg){/*VALIDA SI EL USUARIO EN SESION SE ENCUENTRA ENTRE LOS SEGUIDORES DE OTRO USUARIO*/
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
    
    public String BuscarNombreUsuario(int Id){/*REGRESA EL NOMBRE DE UN USUARIO POR SU ID*/
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
    
    
    
 
    
    public int EditarPerfil(String sesId, String Color, String Imagen){/*ACTUALIZA LA IMAGEN Y EL COLOR DE PERFIL DEL USUARIO EN SESION*/
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
    
    public List<Usuarios> BuscarUsuariosLike(int memeId){/*REGRESA UNA LISTA DE USUARIOS QUE HAN DADO LIKE A UN MEME*/
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
    
    public List<String>BuscarTodosUsuarios(){ /*REGRESA UNA LISTA CON TODOS LOS USUARIOS EN LA BASE DE DATOS*/
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
