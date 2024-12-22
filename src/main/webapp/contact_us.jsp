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
    <link rel="stylesheet" href="css/contact_us.css">
    <!--Enlace de CSS Fondo-->
    <link rel="stylesheet" href="css/background.css">
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
                        <a class="nav-link" aria-current="page" href="index.jsp">Inicio</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Nosotros</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Productos</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="contact_us.jsp">Contáctanos</a>
                    </li>
                </ul>

                <!-- Botón de iniciar sesión alineado a la derecha -->
                <a href="login.jsp" class="btn rounded-pill border">Iniciar Sesión</a>
            </div>
        </div>
    </nav>
</header>

<main class="container-fluid bg-main">
    <div class="row w-100 d-flex justify-content-center align-items-center">
        <!-- Texto -->
        <div class="col-6 d-flex flex-column text-center text-light align-items-center">
            <h1>Lorem ipsum dolor sit amet</h1>
            <h5>Lorem ipsum dolor sit amet consectetur.</h5>
        </div>

        <!-- Formulario de contacto -->
        <div class="col-6 d-flex p-4 justify-content-center align-items-center">
            <div class="w-75 p-4 bg-light rounded shadow">
                <!-- Encabezado -->
                <h2 class="text-center mb-4">Contáctanos</h2>

                <!-- Formulario -->
                <form id="contact-form">
                    <!-- Campo de Nombre Completo -->
                    <div class="mb-3">
                        <label for="full-name" class="form-label">Nombre Completo</label>
                        <input type="text" class="form-control" id="full-name" placeholder="Ingrese su nombre completo" required>
                    </div>

                    <!-- Campo de Correo Electrónica -->
                    <div class="mb-3">
                        <label for="email" class="form-label">Correo Electrónico</label>
                        <input type="email" class="form-control" id="email" placeholder="Ingrese su correo electrónico" required>
                        <div id="email-error" class="text-danger mt-1" style="display: none;">
                            El correo debe ser de Gmail o Hotmail y tener un formato válido.
                        </div>
                    </div>

                    <!-- Campo de Telefono -->
                    <div class="mb-3">
                        <label for="phone" class="form-label">Celular</label>
                        <input type="tel" class="form-control" id="phone" placeholder="Ingrese su número de celular" required>
                        <div id="phone-error" class="text-danger mt-1" style="display: none;">
                            El número de celular debe tener el formato válido (ejemplo: 123-456-789).
                        </div>
                    </div>

                    <!-- Campo de Mensaje -->
                    <div class="mb-3">
                        <label for="message" class="form-label">Mensaje</label>
                        <textarea class="form-control" id="message" rows="4" placeholder="Escriba su mensaje" required></textarea>
                    </div>

                    <!-- Botón de enviar -->
                    <button type="submit" class="btn btn-success w-100">Enviar</button>
                </form>
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
<!--Enlace de JavaScript-->
<script src="js/contact_us.js"></script>

</body>

</html>
