<%
    session.removeAttribute("Id");
    session.removeAttribute("Nombre");
    session.removeAttribute("Usuario");
    session.removeAttribute("Color");
    session.removeAttribute("Imagen");

    response.sendRedirect("../index.jsp");
%>
