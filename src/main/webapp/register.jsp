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
    <link rel="stylesheet" href="css/register.css">
    <!-- Enlace de CSS Fondo -->
    <link rel="stylesheet" href="css/background.css">
    <!-- FontAwesome CDN -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>

<body>

<%@ include file="header.jsp" %>

<main class="row container-fluid bg-main d-flex justify-content-center align-items-center">
    <!-- Texto -->
    <div class="col-12 col-md-6 d-flex flex-column text-center text-light text-primary-emphasis my-2">
        <h1 class="mt-3">Únete a la comunidad</h1>
        <h5 class="mt-3">Inicia tu camino hacia el éxito agrícola con <strong>MASAVI</strong></h5>
    </div>

    <!-- Formulario de registro -->
    <div class="col-12 col-md-6 d-flex justify-content-center align-items-center my-2">
        <div class="register-container">
            <!-- Encabezado -->
            <h2 class="text-center mb-4">Crear Cuenta</h2>

            <!-- Formulario -->
            <form id="register-form" action="user" method="post">
                <input type="hidden" name="accion" value="Registrar">
                <!-- Nombre cliente -->
                <div class="mb-3">
                    <label for="nombre" class="form-label">Nombre del Cliente</label>
                    <input type="text" class="form-control" name="nombre" id="nombre" placeholder="Ingrese su Nombre" required>
                </div>
                <!-- Apellido cliente -->
                <div class="mb-3">
                    <label for="apellido" class="form-label">Apellidos del Cliente</label>
                    <input type="text" class="form-control" name="apellido" id="apellido" placeholder="Ingrese sus Apellidos" required>
                </div>

                <!-- Campo de teléfono -->
                <div class="mb-3">
                    <label for="telefono" class="form-label">Teléfono</label>
                    <input type="text" class="form-control" name="telefono" id="telefono" placeholder="Ingrese su teléfono" required>
                </div>

                <!-- Campo de Dirección -->
                <div class="mb-3">
                    <label for="direccion" class="form-label">Dirección</label>
                    <input type="text" class="form-control" name="direccion" id="direccion" placeholder="Ingrese su dirección" required>
                </div>

                <!-- Campo de correo electrónico -->
                <div class="mb-3">
                    <label for="email" class="form-label">Correo Electrónico</label>
                    <input type="email" class="form-control" name="email" id="email" placeholder="Ingrese su correo electrónico" required>
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

                <!-- Campo de confirmación de contraseña -->
                <div class="mb-3 position-relative">
                    <label for="confirm-password" class="form-label">Confirmar Contraseña</label>
                    <input type="password" class="form-control" id="confirm-password" placeholder="Confirme su contraseña" required>
                    <i id="toggle-confirm-password" class="fa fa-eye"></i>
                </div>

                <!-- Botón de registro -->
                <button type="submit" class="btn btn-success w-100" id="btnRegistrar">Registrar</button>

                <!-- Enlace para iniciar sesión -->
                <p class="text-center mt-3 mb-0">
                    ¿Ya tiene cuenta? <a href="login.jsp" class="text-black">Inicie sesión</a>
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
<script src="js/register.js"></script>

<!--Enlace de JavaScript - SweetAlert2-->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

</body>

</html>
