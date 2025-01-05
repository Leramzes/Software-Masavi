<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="development.team.software_masavi.Model.CartItem" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Masavi</title>
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
    Double total = (Double) request.getAttribute("total");
    Double descuento = (Double) request.getAttribute("descuento");
%>

<main class="bg-main align-content-center align-items-center">
    <div class="container-fluid my-2">
        <div class="row">
            <!-- Carrito de Compra -->
            <div class="col-12 col-md-8 mb-4">
                <h2 class="fw-bold text-primary-emphasis mb-4">Carrito de Compra:</h2>

                <% if (cartItems == null || cartItems.isEmpty()) { %>
                <div class="alert alert-warning" role="alert">
                    Tu carrito está vacío.
                    <form action="product" method="post">
                        <button class="btn btn-primary mt-2" type="submit">¡Explora nuestros productos ahora!</button>
                    </form>
                </div>
                <% } else { %>
                <div class="card p-3">
                    <% for (CartItem item : cartItems) { %>
                    <div class="product-item d-flex align-items-center mb-3">
                        <!-- Imagen del Producto -->
                        <img src="<%= item.getProduct().getImage() %>" alt="<%= item.getProduct().getName() %>"
                             class="img-fluid rounded" style="width: 80px; height: 80px;">

                        <!-- Detalles del Producto -->
                        <div class="flex-grow-1 px-3">
                            <h5 class="text-black fw-bold"><%= item.getProduct().getName() %></h5>
                            <p class="text-muted mb-0"><%= item.getProduct().getDescription() %></p>
                        </div>

                        <!-- Precio del Producto -->
                        <div class="text-end me-3">
                            <p class="text-black fw-bold mb-0">S/ <%= item.getProduct().getPrice() %></p>
                        </div>

                        <!-- Cantidad del Producto -->
                        <div class="quantity-control">
                            <button class="btn btn-outline-secondary btn-sm" onclick="updateQuantity(this, -1)">-</button>
                            <input type="text" class="form-control text-center mx-1" value="<%= item.getQuantity() %>" style="width: 50px;"
                                   oninput="validateQuantity(this)">
                            <button class="btn btn-outline-secondary btn-sm" onclick="updateQuantity(this, 1)">+</button>
                        </div>
                    </div>
                    <% } %>
                </div>
                <% } %>
            </div>

            <!-- Resumen de Compra -->
            <div class="col-12 col-md-4">
                <h2 class="fw-bold text-center text-primary-emphasis mb-4">Resumen</h2>

                <div class="summary card p-3">
                    <!-- Total de Compra -->
                    <div class="d-flex justify-content-between">
                        <p>Productos (<%= cartItems != null ? cartItems.size() : 0 %>)</p>
                        <p>S/ <%= total != null ? total : 0.0 %></p>
                    </div>

                    <!-- Descuentos -->
                    <div class="d-flex justify-content-between">
                        <p>Descuentos</p>
                        <p class="text-danger">- S/ <%= descuento != null ? descuento : 0.0 %></p>
                    </div>
                    <hr>

                    <!-- Total Final -->
                    <div class="d-flex justify-content-between">
                        <p class="fw-bold">Total:</p>
                        <p class="fw-bold">S/ <%= total != null ? total : 0.0 %></p>
                    </div>

                    <!-- Continuar Compra -->
                    <form action="product" method="post">
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
<script src="js/shopping_cart.js"></script>

</body>

</html>
