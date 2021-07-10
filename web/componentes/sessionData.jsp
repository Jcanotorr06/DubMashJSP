<%@page import="Entidades.Usuarios"%>
<%!
        String sesId;
        String sesUsuario;
        String sesImagen;
        String sesColor;
        Usuarios ses = new Usuarios();
%>
<%
    if(session.getAttribute("Id") == null){
        response.sendRedirect("index.jsp");
    }else{
    
         sesUsuario = session.getAttribute("Usuario").toString();
         sesImagen = session.getAttribute("Imagen").toString();
         sesColor = session.getAttribute("Color").toString();
         sesId = session.getAttribute("Id").toString();
         ses.setId(Integer.parseInt(sesId));

    }
%>
