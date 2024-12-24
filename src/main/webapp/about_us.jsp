<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <link rel="stylesheet" href="">
    <!--Enlace de CSS Fondo-->
    <link rel="stylesheet" href="css/background.css">
    <!-- FontAwesome CDN -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>

<body>

<%@ include file="header.jsp" %>

<main class="bg-main">
    <div class="container my-4">
        <!-- Sección Historia -->
        <div class="card bg-light p-4 mb-4 rounded">
            <div class="row align-items-center">
                <!-- Texto a la izquierda -->
                <div class="col-12 col-md-8">
                    <h1 class="text-black fw-bold">Historia</h1>
                    <p class="text-muted">
                        Lorem ipsum dolor sit amet consectetur. Ornare purus amet rhoncus suspendisse ipsum ullamcorper
                        vulputate euismod quis. In egestas risus id porta sed at leo convallis. Habitant faucibus nisl nunc
                        arcu id nibh velit. A nunc at odio nisi volutpat augue orci.
                    </p>
                </div>

                <!-- Imagen a la derecha -->
                <div class="col-12 col-md-4 text-center">
                    <div class="bg-secondary rounded-circle d-flex justify-content-center align-items-center"
                         style="width: 180px; height: 180px; margin: auto; overflow: hidden;">
                        <img src="img/producto.jpg" alt="Historia" class="img-fluid"
                             style="width: 100%; height: 100%; object-fit: cover;">
                    </div>
                </div>
            </div>
        </div>

        <!-- Sección Misión, Visión, Valores -->
        <div class="card bg-light p-4 mb-4 rounded">
            <div class="row text-center gy-4">
                <!-- Misión -->
                <div class="col-12 col-md-4">
                    <div class="card border-0 shadow p-4 h-100">
                        <div class="text-center mb-3">
                            <i class="fa-regular fa-handshake fa-3x text-primary"></i>
                        </div>
                        <h5 class="fw-bold text-dark">Misión</h5>
                        <p class="text-muted">
                            Lorem ipsum dolor sit amet consectetur. Venenatis nibh non arcu in sit id tincidunt nibh.
                            Donec diam velit quis quam sagittis viverra fermentum.
                        </p>
                    </div>
                </div>

                <!-- Visión -->
                <div class="col-12 col-md-4">
                    <div class="card border-0 shadow p-4 h-100">
                        <div class="text-center mb-3">
                            <i class="fa-regular fa-eye fa-3x text-success"></i>
                        </div>
                        <h5 class="fw-bold text-dark">Visión</h5>
                        <p class="text-muted">
                            Lorem ipsum dolor sit amet consectetur. Venenatis nibh non arcu in sit id tincidunt nibh.
                            Donec diam velit quis quam sagittis viverra fermentum.
                        </p>
                    </div>
                </div>

                <!-- Valores -->
                <div class="col-12 col-md-4">
                    <div class="card border-0 shadow p-4 h-100">
                        <div class="text-center mb-3">
                            <i class="fa-regular fa-star fa-3x text-warning"></i>
                        </div>
                        <h5 class="fw-bold text-dark">Valores</h5>
                        <p class="text-muted">
                            Lorem ipsum dolor sit amet consectetur. Venenatis nibh non arcu in sit id tincidunt nibh.
                            Donec diam velit quis quam sagittis viverra fermentum.
                        </p>
                    </div>
                </div>
            </div>
        </div>

        <!-- Sección Ubicación -->
        <div class="card bg-light p-4 rounded text-center">
            <!-- Título de la Sección -->
            <h1 class="text-black fw-bold">
                ¿Dónde nos Ubicamos?
            </h1>

            <!-- Contenido de la Sección -->
            <div class="bg-secondary rounded overflow-hidden" style="height: 300px;">
                <!-- Google Maps Embed -->
                <iframe
                        src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3962.5618605599634!2d-79.90455012538204!3d-6.701057493294512!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x904ced9729b17ded%3A0x8434a259867eade!2sAv.%20Mariscal%20Ramon%20Castilla%20487%2C%20Lambayeque%2014013!5e0!3m2!1ses-419!2spe!4v1735012991853!5m2!1ses-419!2spe"
                        width="100%" height="100%" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
            </div>
        </div>
    </div>
</main>

<%@ include file="footer.jsp" %>

<!--Enlace de Bootstrap JavaScript-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
<!--Enlace de JavaScript-->
<script src=""></script>

</body>

</html>
