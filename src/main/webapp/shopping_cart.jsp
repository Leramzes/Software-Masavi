<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Masavi</title>
    <!--Enlace de Bootstrap CSS-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <!--Enlace de CSS Global-->
    <link rel="stylesheet" href="css/global.css">
    <!--Enlace de CSS Específico-->
    <link rel="stylesheet" href="css/shopping_cart.css">
    <!--Enlace de CSS Fondo-->
    <link rel="stylesheet" href="css/background.css">
    <!-- FontAwesome CDN -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>

<body>

<%@ include file="header.jsp" %>

<main class="bg-main align-content-center align-items-center">
    <div class="container-fluid my-2">
        <div class="row">
            <!-- Carrito de Compra -->
            <div class="col-12 col-md-8 mb-4">
                <!-- Encabezado -->
                <h1 class="fw-bold text-primary-emphasis mb-4">Carrito de Compra:</h1>

                <!-- Productos en el Carrito -->
                <div class="card p-3">
                    <!-- Producto 1 -->
                    <div class="product-item d-flex align-items-center">
                        <!-- Imagen del Producto -->
                        <img src="img/producto.jpg" alt="Producto 1">

                        <!-- Detalles del Producto -->
                        <div class="flex-grow-1 px-3">
                            <h5 class="text-black fw-bold">Producto</h5>
                            <p>Lorem ipsum dolor sit amet consectetur.</p>
                        </div>

                        <!-- Precio del Producto -->
                        <div class="text-end me-3">
                            <p class="text-black fw-bold mb-0">S/69</p>
                            <p class="text-muted text-decoration-line-through">S/70</p>
                        </div>

                        <!-- Cantidad del Producto -->
                        <div class="quantity-control">
                            <button class="btn btn-outline-secondary btn-sm" onclick="updateQuantity(this, -1)">-</button>
                            <input type="text" class="form-control text-center mx-1" value="1" style="width: 50px;"
                                   oninput="validateQuantity(this)">
                            <button class="btn btn-outline-secondary btn-sm" onclick="updateQuantity(this, 1)">+</button>
                        </div>
                    </div>

                    <!-- Producto 2 -->
                    <div class="product-item d-flex align-items-center">
                        <!-- Imagen del Producto -->
                        <img src="img/producto2.jpg" alt="Producto 2">

                        <!-- Detalles del Producto -->
                        <div class="flex-grow-1 px-3">
                            <h5 class="text-black fw-bold">Producto 2</h5>
                            <p>Lorem ipsum dolor sit amet consectetur.</p>
                        </div>

                        <!-- Precio del Producto -->
                        <div class="text-end me-3">
                            <p class="text-black fw-bold mb-0">S/69</p>
                            <p class="text-muted text-decoration-line-through">S/70</p>
                        </div>

                        <!-- Cantidad del Producto -->
                        <div class="quantity-control">
                            <button class="btn btn-outline-secondary btn-sm" onclick="updateQuantity(this, -1)">-</button>
                            <input type="text" class="form-control text-center mx-1" value="1" style="width: 50px;"
                                   oninput="validateQuantity(this)">
                            <button class="btn btn-outline-secondary btn-sm" onclick="updateQuantity(this, 1)">+</button>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Resumen de Compra -->
            <div class="col-12 col-md-4">
                <!-- Encabezado -->
                <h1 class="fw-bold text-center text-primary-emphasis mb-4">Resumen</h1>

                <!-- Resumen de Compra -->
                <div class="summary">
                    <!-- Total de Compra -->
                    <div class="d-flex justify-content-between">
                        <p>Productos (2)</p>
                        <p>S/ 999</p>
                    </div>

                    <!-- Descuentos -->
                    <div class="d-flex justify-content-between">
                        <p>Descuentos (2)</p>
                        <p class="text-danger">- S/ 999</p>
                    </div>
                    <hr>

                    <!-- Total Final -->
                    <div class="d-flex justify-content-between">
                        <p class="fw-bold">Total:</p>
                        <p class="fw-bold">S/ 0</p>
                    </div>

                    <!-- Continuar Compra -->
                    <button class="btn btn-success w-100 mt-3">Continuar Compra</button>
                </div>
            </div>
        </div>
    </div>
</main>

<%@ include file="footer.jsp" %>

<!--Enlace de Bootstrap JavaScript-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
<!--Enlace de JavaScript-->
<script src="js/shopping_cart.js"></script>

</body>

</html>
