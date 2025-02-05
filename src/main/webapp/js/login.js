// Validación de correo
document.getElementById("login-form").addEventListener("submit", function (e) {
    const emailInput = document.getElementById("email");
    const emailError = document.getElementById("email-error");
    const emailPattern = /^[a-zA-Z0-9._%+-]+@(gmail|hotmail)\.com$/;

    if (!emailPattern.test(emailInput.value)) {
        e.preventDefault(); // Detiene el envío del formulario
        emailError.style.display = "block"; // Muestra el mensaje de error
    } else {
        emailError.style.display = "none"; // Oculta el mensaje de error si es válido
    }

    e.preventDefault();

    // Simula una validación exitosa antes de redirigir
    Swal.fire({
        title: "¡Inicio de sesión exitoso!",
        text: "Serás redirigido a la página principal.",
        icon: "success",
        timer: 2000, // Tiempo antes de redirigir
        showConfirmButton: false
    }).then(() => {
        Swal.fire({
            title: 'Redirigiendo...',
            text: 'Espere un momento.',
            allowOutsideClick: false,
            didOpen: () => {
                Swal.showLoading();
            }
        });

        // Simula un pequeño retraso para que se vea el efecto de carga
        setTimeout(() => {
            document.getElementById("login-form").submit(); // Envía el formulario
        }, 2000); // Ajusta el tiempo si es necesario
    });
});

// Validación de contraseña
document.getElementById("toggle-password").addEventListener("click", function () {
    const passwordField = document.getElementById("password");
    const passwordIcon = document.getElementById("toggle-password");

    // Cambiar tipo de input
    if (passwordField.type === "password") {
        passwordField.type = "text";
        passwordIcon.classList.remove("fa-eye"); // Remover ícono de ojo
        passwordIcon.classList.add("fa-eye-slash"); // Agregar ícono de ojo tachado
    } else {
        passwordField.type = "password";
        passwordIcon.classList.remove("fa-eye-slash"); // Remover ícono de ojo tachado
        passwordIcon.classList.add("fa-eye"); // Agregar ícono de ojo
    }
});
