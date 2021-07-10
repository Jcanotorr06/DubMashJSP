<%@page import="Procesos.ProcesosUsuarios" %>

<%
    String urlSeguir = request.getParameter("seguir");
    String sesId = session.getAttribute("Id").toString();
    
    ProcesosUsuarios usuariosdb = new ProcesosUsuarios();
    
    int res = usuariosdb.SeguirUsuario(sesId, urlSeguir);
    
    if(res > 0){
        response.sendRedirect(request.getHeader("Referer"));
    }else{
        response.sendRedirect(request.getHeader("Referer"));
        System.out.println("ERROR AL SEGUIR USUARIO");
    }
%>
