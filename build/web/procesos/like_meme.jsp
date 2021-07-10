<%@page import="Procesos.ProcesosMemes" %>

<%
    ProcesosMemes memesdb = new ProcesosMemes();
    String sesId = session.getAttribute("Id").toString();
    String memeId = request.getParameter("meme");
    
    int res = memesdb.LikeMeme(sesId, memeId);
    
    response.sendRedirect(request.getHeader("Referer"));
    
    
%>
