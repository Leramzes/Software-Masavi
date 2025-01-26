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
