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
public class Usuarios {
    private int Id;
    private String Nombre;
    private String Usuario;
    private String Email;
    private String Contraseña;
    private String Nacimiento;
    private String Color;
    private String Imagen;
    private int Seguidores;
    private int Seguidos;
    private int Publicaciones;

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
     * @return the Usuario
     */
    public String getUsuario() {
        return Usuario;
    }

    /**
     * @param Usuario the Usuario to set
     */
    public void setUsuario(String Usuario) {
        this.Usuario = Usuario;
    }

    /**
     * @return the Email
     */
    public String getEmail() {
        return Email;
    }

    /**
     * @param Email the Email to set
     */
    public void setEmail(String Email) {
        this.Email = Email;
    }

    /**
     * @return the Contraseña
     */
    public String getContraseña() {
        return Contraseña;
    }

    /**
     * @param Contraseña the Contraseña to set
     */
    public void setContraseña(String Contraseña) {
        this.Contraseña = Contraseña;
    }

    /**
     * @return the Color
     */
    public String getColor() {
        return Color;
    }

    /**
     * @param Color the Color to set
     */
    public void setColor(String Color) {
        this.Color = Color;
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
     * @return the Seguidores
     */
    public int getSeguidores() {
        return Seguidores;
    }

    /**
     * @param Seguidores the Seguidores to set
     */
    public void setSeguidores(int Seguidores) {
        this.Seguidores = Seguidores;
    }

    /**
     * @return the Seguidos
     */
    public int getSeguidos() {
        return Seguidos;
    }

    /**
     * @param Seguidos the Seguidos to set
     */
    public void setSeguidos(int Seguidos) {
        this.Seguidos = Seguidos;
    }

    /**
     * @return the Publicaciones
     */
    public int getPublicaciones() {
        return Publicaciones;
    }

    /**
     * @param Publicaciones the Publicaciones to set
     */
    public void setPublicaciones(int Publicaciones) {
        this.Publicaciones = Publicaciones;
    }

    /**
     * @return the Nacimiento
     */
    public String getNacimiento() {
        return Nacimiento;
    }

    /**
     * @param Nacimiento the Nacimiento to set
     */
    public void setNacimiento(String Nacimiento) {
        this.Nacimiento = Nacimiento;
    }
}
