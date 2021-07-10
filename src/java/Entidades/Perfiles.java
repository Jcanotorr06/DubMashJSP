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
public class Perfiles {
    private Usuarios usuario;
    private List<Memes> memes;
    private int publicaciones;

    /**
     * @return the usuario
     */
    public Usuarios getUsuario() {
        return usuario;
    }

    /**
     * @param usuario the usuario to set
     */
    public void setUsuario(Usuarios usuario) {
        this.usuario = usuario;
    }

    /**
     * @return the memes
     */
    public List<Memes> getMemes() {
        return memes;
    }

    /**
     * @param memes the memes to set
     */
    public void setMemes(List<Memes> memes) {
        this.memes = memes;
    }


    /**
     * @return the publicaciones
     */
    public int getPublicaciones() {
        return publicaciones;
    }

    /**
     * @param publicaciones the publicaciones to set
     */
    public void setPublicaciones(int publicaciones) {
        this.publicaciones = publicaciones;
    }
}
