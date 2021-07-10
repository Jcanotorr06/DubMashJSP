<%for(Memes meme: memes){%>
    <div class="my-2">
        <a href="profile.jsp?usuario=<%=meme.getUsuario().getUsuario()%>" class="d-flex align-items-center px-3 my-3">
            <div class="rounded-circle d-flex align-items-center border border-2 p-1" style="border-color: <%=meme.getUsuario().getColor()%> !important;">
                    <img class="image-fluid w-40px rounded-circle" src="<%=meme.getUsuario().getImagen()%>" alt="">
            </div>
            <div class="d-flex justify-content-between align-items-center w-100 h-100 px-3">
                <span class="">
                    <h6><%=meme.getUsuario().getUsuario()%></h6>
                </span>
            </div>
        </a>
        <div class="p-2">
            <h2><%=meme.getTitulo()%></h2>
        </div>
        <div class="p-2 d-flex justify-content-center">
            <img src="<%=meme.getImagen()%>" data-bs-toggle="modal" data-bs-target="#modal-publicacion-<%=meme.getId()%>" class="image-fluid max-w-100" alt="">
        </div>
        <div class="d-flex justify-content-between p-2 align-items-center">
            <div>
                <p><%=meme.getComentarios().size()%> comentarios - <%=meme.getLikes()%> likes</p> 
            </div>
            <div class="d-flex">
               <div class="p-2">
                   <h2>
                       <%if(memesdb.ValidarLike(sesId, meme.getLikes_Usuarios())){%>
                            <a href="procesos/unlike_meme.jsp?meme=<%=meme.getId()%>">
                                <i class="bi bi-heart-fill text-yellow"></i>
                            </a>
                            <%}else{%>
                            <a href="procesos/like_meme.jsp?meme=<%=meme.getId()%>">
                                <i class="bi bi-heart"></i>
                            </a>
                        <%}%>
                   </h2>
               </div>
               <div class="p-2">
                    <h2><i class="bi bi-chat" data-bs-toggle="modal" data-bs-target="#modal-publicacion-<%=meme.getId()%>"></i></h2>
               </div>
               <div class="p-2">
                    <h2><i class="bi bi-bookmark"></i></h2>
               </div>
            </div>
        </div>
    </div>
    <hr>
<%}%>

