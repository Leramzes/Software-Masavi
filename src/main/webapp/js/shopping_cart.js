document.addEventListener("DOMContentLoaded", function () {
    // Seleccionar todos los inputs de cantidad
    const quantityInputs = document.querySelectorAll("#cantidad-producto");

    quantityInputs.forEach(input => {
        input.addEventListener("input", function () {
            const row = input.closest("tr"); // Encontrar la fila del producto
            const productId = row.getAttribute("data-product-id");
            const unitPrice = parseFloat(row.getAttribute("data-unit-price"));
            const newQuantity = parseInt(input.value);

            // Calcular el nuevo precio total
            const newTotalPrice = unitPrice * newQuantity;

            // Actualizar la celda del precio total
            const priceCell = document.getElementById(`priceTotal-${productId}`);
            priceCell.innerHTML = `S/ ${newTotalPrice.toFixed(2)}`;

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