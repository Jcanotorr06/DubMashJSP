<%-- 
    Document   : right_nav
    Created on : 6 jul. 2021, 14:11:28
    Author     : Joseph Cano
--%>
<%@page import="java.util.List"%>
<%@page import="Entidades.Usuarios" %>
<%@page import="Entidades.Temas" %>
<%@page import="Procesos.ProcesosUsuarios" %>
<%@page import="Procesos.ProcesosTemas" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%!
    List<Usuarios> usuarios_sugeridos;
    List<Temas> temas_sugeridos;
%>

<%
    ProcesosUsuarios usuariosdb = new ProcesosUsuarios();
    ProcesosTemas temasdb = new ProcesosTemas();
    usuarios_sugeridos = usuariosdb.BuscarUsuariosSugeridos(sesId);
    temas_sugeridos = temasdb.ListarTemas();
    
%>
<div class="col-3 border p-0" id="sidebar-r">
    <div class="position-fixed h-100 py-2">

        <div class="">
            <h2 class="text-center">Usuarios</h2>
        </div>
        <div>
            <%for(Usuarios sugerido:usuarios_sugeridos){%>
            <div class="d-flex align-items-center px-3 my-3 suggested">
                <a href="profile.jsp?usuario=<%=sugerido.getUsuario()%>" class="rounded-circle d-flex align-items-center border border-2 p-1"  style="border-color: <%=sugerido.getColor()%> !important">
                        <img class="image-fluid mw-40px rounded-circle" src="<%=sugerido.getImagen()%>" alt="">
                </a>
                <div class="d-flex justify-content-between align-items-center w-100 h-100 px-3 suggested-user">
                    <a href="profile.jsp?usuario=<%=sugerido.getUsuario()%>" class="">
                        <h6><%=sugerido.getUsuario()%></h6>
                    </a>
                    <div>
                        <a href="/procesos/follow_user.jsp?seguir=<%=sugerido.getId()%>" class="btn btn-warning fw-bold ">Seguir</a>
                    </div>
                </div>
            </div>
            <%}%>
        </div>


        <div class="d-flex w-100 align-items-center">
            <div class="btn-warning border-0 p-3 d-inline-flex rounded-semicircle-r" id="collapse-r" onclick="collapseR()">
                <i class="bi bi-caret-right-fill text-white"></i>
            </div>
            <span class="w-100 border border-warning border-2 h-2 "></span>
        </div>

        <div class="px-2">
            <h2 class="text-center">Temas</h2>
        </div>
        <div class="overflow-auto max-h-350px">
            <%for(Temas sugerido:temas_sugeridos){%>
            <%sugerido.setSeguido(temasdb.ValidarTemaSeguido(sesId, sugerido.getId()));%>
            <div class="d-flex align-items-center px-3 my-3 suggested">
                <a href="#" class="d-flex align-items-center p-1">
                    <img class="image-fluid mw-40px rounded-3" src="<%=sugerido.getURL_Imagen()%>" alt="">
                </a>
                <div class="d-flex justify-content-between align-items-center w-100 h-100 px-3 suggested-topic">
                    <a href="topic.jsp?tema=<%=sugerido.getId()%>">
                        <h6><%=sugerido.getNombre()%></h6>
                    </a>
                        <%if(sugerido.isSeguido()){%>
                    <a href="/procesos/unfollow_topic.jsp?dejar_seguir=<%=sugerido.getId()%>">
                        <h2><i class="bi bi-star-fill text-yellow"></i></h2>
                    </a>
                    <%}else{%>
                    <a href="/procesos/follow_topic.jsp?seguir=<%=sugerido.getId()%>">
                        <h2><i class="bi bi-star-fill"></i></h2>
                    </a>
                    <%}%>
                </div>
            </div>
            <%}%>
            
        </div>
    </div>
</div>