<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <link rel="stylesheet" href="css/login.css">
    <!-- Enlace de CSS Background -->
    <link rel="stylesheet" href="css/background.css">
    <!-- FontAwesome CDN -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>

<body>

<%@ include file="header.jsp" %>

<main class="row w-100 container-fluid bg-main d-flex align-items-center justify-content-center">
    <!-- Texto -->
    <div class="col-12 col-md-6 d-flex flex-column text-center text-light align-items-center">
        <h1>Lorem ipsum dolor sit amet</h1>
        <h5>Lorem ipsum dolor sit amet consectetur.</h5>
    </div>

    <!-- Formulario de inicio de sesión -->
    <div class="col-12 col-md-6 d-flex justify-content-center align-items-center">
        <div class="w-75 p-4 bg-light rounded shadow">
            <!-- Encabezado -->
            <h2 class="text-center mb-4">Iniciar Sesión</h2>

            <!-- Formulario -->
            <form id="login-form" action="validar" method="post">
                <input type="hidden" name="accion" value="Ingresar">
                <!-- Campo de correo electrónica -->
                <div class="mb-3">
                    <label for="email" class="form-label">Correo Electrónico</label>
                    <input type="email" class="form-control" name="email" id="email" placeholder="Ingrese su correo electrónico"
                           required>
                    <div id="email-error" class="text-danger mt-1" style="display: none;">
                        El correo debe ser de Gmail o Hotmail y tener un formato válido.
                    </div>
                </div>

                <!-- Campo de contraseña -->
                <div class="mb-3 position-relative">
                    <label for="password" class="form-label">Contraseña</label>
                    <input type="password" class="form-control" name="password" id="password" placeholder="Ingrese su contraseña" required>
                    <i id="toggle-password" class="fa fa-eye"></i>
                </div>

                <!-- Botón de inicio de sesión -->
                <button type="submit" class="btn btn-success w-100">Iniciar Sesión</button>

                <!-- Enlace a la página de registro -->
                <p class="text-center mt-3 mb-0">
                    ¿No tiene cuenta? <a href="register.jsp" class="text-black">Regístrese</a>
                </p>
            </form>
        </div>
    </div>
</main>

<%@ include file="footer.jsp" %>

<!--Enlace de Bootstrap JavaScript-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>

<!--Enlace de JavaScript-->
<script src="js/login.js"></script>

</body>

</html>
