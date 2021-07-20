<%@page import="Entidades.Usuarios" %>
<%@page import="Procesos.ProcesosUsuarios" %>

<%
    try{
        String nombre = request.getParameter("nombre");
        String nombre_usuario = request.getParameter("usuario");
        String email = request.getParameter("email");
        String contraseña = request.getParameter("contra");
        String nacimiento = request.getParameter("nacimiento");
        
        Usuarios usuario = new Usuarios();
        usuario.setNombre(nombre);
        usuario.setUsuario(nombre_usuario);
        usuario.setEmail(email);
        usuario.setContraseña(contraseña);
        usuario.setNacimiento(nacimiento);
        
        ProcesosUsuarios usuariosdb = new ProcesosUsuarios();
        
        int res = usuariosdb.CrearUsuario(usuario);
        response.sendRedirect("../index.jsp?res="+res);
        return;
    }
    catch(Exception e){
        response.sendRedirect("../index.jsp?res=3");
    }
    
%>