<%@page import="Entidades.Memes" %>
<%@page import="Procesos.ProcesosMemes" %>

<%
    try{
        String Id = session.getAttribute("Id").toString();
        int sesId = Integer.parseInt(Id);
        String titulo = request.getParameter("titulo");
        String imagen = request.getParameter("imagen");
        int temaId = Integer.parseInt(request.getParameter("tema").toString());
        
        Memes meme = new Memes();
        
        meme.setTitulo(titulo);
        meme.setImagen(imagen);
        meme.setId_Tema(temaId);
        meme.setId_Usuario(sesId);
        
        ProcesosMemes memesdb = new ProcesosMemes();
        
        int res = memesdb.SubirMeme(meme);
        response.sendRedirect(request.getHeader("Referer")+"&up="+res);
        
    }  
    catch(Exception e){
        response.sendRedirect(request.getHeader("Referer")+"&up=0");
        out.println(e);
    }
%>
