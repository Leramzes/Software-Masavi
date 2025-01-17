<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
                    <div class="table-responsive">
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
                                    <div class="d-flex align-items-center justify-content-center">
                                        <button type="button" class="btn btn-outline-secondary btn-sm" onclick="updateQuantity(this, -1)">-</button>
                                        <input type="text" id="quantity-txt" class="form-control text-center mx-1 quantity-input" style="width: 60px;"
                                               value="<%= item.getQuantity() %>"
                                               oninput="validateQuantity(this)">
                                        <button type="button" class="btn btn-outline-secondary btn-sm" onclick="updateQuantity(this, 1)">+</button>
                                    </div>
                                </td>

                                <!-- Precio Total -->
                                <td class="text-center price-total" id="price-txt">
                                    S/ <%= item.getProduct().getPrice() * item.getQuantity() %>
                                </td>

                                <!-- Acciones -->
                                <td class="text-center">
                                    <form action="cart" method="post">
                                        <input type="hidden" name="productId" value="<%= item.getProduct().getId() %>">
                                        <input type="hidden" name="quantity" value="1">
                                        <input type="hidden" name="action" value="remove">
                                        <button id="delete-button" type="submit" class="btn btn-danger btn-sm">
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
                    <!-- Total de Compra -->
                    <div class="d-flex justify-content-between">
                        <p>Productos (<%=itemCount %>)</p>
                        <p id="total-compra">S/ 0.0</p>
                    </div>

                    <!-- Descuentos -->
                    <div class="d-flex justify-content-between">
                        <p>Descuentos</p>
                        <p id="descuento" class="text-danger">- S/ 0.0</p>
                    </div>
                    <hr>

                    <!-- Total Final -->
                    <div class="d-flex justify-content-between">
                        <p class="fw-bold">Total:</p>
                        <p id="total-final" class="fw-bold">S/ 0.0</p>
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
