/*
document.addEventListener('DOMContentLoaded', () => {
    const emailInput = document.getElementById('email');
    const phoneInput = document.getElementById('phone');
    const fullNameInput = document.getElementById('full-name');
    const messageInput = document.getElementById('message');
    const emailError = document.getElementById('email-error');
    const phoneError = document.getElementById('phone-error');

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

    // Validación de número de celular
    phoneInput.addEventListener('input', () => {
        const phoneValue = phoneInput.value;
        const phoneRegex = /^[0-9]{9}$/;
        if (!phoneRegex.test(phoneValue)) {
            phoneError.style.display = 'block';
        } else {
            phoneError.style.display = 'none';
        }
    });

    // Enviar formulario
    document.getElementById('contact-form').addEventListener('submit', (e) => {
        e.preventDefault();

        // Validaciones finales antes de enviar
        if (emailError.style.display === 'none' && phoneError.style.display === 'none' && fullNameInput.value.trim() !== '' && messageInput.value.trim() !== '') {
            alert("Mensaje enviado correctamente.");
            // Aquí iría la lógica para enviar el mensaje (por ejemplo, enviar a un servidor)
        } else {
            alert("Por favor, corrija los errores antes de enviar el formulario.");
        }
    });
});
*/
