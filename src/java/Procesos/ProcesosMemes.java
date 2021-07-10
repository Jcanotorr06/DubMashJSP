/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Procesos;

import Entidades.Memes;
import Entidades.Temas;
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
public class ProcesosMemes {
    Connection _cn;
    
    public ProcesosMemes(){
        _cn = new Conexion().OpenDb();
    };
    
    public int SubirMeme(Memes meme){
        try{
            Statement smtm = _cn.createStatement();
            String query = "INSERT INTO publicacion (Titulo, Imagen, Id_Usuario, Id_Tema) VALUES('"+meme.getTitulo()+"','"+meme.getImagen()+"','"+meme.getId_Usuario()+"','"+meme.getId_Tema()+"');";
            
            int resultado = smtm.executeUpdate(query);
            smtm.close();
            return resultado;
        }
        catch(SQLException e){
            System.out.println(e);
            return 0;
        }
    };
    
    public List<Memes> BuscarMemesUsuario(int Usuario_Id, String Usuario){
        try{
            Statement smtm = _cn.createStatement();
            String query = "CALL BuscarMemesUsuario('"+Usuario_Id+"')";
            
            List<Memes> memes = new ArrayList<>();
            ProcesosUsuarios usuariosdb = new ProcesosUsuarios();
            ProcesosTemas temasdb = new ProcesosTemas();
            ProcesosComentarios comentariosdb = new ProcesosComentarios();
            
            ResultSet result = smtm.executeQuery(query);
            while(result.next()){
                Memes meme = new Memes();
                meme.setId(result.getInt("Id"));
                meme.setTitulo(result.getString("Titulo"));
                meme.setImagen(result.getString("Imagen"));
                meme.setId_Usuario(result.getInt("Id_Usuario"));
                meme.setId_Tema(result.getInt("Id_Tema"));
                meme.setUsuario(usuariosdb.BuscarPerfil(Usuario));
                meme.setTema(temasdb.BuscarTema(result.getInt("Id_Tema")));
                meme.setComentarios(comentariosdb.BuscarComentarios(meme.getId()));
                meme.setLikes_Usuarios(usuariosdb.BuscarUsuariosLike(meme.getId()));
                meme.setLikes(meme.getLikes_Usuarios().size());
                
                
                memes.add(meme);
            }
            return memes;
        }
        catch(SQLException e){
            System.out.println(e);
            return null;
        }
    }
    
   public List<Memes> BuscarMemesUsuariosSeguidos(String sesId){
        try{
            Statement smtm = _cn.createStatement();
            
            List<Memes> memes = new ArrayList();
            ProcesosComentarios comentariosdb = new ProcesosComentarios();
            ProcesosUsuarios usuariosdb = new ProcesosUsuarios();
            
            String query = "CALL BuscarMemesUsuariosSeguidos('"+sesId+"')";
            ResultSet result = smtm.executeQuery(query);
            
            while(result.next()){
                Usuarios usuario = new Usuarios();
                usuario.setId(result.getInt("Id_Usuario"));
                usuario.setColor(result.getString("Color"));
                usuario.setUsuario(result.getString("Usuario"));
                usuario.setImagen(result.getString("Imagen_Usuario"));
                
                Temas tema = new Temas();
                tema.setId(result.getInt("Id_Tema"));
                tema.setNombre(result.getString("Nombre_Tema"));
                
                Memes meme = new Memes();
                meme.setId(result.getInt("Id"));
                meme.setTitulo(result.getString("Titulo"));
                meme.setImagen(result.getString("Imagen"));
                meme.setId_Tema(tema.getId());
                meme.setId_Usuario(usuario.getId());
                meme.setUsuario(usuario);
                meme.setTema(tema);
                meme.setComentarios(comentariosdb.BuscarComentarios(meme.getId()));
                meme.setLikes_Usuarios(usuariosdb.BuscarUsuariosLike(meme.getId()));
                meme.setLikes(meme.getLikes_Usuarios().size());
                
                memes.add(meme);
            }
            
            return memes;
        }
        catch(SQLException e){
            System.out.println(e);
            return null;
        }
    }
   
    public int LikeMeme(String sesId, String memeId){
        try{
            Statement smtm = _cn.createStatement();
            String query = "INSERT INTO likes VALUES ('"+sesId+"','"+memeId+"');";
            
            int res = smtm.executeUpdate(query);
            
            return res;
        }
        catch(SQLException e){
            System.out.println(e);
            return 0;
        }
    }
    
    public boolean ValidarLike(String sesId, List<Usuarios> usuarios){
        try{
            for(Usuarios usuario:usuarios){
                if(usuario.getId() == Integer.parseInt(sesId)){
                    return true;
                }
            }
            return false;
        }
        catch(Exception e){
            return false;
        }
    }
}
