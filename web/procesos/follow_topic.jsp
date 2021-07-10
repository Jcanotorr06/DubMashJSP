<%@page import="Procesos.ProcesosTemas" %>

<%
    String urlSeguir = request.getParameter("seguir");
    String sesId = session.getAttribute("Id").toString();
    
    ProcesosTemas temasdb = new ProcesosTemas();
    
    int res = temasdb.SeguirTema(sesId, urlSeguir);
    
    if(res > 0){
        response.sendRedirect(request.getHeader("Referer"));
    }else{
        System.out.println("Error al seguir un tema");
        response.sendRedirect(request.getHeader("Referer"));
    }
%>

