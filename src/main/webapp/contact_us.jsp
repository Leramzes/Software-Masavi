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

<%@ include file="header.jsp" %>

<main class="container-fluid bg-main">
    <div class="row w-100 d-flex justify-content-center align-items-center">
        <!-- Texto -->
        <div class="col-lg-6 col-md-6 col-sm-12 d-flex flex-column text-center text-primary-emphasis">
            <h1 class="mt-3">Contáctanos y haz crecer tu cultivo</h1>
            <h5 class="mt-3">Estamos aquí para ayudarte. Completa el formulario y nos pondremos en contacto contigo lo antes posible</h5>
        </div>

        <!-- Formulario de Contactanos-->
        <div class="col-lg-6 col-md-6 col-sm-12 d-flex p-4 justify-content-center align-items-center">
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

                    <!-- Campo de Correo Electrónico -->
                    <div class="mb-3">
                        <label for="email" class="form-label">Correo Electrónico</label>
                        <input type="email" class="form-control" id="email" placeholder="Ingrese su correo electrónico" required>
                        <div id="email-error" class="text-danger mt-1" style="display: none;">
                            El correo debe ser de Gmail o Hotmail y tener un formato válido.
                        </div>
                    </div>

                    <!-- Campo de Celular -->
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

                    <!-- Botón de Enviar -->
                    <button type="submit" class="btn btn-success w-100">Enviar</button>
                </form>
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
<script src="js/contact_us.js"></script>

</body>

</html>
