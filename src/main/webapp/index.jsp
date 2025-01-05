<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Masavi</title>
    <!-- Enlace de Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <!-- Enlace de CSS Global -->
    <link rel="stylesheet" href="css/global.css">
    <!-- Enlace de CSS Específico -->
    <link rel="stylesheet" href="css/main.css">
    <!-- FontAwesome CDN -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>

<body>

<%@ include file="header.jsp" %>

<main>
    <!-- Video de fondo -->
    <video autoplay loop muted playsinline>
        <source src="media/fondo.mp4" type="video/mp4">
        Tu navegador no soporta videos HTML5.
    </video>

    <!-- Contenido encima del video -->
    <div class="container-fluid p-0 bg-main">
        <div class="row d-flex align-items-center">
            <!-- Columna izquierda -->
            <div class="col-12 col-md-6 text-center text-white order-1 order-md-0">
                <h1 class="mt-3">Bienvenido a <strong>MASAVI</strong></h1>
                <h5 class="mt-3">Juntos, mejoramos el rendimiento de tus cultivos</h5>
            </div>

            <!-- Columna derecha -->
            <div class="col-12 col-md-6 text-center p-5 order-2 order-md-1">
                <img src="img/logo.jpg" class="img-fluid rounded-circle responsive-img" alt="Masavi">
            </div>
        </div>
    </div>
</main>

<%@ include file="footer.jsp" %>

<!--Enlace de Bootstrap JavaScript-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
</body>

</html>