/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Procesos;

import Entidades.Comentarios;
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
public class ProcesosComentarios {
    Connection _cn;
    
    public ProcesosComentarios(){
        _cn = new Conexion().OpenDb();
    };
    
    public int CrearComentario(Comentarios Comentario){//PERMITE AL USUARIO EN SESION CREAR UN COMENTARIO PARA UN MEME
        try{
            Statement smtm = _cn.createStatement();
            String query = "INSERT INTO comentario(Comentario, Id_Usuario, Id_Meme) VALUES ('"+Comentario.getComentario()+"','"+Comentario.getId_Usuario()+"','"+Comentario.getId_Publicacion()+"')";
        
            int res = smtm.executeUpdate(query);
            return res;
        }
        catch(SQLException e){
            System.out.println(e);
            return 0;
        }
    }
    
    public List<Comentarios> BuscarComentarios(int Id_Meme){//LISTA TODOS LOS COMENTARIOS DE UN MEME
        try{
            Statement smtm = _cn.createStatement();
            
            String query = "SELECT * FROM comentario WHERE Id_Meme='"+Id_Meme+"' ORDER BY Id_Meme;";
            ResultSet result = smtm.executeQuery(query);
            
            ProcesosUsuarios usuariosdb = new ProcesosUsuarios();
            List<Comentarios> Comentarios = new ArrayList<>();
            
            while(result.next()){
                Comentarios comentario = new Comentarios();
                comentario.setComentario(result.getString("Comentario"));
                comentario.setId(result.getInt("Id"));
                comentario.setId_Publicacion(Id_Meme);
                comentario.setId_Usuario(result.getInt("Id_Usuario"));
                comentario.setUsuario(usuariosdb.BuscarPerfil(usuariosdb.BuscarNombreUsuario(result.getInt("Id_Usuario"))));
                
                Comentarios.add(comentario);
            }
            
            return Comentarios;
        }
        catch(SQLException e){
            return null;
        }
    }
}
