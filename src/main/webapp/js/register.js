document.addEventListener('DOMContentLoaded', () => {
    const emailInput = document.getElementById('email');
    const usernameInput = document.getElementById('username');
    const passwordInput = document.getElementById('password');
    const confirmPasswordInput = document.getElementById('confirm-password');
    const passwordStrengthBar = document.getElementById('password-bar');
    const passwordFeedback = document.getElementById('password-feedback');
    const emailError = document.getElementById('email-error');
    const usernameError = document.getElementById('username-error');
    const confirmPasswordError = document.getElementById('confirm-password-error');

    const existingUsernames = ["user1", "admin", "testuser"]; // Simulación de usuarios preexistentes

    // Validación de correo
    emailInput.addEventListener('input', () => {
        const emailValue = emailInput.value;
        const emailRegex = /^[a-zA-Z0-9._%+-]+@(gmail\.com|hotmail\.com)$/;
        if (!emailRegex.test(emailValue)) {
            emailError.style.display = 'block';
        } else {
            emailError.style.display = 'none';
        }
    });

    // Validación de nombre de usuario
    usernameInput.addEventListener('input', () => {
        const usernameValue = usernameInput.value;
        if (existingUsernames.includes(usernameValue)) {
            usernameError.style.display = 'block';
        } else {
            usernameError.style.display = 'none';
        }
    });

    // Validación de la seguridad de la contraseña
    passwordInput.addEventListener('input', () => {
        const passwordValue = passwordInput.value;
        const strength = calculatePasswordStrength(passwordValue);
        updatePasswordStrengthBar(strength);
    });

    // Contraseñas coincidentes
    confirmPasswordInput.addEventListener('input', () => {
        const passwordValue = passwordInput.value;
        const confirmPasswordValue = confirmPasswordInput.value;
        if (passwordValue !== confirmPasswordValue) {
            confirmPasswordError.style.display = 'block';
        } else {
            confirmPasswordError.style.display = 'none';
        }
    });

    // Función para calcular la fuerza de la contraseña
    function calculatePasswordStrength(password) {
        let strength = 0;
        if (password.length >= 8) strength += 25;
        if (/[A-Z]/.test(password)) strength += 25;
        if (/[0-9]/.test(password)) strength += 25;
        if (/[^A-Za-z0-9]/.test(password)) strength += 25;
        return strength;
    }

    // Función para actualizar la barra de seguridad de la contraseña
    function updatePasswordStrengthBar(strength) {
        passwordStrengthBar.style.width = strength + '%';
        if (strength < 50) {
            passwordFeedback.textContent = 'Contraseña débil';
            passwordFeedback.style.color = 'red';
        } else if (strength < 75) {
            passwordFeedback.textContent = 'Contraseña media';
            passwordFeedback.style.color = 'orange';
        } else {
            passwordFeedback.textContent = 'Contraseña fuerte';
            passwordFeedback.style.color = 'green';
        }
    }

    // Mostrar u ocultar contraseñas
    const togglePassword = document.getElementById('toggle-password');
    const toggleConfirmPassword = document.getElementById('toggle-confirm-password');

    togglePassword.addEventListener('click', () => {
        if (passwordInput.type === 'password') {
            passwordInput.type = 'text';
            togglePassword.classList.replace('fa-eye', 'fa-eye-slash');
        } else {
            passwordInput.type = 'password';
            togglePassword.classList.replace('fa-eye-slash', 'fa-eye');
        }
    });

    toggleConfirmPassword.addEventListener('click', () => {
        if (confirmPasswordInput.type === 'password') {
            confirmPasswordInput.type = 'text';
            toggleConfirmPassword.classList.replace('fa-eye', 'fa-eye-slash');
        } else {
            confirmPasswordInput.type = 'password';
            toggleConfirmPassword.classList.replace('fa-eye-slash', 'fa-eye');
        }
    });

    // Enviar formulario
    document.getElementById('register-form').addEventListener('submit', (e) => {
        e.preventDefault();

        // Validaciones finales antes de enviar
        if (emailError.style.display === 'none' && usernameError.style.display === 'none' && confirmPasswordError.style.display === 'none' && passwordStrengthBar.style.width === '100%') {
            alert("Registro exitoso.");
            // Aquí va la lógica para registrar al usuario (enviar a servidor, etc.)
        } else {
            alert("Por favor, corrija los errores antes de registrar.");
        }
    });
});
