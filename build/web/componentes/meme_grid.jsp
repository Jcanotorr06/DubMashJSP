<div class="container">
    <div class="row">
        <%for(Memes meme : memes){%>
        <div class="col-4 overflow-hidden my-2">
            <div class="card h-100 max-h-200px overlay-parent" data-bs-toggle="modal" data-bs-target="#modal-publicacion-<%=meme.getId()%>">
                <img src="<%=meme.getImagen()%>" class="image-fluid card-img max-h-100" alt="">
                <div class="overlay">
                    <h3 class="text-yellow">
                        <i class="bi bi-heart-fill text-yellow"></i>
                        <%=meme.getLikes()%> &nbsp;
                        <i class="bi bi-chat-fill text-yellow"></i>
                        <%=meme.getComentarios().size()%>
                    </h3>
                </div>
            </div>

        </div>
        <%}%>
    </div>
</div>

