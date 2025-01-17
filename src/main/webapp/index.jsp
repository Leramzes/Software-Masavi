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
    <!-- Animate.css CDN -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
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
    <div class="container-fluid bg-main m-5 p-5">
        <div class="row d-flex align-items-center">
            <!-- Columna izquierda -->
            <div class="col-12 col-md-6 text-center text-white order-1 order-md-0 animate__animated animate__jackInTheBox animate__delay-1s">
                <h1 class="mt-3">Bienvenido a <strong>MASAVI</strong></h1>
                <h5 class="mt-3">Juntos, mejoramos el rendimiento de tus cultivos</h5>
            </div>

            <!-- Columna derecha -->
            <div class="col-12 col-md-6 text-center p-5 order-2 order-md-1 animate__animated animate__fadeInRight animate__delay-1s">
                <img src="img/logo.jpg" class="img-fluid rounded-circle responsive-img" alt="Masavi">
            </div>
        </div>
        <div id="about_us" style="visibility: hidden;"></div>
    </div>
</main>

<!-- Sección de about_us -->
<section>
    <div class="container my-4">
        <!-- Sección Historia -->
        <div class="transparente mb-4 rounded animate-on-scroll" data-animation="animate__bounceInDown">
            <div class="row align-items-center">
                <!-- Texto a la izquierda -->
                <div class="col-12 col-md-8">
                    <h1 class="text-black fw-bold">Historia</h1>
                    <p class="text-muted text-justify">
                        En 2011 el <strong>Centro Agronómico MASAVI</strong> inicia con la venta de productos
                        agroquímicos como un negocio
                        de persona natural. A partir de ese año se logró adentrarse un poco más en el mercado
                        agropecuario y agronómico obteniendo productos de
                        <strong>buena calidad</strong> para la satisfacción del cliente según sus necesidades. En el año
                        2020, el
                        <strong>Centro Agronómico MASAVI</strong> decide no solo dedicarse a la venta de sus productos,
                        sino también brindar
                        soluciones a los clientes dándoles <strong>asesoría</strong> de acuerdo a sus problemas y a su
                        vez guiándolos en la utilización
                        del producto para mejores resultados.
                        Tenemos la suficiente experiencia para que nuestros clientes tengan la
                        <strong>confianza</strong> de adquirir
                        nuestros productos y que sus <strong>necesidades</strong> puedan ser resueltas.
                    </p>
                </div>
                <!-- Imagen a la derecha -->
                <div class="col-12 col-md-4 text-center animate-on-scroll" data-animation="animate__zoomIn" data-delay="1s">
                    <div class="bg-secondary rounded-circle d-flex justify-content-center align-items-center"
                         style="width: 180px; height: 180px; margin: auto; overflow: hidden;">
                        <img src="img/producto.jpg" alt="Historia" class="img-fluid"
                             style="width: 100%; height: 100%; object-fit: cover;">
                    </div>
                </div>
            </div>
        </div>

        <hr class="divider">

        <!-- Sección Misión, Visión, Valores -->
        <div class="row text-center gy-4 mb-4">
            <!-- Misión -->
            <div class="col-12 col-md-4">
                <div class="transparente rounded-4 border-0 shadow p-4 h-100 animate-on-scroll" data-animation="animate__fadeInLeft" data-delay="1s">
                    <div class="text-center mb-3">
                        <i class="fa-regular fa-handshake fa-3x text-primary"></i>
                    </div>
                    <h5 class="fw-bold text-dark">Misión</h5>
                    <p class="text-muted" style="text-align: justify;">
                        Ser una empresa líder en la venta de productos agroquímicos de alta calidad, ofreciendo
                        soluciones
                        efectivas y personalizadas que satisfagan las necesidades de nuestros clientes, promoviendo un
                        desarrollo agrícola eficiente y sostenible.
                    </p>
                </div>
            </div>
            <!-- Visión -->
            <div class="col-12 col-md-4">
                <div class="transparente rounded-4 border-0 shadow p-4 h-100 animate-on-scroll" data-animation="animate__fadeInDown" data-delay="2s">
                    <div class="text-center mb-3">
                        <i class="fa-regular fa-eye fa-3x text-success"></i>
                    </div>
                    <h5 class="fw-bold text-dark">Visión</h5>
                    <p class="text-muted" style="text-align: justify;">
                        Convertirnos en el principal referente de confianza y asesoría en el sector agroquímico,
                        garantizando a
                        nuestros clientes productos de calidad superior y servicios que impulsen el crecimiento
                        sostenible de
                        sus cultivos y el éxito de sus proyectos agrícolas.
                    </p>
                </div>
            </div>
            <!-- Valores -->
            <div class="col-12 col-md-4">
                <div class="transparente rounded-4 border-0 shadow p-4 h-100 animate-on-scroll" data-animation="animate__fadeInRight" data-delay="3s">
                    <div class="text-center mb-3">
                        <i class="fa-regular fa-star fa-3x text-warning"></i>
                    </div>
                    <h5 class="fw-bold text-dark">Valores</h5>
                    <p class="text-muted" style="text-align: justify;">
                        Nos regimos por principios fundamentales que reflejan nuestro compromiso con el sector
                        agronómico:
                    </p>
                    <ul class="text-muted ps-3" style="list-style-type: none;">
                        <li>Calidad</li>
                        <li>Confianza</li>
                        <li>Sostenibilidad</li>
                        <li>Innovación</li>
                        <li>Responsabilidad</li>
                        <li>Compromiso con el cliente</li>
                        <li>Educación y asesoramiento</li>
                    </ul>
                </div>
            </div>
        </div>

        <hr class="divider">

        <!-- Sección Ubicación -->
        <div class="transparente rounded animate-on-scroll" data-animation="animate__fadeInUp">
            <h1 class="text-black fw-bold mb-4 text-center">
                ¿Dónde nos Ubicamos?
            </h1>
            <div class="map-container rounded overflow-hidden animate-on-scroll" style="height: 300px;" data-animation="animate__zoomIn"
                 data-delay="1s">
                <!-- Google Maps Embed -->
                <iframe
                        src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3962.5618605599634!2d-79.90455012538204!3d-6.701057493294512!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x904ced9729b17ded%3A0x8434a259867eade!2sAv.%20Mariscal%20Ramon%20Castilla%20487%2C%20Lambayeque%2014013!5e0!3m2!1ses-419!2spe!4v1735012991853!5m2!1ses-419!2spe"
                        width="100%" height="100%" style="border:0;" allowfullscreen="" loading="lazy">
                </iframe>
            </div>
        </div>
    </div>
</section>

<%@ include file="footer.jsp" %>

<!--Enlace de Bootstrap JavaScript-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>

<script src="js/index.js"></script>
</body>

</html>