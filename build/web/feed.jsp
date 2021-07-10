<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="Entidades.Memes" %>
<%@page import="Procesos.ProcesosMemes" %>


<!DOCTYPE html>
<html lang="en">

<%@include file="/componentes/sessionData.jsp" %>

<%!
    List<Memes> memes;
    ProcesosMemes memesdb = new ProcesosMemes();
%>

<%
    memes= memesdb.BuscarMemesUsuariosSeguidos(sesId);
%>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
    <link rel="stylesheet" href="./css/global.css">
    <link rel="stylesheet" href="./css/feed.css">
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
                    <h1>Inicio</h1>
                    <hr>

                    <div class="py-3">
                        
                        <%@include file="/componentes/meme_feed.jsp" %>
                        
                    </div>
                </div>


                <%@include file="/componentes/right_nav.jsp" %>
                
                
            </div>
        </div>

    </div>


    <%@include file="/componentes/meme_modal.jsp" %>
                
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