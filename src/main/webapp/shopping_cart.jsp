<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="development.team.software_masavi.Model.CartItem" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Masavi</title>
    <script src="js/shopping_cart.js" defer></script>
    <script src="js/jquery-3.7.1.js"></script>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <!-- Global CSS -->
    <link rel="stylesheet" href="css/global.css">
    <!-- Specific CSS -->
    <link rel="stylesheet" href="css/shopping_cart.css">
    <!-- Background CSS -->
    <link rel="stylesheet" href="css/background.css">
    <!-- FontAwesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>

<body>

<%@ include file="header.jsp" %>

<%
    List<CartItem> cartItems = (List<CartItem>) request.getAttribute("cartItems");

%>

<main class="bg-main align-content-center align-items-center">
    <div class="container-fluid my-2">
        <div class="row">
            <!-- Carrito de Compra -->
            <div class="col-12 col-md-8 mb-4">
                <!-- Encabezado -->
                <h2 class="fw-bold text-primary-emphasis mb-4">Carrito de Compra:</h2>

                <!-- Mensaje si el carrito está vacío -->
                <% if (cartItems == null || cartItems.isEmpty()) { %>
                <div class="alert alert-warning d-flex align-items-center" role="alert">
                    <div>
                        <strong>¡Vaya!</strong> Tu carrito está vacío.
                        <form action="product" method="post">
                            <button class="btn btn-success mt-3" type="submit">
                                <i class="fa-solid fa-arrow-right me-2"></i> ¡Explora nuestros productos ahora!
                            </button>
                        </form>
                    </div>
                </div>
                <% } else { %>

                <div class="card p-3">
                    <div class="table-responsive" style="max-height: 500px; overflow-y: auto;">
                        <table class="table table-striped table-bordered align-middle">
                            <thead class="table-success text-center">
                            <tr>
                                <th scope="col">N°</th>
                                <th scope="col">Imagen</th>
                                <th scope="col">Nombre del Producto</th>
                                <th scope="col">Cantidad</th>
                                <th scope="col">Precio Total</th>
                                <th scope="col">Acciones</th>
                            </tr>
                            </thead>
                            <tbody>

                            <!-- Cuerpo de la Tabla -->
                            <%
                                int contador = 1;
                                for (CartItem item : cartItems) {
                            %>
                            <tr data-product-id="<%= item.getProduct().getId() %>" data-unit-price="<%= item.getProduct().getPrice() %>">
                                <!-- N° -->
                                <td class="text-center"><%= contador++ %></td>

                                <!-- Imagen -->
                                <td>
                                    <div class="d-flex align-items-center justify-content-center">
                                        <img src="<%= item.getProduct().getImage() %>"
                                             alt="<%= item.getProduct().getName() %>"
                                             class="img-fluid rounded" style="width: 80px; height: 80px;">
                                    </div>
                                </td>

                                <!-- Nombre del Producto -->
                                <td>
                                    <strong><%= item.getProduct().getName() %></strong><br>
                                    <small class="text-muted"><%= item.getProduct().getDescription() %></small>
                                </td>

                                <!-- Cantidad -->
                                <td class="text-center">
                                    <input type="hidden" class="objetoProducto" value="<%=item.getProduct().getId()%>">
                                    <input type="number" class="form-control text-center mx-1" id="cantidad-producto" style="width: 60px;"
                                           value="<%= item.getQuantity() %>" min="1">
                                </td>


                                <!-- Precio Total -->
                                <td class="text-center price-total" id="priceTotal-<%= item.getProduct().getId() %>">
                                    S/ <%= item.getProduct().getPrice() * item.getQuantity() %>
                                </td>

                                <!-- Acciones -->
                                <td class="text-center">
                                    <form action="cart" method="post">
                                        <input type="hidden" name="productId" value="<%= item.getProduct().getId() %>">
                                        <input type="hidden" name="quantity" value="1">
                                        <input type="hidden" name="action" value="remove">
                                        <button id="delete-button" type="submit" class="btn btn-danger btn-sm delete-product">
                                            <i class="fa fa-trash"></i> Eliminar
                                        </button>
                                    </form>
                                </td>
                            </tr>
                            <% } %>
                            </tbody>
                        </table>
                    </div>
                </div>

                <% } %>
            </div>

            <!-- Resumen de Compra -->
            <div class="col-12 col-md-4">
                <h2 class="fw-bold text-center text-primary-emphasis mb-4">Resumen</h2>

                <div class="summary card p-3">

                    <!-- Detalle -->
                    <div class="d-flex justify-content-between">
                        <p class="fw-bold">Detalle</p>
                        <p></p>
                        <div class="d-flex flex-column align-items-end">
                            <% for (CartItem item : cartItems) { %>
                            <p id="descuento" class="text"><%= item %> </p>
                            <% } %>
                        </div>

                    </div>

                    <!-- Total Final -->
                    <div class="d-flex justify-content-between">
                        <p class="fw-bold">Total: <%=ses.getAttribute("quantityTotal") %></p>
                        <p id="total-final" class="fw-bold">S/ <%=ses.getAttribute("TotalPago")%></p>
                    </div>

                    <!-- Continuar Compra -->
                    <form action="#" method="post">
                        <button class="btn btn-success w-100 mt-3">Continuar Compra</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</main>

<%@ include file="footer.jsp" %>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

<!--Enlace de JavaScript - SweetAlert2-->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>
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
</script>

</body>

</html>
