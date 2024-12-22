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
});


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
