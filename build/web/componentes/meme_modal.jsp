<%@page import="Entidades.Comentarios" %>

<%for(Memes meme: memes){%>
    <div class="modal fade" id="modal-publicacion-<%=meme.getId()%>" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-xl">
            <div class="modal-content">
                <div class="modal-body rounded py-5 px-3 ">
                    <div class="bg-white container-fluid">
                        <div class="row h-100">
                            <div class="col">
                                <img src="<%=meme.getImagen()%>" class="max-post-size shadow-sm" alt="">
                                <div class="container d-flex justify-content-around mt-3">
                                    <%if(memesdb.ValidarLike(sesId, meme.getLikes_Usuarios())){%>
                                    <a href="procesos/unlike_meme.jsp?meme=<%=meme.getId()%>">
                                        <i class="bi bi-heart-fill text-yellow h2"></i>
                                    </a>
                                    <%}else{%>
                                    <a href="procesos/like_meme.jsp?meme=<%=meme.getId()%>">
                                        <i class="bi bi-heart h2"></i>
                                    </a>
                                    <%}%>
                                    <i class="bi bi-bookmark h2"></i>
                                </div>
                            </div>
                            <div class="col px-3">
                                <a href="profile.jsp?usuario=<%=meme.getUsuario().getUsuario()%>" class="d-flex align-items-center my-3 suggested">
                                    <div class="rounded-circle d-flex align-items-center border border-2 p-1" style="border-color: <%=meme.getUsuario().getColor()%> !important">
                                            <img class="image-fluid w-30px rounded-circle" src="<%=meme.getUsuario().getImagen()%>" alt="">
                                    </div>
                                    <div class="d-flex justify-content-between align-items-center w-100 h-100 px-3">
                                        <span class="">
                                            <h6><%=meme.getUsuario().getUsuario()%></h6>
                                        </span>
                                    </div>
                                </a>
                                <div class="d-flex justify-content-between">
                                    <h2><%=meme.getTitulo()%></h2>
                                    <div class="btn-group-sm">
                                        <%if(meme.getId_Usuario() == Integer.parseInt(sesId)){%>
                                        <button class="btn btn-warning">Eliminar</button>
                                        <button class="btn btn-warning">Editar</button>
                                        <%}%>
                                    </div>
                                </div>
                                <div>
                                    <p>
                                        <a href="#"><%=meme.getTema().getNombre()%></a>
                                    </p>
                                </div>
                                <div class="py-2 h-auto">
                                    <h5 class="fw-bolds">Comentarios</h5>
                                    <div class="overflow-auto comments-size">
                                        <%for(Comentarios comentario : meme.getComentarios()){%>
                                        <div class="container-fluid py-2 px-4 border rounded-2">
                                            <a href="profile.jsp?usuario=<%=comentario.getUsuario().getUsuario()%>" class="d-flex align-items-center my-3 suggested">
                                                <div class="rounded-circle w-20px h-20px overflow-hidden d-flex align-items-center border border-2 p-1" style="border-color: <%=comentario.getUsuario().getColor()%> !important">
                                                        <img class="image-fluid cover h-100 rounded-circle" src="<%=comentario.getUsuario().getImagen()%>" alt="">
                                                </div>
                                                <div class="d-flex justify-content-between align-items-center w-100 h-100 px-3">
                                                    <span class="">
                                                        <h6><%=comentario.getUsuario().getUsuario()%></h6>
                                                    </span>
                                                </div>
                                            </a>
                                            <p class=""><%=comentario.getComentario()%></p>
                                        </div>
                                        <%}%>
                                    </div>
                                    <div>
                                        <form action="procesos/send_comment.jsp" class="py-3">
                                            <input class="form-control rounded-pill" type="text" placeholder="Comentario" name="comentario" autocomplete="off">
                                            <input type="hidden" name="idMeme" value="<%=meme.getId()%>">
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
<%}%>