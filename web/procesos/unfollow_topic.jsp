<%@page import="Procesos.ProcesosTemas" %>

<%
    String urlDejarSeguir = request.getParameter("dejar_seguir");
    String sesId = session.getAttribute("Id").toString();
    
    ProcesosTemas temasdb = new ProcesosTemas();
    
    int res = temasdb.DejarSeguirTema(sesId, urlDejarSeguir);
    
    response.sendRedirect(request.getHeader("Referer"));
%>
