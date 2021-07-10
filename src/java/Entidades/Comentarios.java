/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entidades;

/**
 *
 * @author Joseph Cano
 */
public class Comentarios {
    private int Id;
    private String Comentario;
    private int Id_Usuario;
    private int Id_Publicacion;
    private Usuarios Usuario;

    /**
     * @return the Id
     */
    public int getId() {
        return Id;
    }

    /**
     * @param Id the Id to set
     */
    public void setId(int Id) {
        this.Id = Id;
    }

    /**
     * @return the Comentario
     */
    public String getComentario() {
        return Comentario;
    }

    /**
     * @param Comentario the Comentario to set
     */
    public void setComentario(String Comentario) {
        this.Comentario = Comentario;
    }

    /**
     * @return the Id_Usuario
     */
    public int getId_Usuario() {
        return Id_Usuario;
    }

    /**
     * @param Id_Usuario the Id_Usuario to set
     */
    public void setId_Usuario(int Id_Usuario) {
        this.Id_Usuario = Id_Usuario;
    }

    /**
     * @return the Id_Publicacion
     */
    public int getId_Publicacion() {
        return Id_Publicacion;
    }

    /**
     * @param Id_Publicacion the Id_Publicacion to set
     */
    public void setId_Publicacion(int Id_Publicacion) {
        this.Id_Publicacion = Id_Publicacion;
    }

    /**
     * @return the Usuario
     */
    public Usuarios getUsuario() {
        return Usuario;
    }

    /**
     * @param Usuario the Usuario to set
     */
    public void setUsuario(Usuarios Usuario) {
        this.Usuario = Usuario;
    }
}
