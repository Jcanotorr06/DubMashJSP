<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="Entidades.*" %>
<%@page import="Procesos.*" %>

<!DOCTYPE html>
<html lang="en">
    <%@include file="/componentes/sessionData.jsp" %>
    <%!
        String urlUsuario;
        Usuarios usuario;
        ProcesosUsuarios usuariodb;
        ProcesosTemas temasdb;
        ProcesosPerfiles perfilesdb;
        Perfiles respuesta;
        List<Temas> temas;
        List<Memes> memes;
        int Id;
        String Usuario;
        String Imagen;
        String Color;
        int Seguidores;
        int Seguidos;
        boolean seguido;
    %>
    <%
        urlUsuario = request.getParameter("usuario");
        
        usuario = new Usuarios();
        usuario.setUsuario(urlUsuario);
        
        usuariodb = new ProcesosUsuarios();
        temasdb = new ProcesosTemas();
        perfilesdb = new ProcesosPerfiles();
        ProcesosMemes memesdb = new ProcesosMemes();
        
        respuesta = perfilesdb.BuscarPerfil(urlUsuario);
        if(respuesta != null){
            Id = respuesta.getUsuario().getId();
            Usuario = respuesta.getUsuario().getUsuario();
            Imagen = respuesta.getUsuario().getImagen();
            Color = respuesta.getUsuario().getColor();
            Seguidores = respuesta.getUsuario().getSeguidores();
            Seguidos = respuesta.getUsuario().getSeguidos();
            seguido = usuariodb.ValidarUsuarioSeguido(sesId, Integer.toString(Id));
            memes = respuesta.getMemes();
        }
        else{
            response.sendRedirect("feed.jsp");
        }
        
        temas = temasdb.ListarTemas();
    
%>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
    <link rel="stylesheet" href="./css/global.css">
    <link rel="stylesheet" href="./css/feed.css">
    <link rel="stylesheet" href="./css/profile.css">
    <link rel="shortcut icon" href="https://raw.githubusercontent.com/Jcanotorr06/RedSocial-Memes/main/media/Duck.png" type="image/png">
    <title>DubMash</title>
</head>
<body onload="load()">
    <div id="body">
        <div class="container-fluid vh-100">
            <div class="row min-vh-100">

                <%@include file="/componentes/left_nav.jsp" %>


                <div class="col border pt-4 px-3" id="feed">
                    <%@include file="/componentes/searchbar.jsp" %>
                    <div class="py-3">
                        <div>
                            <div href="#" class="d-flex align-items-center px-3 my-3">
                                <div class="rounded-circle d-flex align-items-center border border-2 p-1" style="border-color: <%=Color%> !important">
                                        <img class="image-fluid w-80px rounded-circle" src="<%=Imagen%>" alt="">
                                </div>
                                <div class="d-flex flex-column justify-content-center w-100 h-100 px-3 pt-5">
                                    <h3><%=Usuario%></h3>
                                    <ul class="d-flex ps-0 justify-content-lg-between w-75">
                                        <li><h6><b><%=Seguidores%></b> Seguidores</h6></li>
                                        <li><h6><b><%=Seguidos%></b> Seguidos</h6></li>
                                        <li><h6><b><%=memes.size()%></b> Publicaciones</h6></li>
                                    </ul>
                                </div>
                            </div>
                            <% if(sesUsuario.equals(Usuario)){%>
                            <div class="text-center">
                                <button class="btn btn-light w-50 rounded-pill fw-bold py-2 my-2 text-no" data-bs-toggle="modal" data-bs-target="#modal-editar">
                                    <i class="bi bi-pencil-square text-dark h4"></i>
                                    Editar Perfil
                                </button>
                                <button class="btn btn-warning w-50 rounded-pill fw-bold py-2 my-2 text-no" data-bs-toggle="modal" data-bs-target="#modal-subir">
                                    <i class="bi bi-cloud-arrow-up-fill text-dark h4"></i>
                                    Subir Meme
                                </button>
                            </div>
                            <%}else{%>
                            <div class="text-center">
                                <%if(seguido){%>
                                <a href="/procesos/unfollow_user.jsp?dejar_seguir=<%=Id%>" class="btn btn-light w-50 rounded-pill fw-bold py-2 my-2 text-no">
                                    Dejar de Seguir
                                </a>
                                <%}else{%>
                                <a href="/procesos/follow_user.jsp?seguir=<%=Id%>" class="btn btn-warning w-50 rounded-pill fw-bold py-2 my-2 text-no">
                                    Seguir
                                </a>
                                <%}%>
                            </div>
                            <%}%>
                            <div class="p-2 my-4">
                                <h2 class="text-center">
                                    <% if(sesUsuario.equals(Usuario)){ %>
                                        Mis Publicaciones
                                    <%}else{%>
                                        Publicaciones
                                    <%}%>
                                </h2>
                                <hr>
                            </div>
                            <%@include file="/componentes/meme_grid.jsp" %>
                        </div>
                    </div>
                </div>

                                
               <%@include file="/componentes/right_nav.jsp" %>                 

         
            </div>
        </div>



        <div class="modal fade" id="modal-subir" tabindex="-1" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-xl">
                <div class="modal-content">
                    <div class="modal-body rounded py-5 px-3 ">
                        <div class="bg-white container-fluid">
                            <div class="d-flex gap-2 align-items-center w-60px h-60px">
                                <img class="image-fluid w-100 h-100 cover" src="https://raw.githubusercontent.com/Jcanotorr06/RedSocial-Memes/main/media/Duck.png" alt="">
                                <h2>Subir un Meme</h2>
                            </div>
                            <form class="py-3" action="procesos/upload_meme.jsp" mehtod="post">
                                <div class="my-2">
                                    <label for="titulo">Titulo</label>
                                    <input class="form-control rounded-pill" required type="text" name="titulo" autocomplete="off">
                                </div>
                                <div class="my-2">
                                    <label for="tema">Tema</label>
                                    <select name="tema" class="form-select" required>
                                        <option selected value="">Escoja un Tema</option>
                                        <%for(Temas tema : temas){%>
                                        <option value="<%=tema.getId()%>"><%=tema.getNombre()%></option>
                                        <%}%>
                                    </select>
                                </div>
                                <div class="my-2">
                                    <label for="Imagen">Url de la Imagen</label>
                                    <input class="form-control rounded-pill" required type="url" name="imagen" autocomplete="off">
                                </div>
                                <div class="mt-5">
                                    <input type="submit" value="Subir" class="btn btn-warning w-100 rounded-pill py-2 fw-bold">
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <div class="modal fade" id="modal-editar" tabindex="-1" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-xl">
                <div class="modal-content">
                    <div class="modal-body rounded py-5 px-3 ">
                        <div class="bg-white container-fluid">
                            <div class="d-flex gap-2 align-items-center">
                                <img class="image-fluid w-60px" src="https://raw.githubusercontent.com/Jcanotorr06/RedSocial-Memes/main/media/Duck.png" alt="">
                                <h2>Editar Perfil</h2>
                            </div>
                            <form class="py-3" action="procesos/edit_profile.jsp" mehtod="post">
                                <div class="my-2">
                                    <label for="imagen">Imagen de Perfil</label>
                                    <input class="form-control rounded-pill" required type="url" name="imagen" value="<%=sesImagen%>">
                                </div>
                                <div class="my-2">
                                    <label for="color">Color</label>
                                    <input class="form-control rounded-pill" required type="color" name="color" value="<%=sesColor%>">
                                </div>
                                <div class="mt-5">
                                    <input type="submit" value="Subir" class="btn btn-warning w-100 rounded-pill py-2 fw-bold">
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <%@include file="/componentes/meme_modal.jsp" %>
        
    </div>



    <div class="d-flex justify-content-center align-items-center vh-100" id="spinner-container">
        <div class="spinner-grow text-warning" id="spinner" role="status">
            <span class="visually-hidden">Loading...</span>
        </div>
    </div>


    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <script src="./js/load.js"></script>
    <script src="./js/sidebars.js"></script>
</body>
</html>