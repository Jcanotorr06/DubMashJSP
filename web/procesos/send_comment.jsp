<%@page import="Entidades.Comentarios" %>
<%@page import="Procesos.ProcesosComentarios" %>

<%
    String contenido = request.getParameter("comentario");
    String idMeme = request.getParameter("idMeme");
    String idSes = session.getAttribute("Id").toString();
    
    Comentarios comentario = new Comentarios();
    ProcesosComentarios comentariosdb = new ProcesosComentarios();
    
    comentario.setComentario(contenido);
    comentario.setId_Publicacion(Integer.parseInt(idMeme));
    comentario.setId_Usuario(Integer.parseInt(idSes));
    
    comentariosdb.CrearComentario(comentario);
    
    response.sendRedirect(request.getHeader("Referer"));
%>
