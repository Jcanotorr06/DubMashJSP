<%-- 
    Document   : left_nav
    Created on : 6 jul. 2021, 14:11:13
    Author     : Joseph Cano
--%>
<%!
    String path;
%>
<%
    path=request.getServletPath().toString().substring(1);
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="col-3 border p-0" id="sidebar-l">
    <div class="position-fixed h-100 py-2">
        <div class="my-3 w-100 text-center">
            <a href="index.jsp">
                <img class="image-fluid w-40" src="https://raw.githubusercontent.com/Jcanotorr06/RedSocial-Memes/main/media/DubMash.png" alt="">
            </a>
        </div>
        <div class="w-100 d-flex ps-4 my-3" id="user-profile">
            <a href="profile.jsp?usuario=<%=sesUsuario%>" class="d-flex align-items-center">
                <div class="rounded-circle d-flex align-items-center border border-2 p-1" style="border-color: <%=sesColor%> !important">
                    <img class="image-fluid w-60px rounded-circle" src="<%=sesImagen%>" alt="">
                </div>
                <div class="d-flex flex-column justify-content-center h-100 px-3 info">
                    <p class="lh-1 fw-bold">
                        <a href="profile.jsp?usuario=<%=sesUsuario%>">
                            <h4><%=sesUsuario%></h4>
                        </a>
                    </p>
                </div>
            </a>
        </div>


        <div class="w-100 py-3 ps-4" id="tabs">
            <a href="/feed.jsp" class="tab w-100 py-2 d-flex <%if(path.equals("feed.jsp")){%>text-yellow align-items-center border-end border-5 border-warning<%}%>">
                <div class="tab-icon">
                    <h2>
                        <i class="bi bi-house-door-fill <%if(path.equals("feed.jsp")){%>text-yellow<%}%>"></i>
                    </h2>
                </div>
                <div class="ps-3 tab-text">
                    <h4 class="fw-bold user-select-none">Inicio</h4>
                </div>
            </a>

            <div class="tab w-100 py-2 d-flex <%if(path.equals("discover.jsp")){%>text-yellow align-items-center border-end border-5 border-warning<%}%>">
                <a href="discover.jsp" class="d-flex align-items-center <%if(path.equals("discover.jsp")){%>text-yellow<%}%>">
                    <div class="tab-icon">
                        <h2>
                            <i class="bi bi-compass-fill <%if(path.equals("discover.jsp")){%>text-yellow<%}%>"></i>
                        </h2>
                    </div>
                    <div class="ps-3 tab-text">
                        <h4 class="fw-bold user-select-none">Descubrir</h4>
                    </div>
                </a>
            </div>

            <div class="tab w-100 py-2 d-flex">
                <a href="" class="d-flex align-items-center">
                    <div class="tab-icon">
                        <h2>
                            <i class="bi bi-bookmark-fill"></i>
                        </h2>
                    </div>
                    <div class="ps-3 tab-text">
                        <h4 class="fw-bold user-select-none">Guardados</h4>
                    </div>
                </a>
            </div>

            <div class="tab w-100 py-2 d-flex">
                <a href="" class="d-flex align-items-center">
                    <div class="tab-icon">
                        <h2>
                            <i class="bi bi-bell-fill"></i>
                        </h2>
                    </div>
                    <div class="ps-3 tab-text">
                        <h4 class="fw-bold user-select-none">Notificaciones</h4>
                    </div>
                </a>
            </div>

            <div class="tab w-100 py-2 d-flex">
                <a href="/procesos/logout.jsp" class="d-flex align-items-center">
                    <div class="tab-icon">
                        <h2>
                            <i class="bi bi-box-arrow-in-left"></i>
                        </h2>
                    </div>
                    <div class="ps-3 tab-text">
                        <h4 class="fw-bold user-select-none">Cerrar Sesion</h4>
                    </div>
                </a>
            </div>
        </div>


        <div class="d-flex w-100 align-items-center">
            <span class="w-100 border border-warning border-2 h-2 "></span>
            <div class="btn-warning border-0 p-3 d-inline-flex rounded-semicircle-l" id="collapse-l" onclick="collapseL()">
                <i class="bi bi-caret-left-fill text-white"></i>
            </div>
        </div>

        <div class="d-flex h-30 px-3">
            <p class="info-text">
                <a href="about.html">Acerca de </a> • 
                <a href="contact.html">Contacto</a> • 
                <a href="faq.html">FAQ</a> • 
                <a href="">Repositorio</a> 
            </p>
            <div class="info-tooltip d-none d-flex justify-content-center text-center w-100">
                <h2>
                    <i class="bi bi-info-circle-fill" data-bs-toggle="popover"></i>
                </h2>
            </div>
        </div>
    </div>
</div>
