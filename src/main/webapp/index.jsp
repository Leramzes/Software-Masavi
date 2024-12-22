<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Masavi</title>
    <!--Enlace de Bootstrap CSS-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <!--Enlace de CSS Global-->
    <link rel="stylesheet" href="css/global.css">
    <!--Enlace de CSS Específico-->
    <link rel="stylesheet" href="css/main.css">
    <!-- FontAwesome CDN -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>

<body>
<header>
    <nav class="navbar navbar-expand-lg" style="background-color: #8d8d8d;">
        <div class="container-fluid">
            <!-- Logo alineado a la izquierda -->
            <a class="navbar-brand" href="index.jsp">
                <img src="img/logo.jpg" width="50" height="50" class="rounded-circle mx-3">
            </a>

            <!-- Botón de colapso para pantallas pequeñas -->
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                    aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <!-- Contenido de la barra de navegación -->
            <div class="collapse navbar-collapse justify-content-end" id="navbarSupportedContent">
                <!-- Menú de navegación -->
                <ul class="navbar-nav mb-2 mb-lg-0 align-items-end">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="#">Inicio</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Nosotros</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Productos</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Contáctanos</a>
                    </li>
                </ul>

                <!-- Botón de iniciar sesión alineado a la derecha -->
                <form class="d-flex justify-content-end">
                    <button class="btn rounded-pill border" type="submit">Iniciar Sesión</button>
                </form>
            </div>
        </div>
    </nav>
</header>

<main>
    <!-- Video de fondo -->
    <video autoplay loop muted playsinline>
        <source src="img/FondoAnime.mp4" type="video/mp4">
        Tu navegador no soporta videos HTML5.
    </video>

    <!-- Contenido encima del video -->
    <div class="container">
        <div class="row d-flex align-items-center">
            <!-- Columna izquierda -->
            <div class="col-12 col-md-6 text-center text-white order-1 order-md-0">
                <h1>Lorem ipsum dolor sit amet</h1>
                <h5>Lorem ipsum dolor sit amet consectetur.</h5>
            </div>

            <!-- Columna derecha -->
            <div class="col-12 col-md-6 text-center p-5 order-2 order-md-1">
                <img src="img/logo.jpg" class="img-fluid rounded-circle responsive-img" alt="Masavi">
            </div>
        </div>
    </div>
</main>

<footer class="bg-dark text-white py-2">
    <div class="container">
        <!-- Fila de redes sociales -->
        <div class="row justify-content-center">
            <div class="col-auto">
                <p>Redes Sociales:</p>
            </div>
            <div class="col-auto">
                <a href="https://facebook.com" target="_blank" class="text-white">
                    <i class="facebook fab fa-facebook-f"></i> <!-- Ícono de Facebook -->
                </a>
            </div>
            <div class="col-auto">
                <a href="https://instagram.com" target="_blank" class="text-white">
                    <i class="instagram fab fa-instagram"></i> <!-- Ícono de Instagram -->
                </a>
            </div>
        </div>

        <!-- Fila de Copyright -->
        <div class="row">
            <div class="col text-center">
                <p>&copy; 2024 MASAVI. Todos los derechos reservados.</p>
            </div>
        </div>
    </div>
</footer>

<!--Enlace de Bootstrap JavaScript-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
</body>

</html>