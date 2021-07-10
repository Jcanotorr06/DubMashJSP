<%@page import="Entidades.Usuarios" %>
<%@page import="Procesos.ProcesosUsuarios" %>

<% 
    try{
    String qUsuario = request.getParameter("usu");
    String qContraseña = request.getParameter("contra");
    
    Usuarios usuario = new Usuarios();
    usuario.setUsuario(qUsuario);
    usuario.setContraseña(qContraseña);
    
    ProcesosUsuarios usuariodb = new ProcesosUsuarios();
    
    Usuarios respuesta = usuariodb.ValidarInicio(usuario);
    
    if(respuesta != null){
        session.setMaxInactiveInterval(3600);
        session.setAttribute("Id", respuesta.getId());
        session.setAttribute("Nombre", respuesta.getNombre());
        session.setAttribute("Usuario", respuesta.getUsuario());
        session.setAttribute("Color", respuesta.getColor());
        session.setAttribute("Imagen", respuesta.getImagen());
        
        response.sendRedirect("../feed.jsp");
    }else{
        response.sendRedirect("../index.jsp?res=3");
    }
    
    }
    catch(Exception e){
        response.sendRedirect("../index.jsp?res=2");
    }
%>