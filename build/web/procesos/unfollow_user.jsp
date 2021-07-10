<%@page import="Procesos.ProcesosUsuarios" %>

<%
    String urlDejarSeguir = request.getParameter("dejar_seguir");
    String sesId = session.getAttribute("Id").toString();
    
    ProcesosUsuarios usuariosdb = new ProcesosUsuarios();
    
    int res = usuariosdb.DejarSeguirUsuario(sesId, urlDejarSeguir);
    
    response.sendRedirect(request.getHeader("Referer"));
%>