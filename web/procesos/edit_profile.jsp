<%@page import="Procesos.ProcesosUsuarios" %>

<%
  String sesId = session.getAttribute("Id").toString();
  String color = request.getParameter("color");
  String imagen = request.getParameter("imagen");
  
  ProcesosUsuarios usuariosdb = new ProcesosUsuarios();
  
  int res = usuariosdb.EditarPerfil(sesId, color.toUpperCase(), imagen);
  if(res != 0){
    session.setAttribute("Color", color);
    session.setAttribute("Imagen", imagen);
  }
  response.sendRedirect(request.getHeader("Referer"));
%>
