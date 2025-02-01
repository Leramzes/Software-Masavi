document.addEventListener("DOMContentLoaded", function () {
    // Seleccionar todos los inputs de cantidad
    const quantityInputs = document.querySelectorAll("#cantidad-producto");


    // Evento para cada input de cantidad
    quantityInputs.forEach(input => {
        input.addEventListener("input", function () {
            const row = input.closest("tr"); // Encontrar la fila del producto
            const productId = row.getAttribute("data-product-id");
            const unitPrice = parseFloat(row.getAttribute("data-unit-price"));
            const newQuantity = parseInt(input.value);

            // Calcular el nuevo precio total del producto
            const newTotalPrice = unitPrice * newQuantity;

            // Actualizar la celda del precio total del producto
            const priceCell = document.querySelector(`#priceTotal-${productId}`);
            priceCell.innerHTML = `S/ ${newTotalPrice.toFixed(2)}`;

            let unidadesTotales= 0;

            // Recalcular el total final (suma de todos los productos)
            let sumaSubTotalPrice = 0;
            document.querySelectorAll("#cantidad-producto").forEach(input => {
                const fila = input.closest("tr");
                const precioUnitario = parseFloat(fila.getAttribute("data-unit-price"));
                const cantidad = parseInt(input.value);
                sumaSubTotalPrice += precioUnitario * cantidad;

                let quantityXproduct = document.querySelector(`#quantityXproduct-${productId}`);
                quantityXproduct.innerHTML = `${newQuantity}`;

                let subtotalXproduct = document.querySelector(`#subtotalXproduct-${productId}`);
                subtotalXproduct.innerHTML = `&nbsp;S/ ${newTotalPrice.toFixed(2)}`;

                unidadesTotales += cantidad;
            });
            // Actualizar el total de unidades final en el DOM
            const totalCantidadProductos = document.querySelector("#total-quantity");
            totalCantidadProductos.innerHTML = unidadesTotales;

            // Actualizar el subtotal final en el DOM
            const subtotal_final = document.querySelector("#sub-total");
            subtotal_final.innerHTML = `S/ ${sumaSubTotalPrice.toFixed(2)}`;

            // Actualizar el igv final en el DOM
            const igvFinal = document.querySelector("#igv");
            let igvTotal = (sumaSubTotalPrice * 0.18).toFixed(2);
            igvFinal.innerHTML = `S/ ${igvTotal}`;

            // Actualizar el total final en el DOM
            const total_final = document.querySelector("#total-final");
            let totalPrecioPago = (sumaSubTotalPrice + parseFloat(igvTotal)).toFixed(2);
            total_final.innerHTML = `S/ ${totalPrecioPago}`;

            // Opcional: Enviar la actualización al servidor
            $.ajax({
                url: "cart",
                type: "POST", // Cambiamos a POST
                data: {
                    productId: productId,
                    quantity: newQuantity,
                    action: "update"
                },
                success: function (result) {
                    console.log("Actualización enviada al servidor");
                },
                error: function (xhr, status, error) {
                    console.error("Error al actualizar el carrito:", error);
                }
            });
        });
    });
});

// Lógica para mensaje de alerta si en caso el carrito de items esta vació y quiera pagar
document.querySelectorAll('.btnRegistrarDisabled').forEach(button => {
    button.addEventListener('click', function(event) {
        event.preventDefault(); // Previene el envío del formulario o cualquier acción por defecto

        // Mostrar la alerta de confirmación
        Swal.fire({
            icon: 'warning',  // Icono de advertencia
            title: 'CARRITO VACIÓ',
            text: 'Para poder continuar con la compra debe elegir al menos 1 producto',
            showConfirmButton: true,  // Muestra un botón de aceptar
            confirmButtonColor: '#d33',  // Color del botón de confirmar (rojo)
        });
    });
});

// Evento para el botón "Eliminar producto"
document.querySelectorAll('.delete-product').forEach(button => {
    button.addEventListener('click', function(event) {
        event.preventDefault(); // Previene el envío del formulario o cualquier acción por defecto

        // Mostrar la alerta de confirmación
        Swal.fire({
            icon: 'warning',  // Icono de advertencia
            title: '¿Estás seguro?',
            text: '¡Esta acción no se puede deshacer!',
            showCancelButton: true,  // Muestra un botón de cancelar
            confirmButtonText: 'Eliminar',  // Texto del botón de confirmación
            cancelButtonText: 'Cancelar',  // Texto del botón de cancelación
            confirmButtonColor: '#d33',  // Color del botón de confirmar (rojo)
            cancelButtonColor: '#3085d6',  // Color del botón de cancelar (azul)
        }).then((result) => {
            if (result.isConfirmed) {
                // Acción cuando el usuario confirma la eliminación
                Swal.fire({
                    icon: 'success',
                    title: '¡Eliminado!',
                    text: 'El producto ha sido eliminado.',
                    timer: 1500,  // Espera de 3 segundos (3000 milisegundos)
                    timerProgressBar: true,  // Muestra la barra de progreso
                    didClose: () => {
                        // Aquí puedes agregar la lógica para eliminar el producto
                        // Por ejemplo, hacer una llamada a un servidor o eliminar el producto de la UI

                        // Obtener el formulario más cercano al botón de eliminación
                        const form = event.target.closest('form');

                        // Enviar el formulario de eliminación
                        form.submit();  // Enviar el formulario para eliminar el producto
                    }
                });

            } else if (result.dismiss === Swal.DismissReason.cancel) {
                // Acción cuando el usuario cancela
                Swal.fire({
                    icon: 'info',
                    title: 'Cancelado',
                    text: 'Acciòn cancelada.',
                    timer: 1500,  // Espera de 3 segundos (3000 milisegundos)
                    timerProgressBar: true  // Muestra la barra de progreso
                });
            }
        });
    });
});

// Evento para el botón "Registrar"
document.querySelectorAll('#btnRegistrar').forEach(button => {
    button.addEventListener('click', function(event) {
        event.preventDefault();
        Swal.fire({
            title: 'Redirigiendo',
            text: "Para continuar con la compra debe registrarse.",
            timer: 3000, // Tiempo en milisegundos antes de redirigir
            showConfirmButton: false,
            willOpen: () => {
                Swal.showLoading(); // Spinner de carga integrada
            },
            willClose: () => {
                // Redirige después de que la alerta se cierre
                window.location.href = 'login.jsp';
            }
        });
    });
});

// Evento para el botón "Confirmar Método de Pago"
document.getElementById('confirmPaymentMethod').addEventListener('click', function () {
    const selectedMethod = document.querySelector('input[name="paymentMethod"]:checked');
    const alertMessage = document.getElementById('alertMessage');

    if (!selectedMethod) {
        alertMessage.classList.remove('d-none');
        return;
    }

    alertMessage.classList.add('d-none');
    const method = selectedMethod.value;

    const modals = {
        'Tarjeta': 'creditCardModal',
        'Yape': 'yapeModal',
        'Plin': 'plinModal'
    };

    const modalId = modals[method];

    if (!modalId) {
        console.error("Método no válido:", method);
        alertMessage.classList.remove('d-none');
        return;
    }

    // Ocultar modal actual de forma segura
    const paymentModal = bootstrap.Modal.getOrCreateInstance(document.getElementById('paymentModal'));
    paymentModal.hide();

    // Mostrar siguiente modal
    const nextModal = bootstrap.Modal.getOrCreateInstance(document.getElementById(modalId));
    nextModal.show();
});

// Botones de "Atrás"
document.getElementById('backToPaymentMethods').addEventListener('click', function () {
    const cardModal = bootstrap.Modal.getInstance(document.getElementById('creditCardModal'));
    cardModal.hide();
    const paymentModal = new bootstrap.Modal(document.getElementById('paymentModal'));
    paymentModal.show();
});
document.getElementById('backToPaymentMethodsYape').addEventListener('click', function () {
    const yapeModal = bootstrap.Modal.getInstance(document.getElementById('yapeModal'));
    yapeModal.hide();
    const paymentModal = new bootstrap.Modal(document.getElementById('paymentModal'));
    paymentModal.show();
});
document.getElementById('backToPaymentMethodsPlin').addEventListener('click', function () {
    const plinModal = bootstrap.Modal.getInstance(document.getElementById('plinModal'));
    plinModal.hide();
    const paymentModal = new bootstrap.Modal(document.getElementById('paymentModal'));
    paymentModal.show();
});

// Validación de formato para el número de tarjeta
const cardNumberInput = document.getElementById('cardNumber');
cardNumberInput.addEventListener('input', function (e) {
    let value = e.target.value.replace(/[^0-9]/g, '').substring(0, 16);
    value = value.match(/.{1,4}/g)?.join('-') || value;
    e.target.value = value;
});

// Validación y formato para la fecha de expiración
const expirationDateInput = document.getElementById('expirationDate');
expirationDateInput.addEventListener('input', function (e) {
    let value = e.target.value.replace(/[^0-9]/g, '').substring(0, 4);
    if (value.length >= 3) {
        value = value.substring(0, 2) + '/' + value.substring(2, 4);
    }
    e.target.value = value;
});

// Agregar calendario para la fecha de expiración
new Datepicker(expirationDateInput, {
    format: 'mm/yy',
    minViewMode: 1,
    autoclose: true,
    startDate: new Date()
});

// Validación de CVV
const cvvInput = document.getElementById('cvv');
cvvInput.addEventListener('input', function (e) {
    e.target.value = e.target.value.replace(/[^0-9]/g, '').substring(0, 3);
});