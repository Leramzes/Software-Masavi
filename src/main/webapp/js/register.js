document.addEventListener("DOMContentLoaded", () => {
    const emailInput = document.getElementById("email");
    const emailError = document.getElementById("email-error");
    const passwordInput = document.getElementById("password");
    const confirmPasswordInput = document.getElementById("confirm-password");
    const telefonoInput = document.getElementById("telefono");

    // Validación de correo electrónico (Gmail y Hotmail)
    emailInput.addEventListener("input", () => {
        const emailPattern = /^[a-zA-Z0-9._%+-]+@(gmail|hotmail)\.com$/;
        if (!emailPattern.test(emailInput.value)) {
            emailError.style.display = "block";
        } else {
            emailError.style.display = "none";
        }
    });

    // Validación de número de celular
    telefonoInput.addEventListener("input", () => {
        let telefono = telefonoInput.value.replace(/\D/g, ""); // Eliminar caracteres no numéricos
        const telefonoError = document.getElementById("telefono-error");

        if (!telefonoError) {
            const errorDiv = document.createElement("div");
            errorDiv.id = "telefono-error";
            errorDiv.classList.add("text-danger", "mt-1");
            telefonoInput.parentNode.appendChild(errorDiv);
        }

        // Aplicar formato +51 (XXX-XXX-XXX)
        if (telefono.startsWith("51")) {
            telefono = "+51 " + telefono.substring(2).replace(/(\d{3})(\d{3})(\d{3})/, "($1-$2-$3)");
        } else {
            telefono = "+51 ";
        }
        telefonoInput.value = telefono;

        // Validar formato correcto
        const telefonoPattern = /^\+51\s\(\d{3}-\d{3}-\d{3}\)$/;
        if (!telefonoPattern.test(telefonoInput.value)) {
            document.getElementById("telefono-error").textContent = "Formato inválido. Use: +51 (123-456-789)";
        } else {
            document.getElementById("telefono-error").textContent = "";
        }
    });

    // Evento para mostrar el Sweetalert al enviar el formulario
    document.getElementById("register-form").addEventListener("submit", (e) => {
        e.preventDefault();

        // Validar que las contraseñas coincidan antes de enviar
        if (passwordInput.value !== confirmPasswordInput.value) {
            Swal.fire({
                title: "Error",
                text: "Las contraseñas no coinciden.",
                icon: "error",
                confirmButtonText: "Aceptar",
            });
            return;
        }

        Swal.fire({
            title: "Registrando...",
            text: "Por favor, espere.",
            allowOutsideClick: false,
            didOpen: () => {
                Swal.showLoading();
            },
            showConfirmButton: false,
        });

        setTimeout(() => {
            Swal.fire({
                title: "¡Registro exitoso!",
                text: "Serás redirigido a la página de Iniciar Sesión.",
                icon: "success",
                timer: 2000,
                showConfirmButton: false,
            });

            setTimeout(() => {
                document.getElementById("register-form").submit();
            }, 2000);
        }, 2000);
    });

    // Mostrar u ocultar Contraseña
    document.getElementById("toggle-password").addEventListener("click", () => {
        togglePasswordVisibility("password", "toggle-password");
    });

    document.getElementById("toggle-confirm-password").addEventListener("click", () => {
        togglePasswordVisibility("confirm-password", "toggle-confirm-password");
    });

    function togglePasswordVisibility(inputId, iconId) {
        const passwordField = document.getElementById(inputId);
        const icon = document.getElementById(iconId);

        if (passwordField.type === "password") {
            passwordField.type = "text";
            icon.classList.remove("fa-eye");
            icon.classList.add("fa-eye-slash");
        } else {
            passwordField.type = "password";
            icon.classList.remove("fa-eye-slash");
            icon.classList.add("fa-eye");
        }
    }
});