<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% 
    if(session.getAttribute("Id") != null){
        response.sendRedirect("feed.jsp");
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
    <link rel="stylesheet" href="./css/global.css">
    <link rel="stylesheet" href="./css/landing.css">
    <link rel="shortcut icon" href="https://raw.githubusercontent.com/Jcanotorr06/RedSocial-Memes/main/media/Duck.png" type="image/x-icon">
    <title>DubMash</title>
</head>
<body onload="load()">
    <div id="body">
        <div class="container-fluid vh-100">
            <div class="row h-100">
                <div class="col bg-image">
                </div>
                <div class="col-8 shadow-left">
                    <div class="d-flex flex-column justify-content-center h-95 p-5">
                        <div class="my-2">
                            <img class="image-fluid w-20" src="https://raw.githubusercontent.com/anagabs/Dubmash/master/programa/media/DubMash.png" alt="">
                        </div>
                        <div class="my-4 w-75">
                            <h3>Unete a la comunidad de memes más grande del mundo</h3>
                        </div>
                        <div class="w-40 my-2">
                            <button class="shadow-sm btn-warning border-0 rounded-pill py-3 px-5 w-100 fw-bold" data-bs-toggle="modal" data-bs-target="#modal-inicio">Iniciar Sesion</button>
                        </div>
                        <div class="w-40 my-2">
                            <button class="shadow-sm btn-light rounded-pill py-3 px-5 w-100 border-0 fw-bold" data-bs-toggle="modal" data-bs-target="#modal-registro" >Registrarse</button>
                        </div>
                    </div>
                    <div class="text-center">
                        <ul>
                            <li><a href="about.html">Acerca de</a></li>
                            <li><a href="contact.html">Contacto</a></li>
                            <li><a href="faq.html">FAQ</a></li>
                            <li><a href="https://github.com/Jcanotorr06/DubMashJSP">Repositorio</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>



        <div class="modal fade" id="modal-inicio" tabindex="-1" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="bg-white text-center p-3 rounded-3 shadow-lg d-flex flex-column justify-content-center align-items-center">
                    <a href="#">
                        <img class="img-fluid w-15 mt-3" src="https://raw.githubusercontent.com/anagabs/Dubmash/master/programa/media/Duck.png" alt="">
                    </a>
                    <div class="mb-2">
                        <h1>Iniciar Sesion</h1>
                    </div>
                    <form action="/procesos/login.jsp" method="post" class="my-3 w-75 text-start" >
                        <div class="mb-4">
                            <label class="fw-bold" for="usuario">Usuario</label>
                            <input class="form-control rounded-pill" type="text" name="usu" id="usu" placeholder="@usuario" minlength="5" required>
                        </div>
                        <div class="mb-5">
                            <label class="fw-bold" for="contraseña">Contraseña</label>
                            <input class="form-control rounded-pill" type="password" name="contra" id="contra" placeholder="Contraseña" minlength="6" required>
                        </div>
                        <div class="text-center mb-3">
                            <input class="btn-warning border-0 shadow-sm rounded-pill w-100 py-2 fw-bold" type="submit" value="Iniciar Sesion">
                        </div>
                    </form>
                    <div class="mb-5"></div>
                </div>
            </div>
            </div>
        </div>

        
        <div class="modal fade" id="modal-registro" tabindex="-1" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="bg-white text-center p-3 rounded-3 shadow-lg d-flex flex-column justify-content-center align-items-center">
                    <a href="#">
                        <img class="img-fluid w-15 mt-3" src="https://raw.githubusercontent.com/anagabs/Dubmash/master/programa/media/Duck.png" alt="">
                    </a>
                    <div class="mb-2">
                        <h1>Registrarse</h1>
                    </div>
                    <form action="/procesos/signup.jsp" method="post" class="my-3 w-75 text-start" >
                        <div class="mb-4">
                            <label class="fw-bold" for="nombre">Nombre</label>
                            <input class="form-control rounded-pill" type="text" name="nombre" id="nombre" placeholder="John Doe" required>
                        </div>
                        <div class="mb-4">
                            <label class="fw-bold" for="email">Email</label>
                            <input class="form-control rounded-pill" type="email" name="email" id="email" placeholder="ejemplo@email.com" required>
                        </div>
                        <div class="mb-4">
                            <label class="fw-bold" for="usuario">Usuario</label>
                            <input class="form-control rounded-pill" type="text" name="usuario" id="usuario" placeholder="@usuario" minlength="5" required>
                        </div>
                        <div class="mb-4">
                            <label class="fw-bold" for="contra">Contraseña</label>
                            <input class="form-control rounded-pill" type="password" name="contra" id="contraseña" placeholder="Contraseña" minlength="6" required>
                        </div>
                        <div class="mb-5">
                            <label class="fw-bold" for="nacimiento">Fecha de Nacimiento</label>
                            <input class="form-control rounded-pill" type="date" name="nacimiento" id="nacimiento" required>
                        </div>
                        <div class="text-center mb-3">
                            <input class="btn-warning border-0 shadow-sm rounded-pill w-100 py-2 fw-bold" type="submit" value="Registrarse">
                        </div>
                    </form>
                    <div class="mb-5"></div>
                </div>
            </div>
            </div>
        </div>


        <button class="d-none position-absolute" id="btn-exito" data-bs-toggle="modal" data-bs-target="#modal-exito"></button>

        <div class="modal fade" id="modal-exito" tabindex="-1" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="bg-white text-center p-3 rounded-3 shadow-lg d-flex flex-column justify-content-center align-items-center">
                    <h1 class="text-success mt-5"><i class="bi bi-check-circle-fill text-success"></i></h1>
                    <div class="mb-2">
                        <h1>Registro Exitoso</h1>
                    </div>
                    <div class="mt-2">
                        <button type="button" class="btn btn-success rounded-pill px-5" data-bs-dismiss="modal">Cerrar</button>
                    </div>
                    <div class="mb-5"></div>
                </div>
            </div>
            </div>
        </div>



        <button class="d-none position-absolute" id="btn-fallo" data-bs-toggle="modal" data-bs-target="#modal-fallo"></button>

        <div class="modal fade" id="modal-fallo" tabindex="-1" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="bg-white text-center p-3 rounded-3 shadow-lg d-flex flex-column justify-content-center align-items-center">
                    <h1 class="text-danger mt-5"><i class="bi bi-check-circle-fill text-danger"></i></h1>
                    <div class="mb-2 px-2">
                        <h1>Registro Fallido</h1>
                        <p id="mensaje-fallo"></p>
                    </div>
                    <div class="mt-2">
                        <button type="button" class="btn btn-danger rounded-pill px-5" data-bs-dismiss="modal">Cerrar</button>
                    </div>
                    <div class="mb-5"></div>
                </div>
            </div>
            </div>
        </div>


        <button class="d-none position-absolute" id="btn-fallo-inicio" data-bs-toggle="modal" data-bs-target="#modal-fallo-inicio"></button>

        <div class="modal fade" id="modal-fallo-inicio" tabindex="-1" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="bg-white text-center p-3 rounded-3 shadow-lg d-flex flex-column justify-content-center align-items-center">
                    <h1 class="text-danger mt-5"><i class="bi bi-check-circle-fill text-danger"></i></h1>
                    <div class="mb-2 px-2">
                        <h1>Inicio Fallido</h1>
                        <p id="mensaje-fallo-inicio"></p>
                    </div>
                    <div class="mt-2">
                        <button type="button" class="btn btn-danger rounded-pill px-5" data-bs-dismiss="modal">Cerrar</button>
                    </div>
                    <div class="mb-5"></div>
                </div>
            </div>
            </div>
        </div>

    </div>



    <div class="d-flex justify-content-center align-items-center vh-100" id="spinner-container">
        <div class="spinner-grow text-warning" id="spinner" role="status">
          <span class="visually-hidden">Loading...</span>
        </div>
    </div>



    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <script src="./js/load.js"></script>
</body>
</html>