/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entidades;

import java.util.List;

/**
 *
 * @author Joseph Cano
 */
public class Memes {
    private int Id;
    private String Titulo;
    private String Imagen;
    private int Id_Usuario;
    private int Id_Tema;
    private int Likes;
    private Usuarios Usuario;
    private Temas Tema;
    private List<Comentarios> Comentarios;
    private List<Usuarios> Likes_Usuarios;

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
     * @return the Titulo
     */
    public String getTitulo() {
        return Titulo;
    }

    /**
     * @param Titulo the Titulo to set
     */
    public void setTitulo(String Titulo) {
        this.Titulo = Titulo;
    }

    /**
     * @return the Imagen
     */
    public String getImagen() {
        return Imagen;
    }

    /**
     * @param Imagen the Imagen to set
     */
    public void setImagen(String Imagen) {
        this.Imagen = Imagen;
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
     * @return the Id_Tema
     */
    public int getId_Tema() {
        return Id_Tema;
    }

    /**
     * @param Id_Tema the Id_Tema to set
     */
    public void setId_Tema(int Id_Tema) {
        this.Id_Tema = Id_Tema;
    }

    /**
     * @return the Likes
     */
    public int getLikes() {
        return Likes;
    }

    /**
     * @param Likes the Likes to set
     */
    public void setLikes(int Likes) {
        this.Likes = Likes;
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

    /**
     * @return the Tema
     */
    public Temas getTema() {
        return Tema;
    }

    /**
     * @param Tema the Tema to set
     */
    public void setTema(Temas Tema) {
        this.Tema = Tema;
    }

    /**
     * @return the Comentarios
     */
    public List<Comentarios> getComentarios() {
        return Comentarios;
    }

    /**
     * @param Comentarios the Comentarios to set
     */
    public void setComentarios(List<Comentarios> Comentarios) {
        this.Comentarios = Comentarios;
    }

    /**
     * @return the Likes_Usuarios
     */
    public List<Usuarios> getLikes_Usuarios() {
        return Likes_Usuarios;
    }

    /**
     * @param Likes_Usuarios the Likes_Usuarios to set
     */
    public void setLikes_Usuarios(List<Usuarios> Likes_Usuarios) {
        this.Likes_Usuarios = Likes_Usuarios;
    }
}
