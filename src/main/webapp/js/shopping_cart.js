// Función para actualizar la cantidad
function updateQuantity(button, change) {
    const input = button.parentElement.querySelector("input");
    let currentValue = parseInt(input.value) || 0;

    // Asegurarse de que no baje de 1
    currentValue = Math.max(1, currentValue + change);
    input.value = currentValue;
}

// Validar manualmente la cantidad ingresada por el usuario
function validateQuantity(input) {
    let value = parseInt(input.value) || 1;

    // Asegurarse de que sea un número positivo mayor o igual a 1
    input.value = Math.max(1, value);
}
