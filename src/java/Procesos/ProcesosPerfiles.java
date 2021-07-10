/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Procesos;

import java.sql.Connection;
import Entidades.Perfiles;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Joseph Cano
 */
public class ProcesosPerfiles {
    Connection _cn;
    
    public ProcesosPerfiles(){
        _cn = new Conexion().OpenDb();
    };
    
    public Perfiles BuscarPerfil(String Usuario){
        try{
            Perfiles perfil = new Perfiles();
            ProcesosUsuarios usuariosdb = new ProcesosUsuarios();
            ProcesosMemes memesdb = new ProcesosMemes();
            perfil.setUsuario(usuariosdb.BuscarPerfil(Usuario));
            perfil.setMemes(memesdb.BuscarMemesUsuario(perfil.getUsuario().getId(), perfil.getUsuario().getUsuario()));
            perfil.setPublicaciones(perfil.getMemes().size());
            return perfil;
        }
        catch(Exception e){
            return null;
        }
    }
}
