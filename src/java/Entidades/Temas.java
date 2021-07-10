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
public class Temas {
    private int Id;
    private String Nombre;
    private String URL_Imagen;
    private boolean Seguido;

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
     * @return the Nombre
     */
    public String getNombre() {
        return Nombre;
    }

    /**
     * @param Nombre the Nombre to set
     */
    public void setNombre(String Nombre) {
        this.Nombre = Nombre;
    }

    /**
     * @return the URL_Imagen
     */
    public String getURL_Imagen() {
        return URL_Imagen;
    }

    /**
     * @param URL_Imagen the URL_Imagen to set
     */
    public void setURL_Imagen(String URL_Imagen) {
        this.URL_Imagen = URL_Imagen;
    }

    /**
     * @return the Seguido
     */
    public boolean isSeguido() {
        return Seguido;
    }

    /**
     * @param Seguido the Seguido to set
     */
    public void setSeguido(boolean Seguido) {
        this.Seguido = Seguido;
    }
}
