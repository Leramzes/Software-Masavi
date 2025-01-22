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


            // Recalcular el total final (suma de todos los productos)
            let sumaTotalPrice = 0;
            document.querySelectorAll("#cantidad-producto").forEach(input => {
                const fila = input.closest("tr");
                const precioUnitario = parseFloat(fila.getAttribute("data-unit-price"));
                const cantidad = parseInt(input.value);
                sumaTotalPrice += precioUnitario * cantidad;

                let subtotalXproduct = document.querySelector(`#subtotalXproduct-${productId}`);
                subtotalXproduct.innerHTML = `S/ ${newTotalPrice.toFixed(2)}`;
            });


            // Actualizar el total final en el DOM
            const total_final = document.querySelector("#total-final");
            total_final.innerHTML = `S/ ${sumaTotalPrice.toFixed(2)}`;

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
