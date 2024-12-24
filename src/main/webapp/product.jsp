<%@ page import="java.util.List" %>
<%@ page import="development.team.software_masavi.Model.Product" %>
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
    <link rel="stylesheet" href="css/product.css">
    <!--Enlace de CSS Fondo-->
    <link rel="stylesheet" href="css/background.css">
    <!-- FontAwesome CDN -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>

<body>

<%@ include file="header.jsp" %>
<%
    List<Product> listProducts = (List<Product>) request.getAttribute("products");
    listProducts.forEach(product -> {
        System.out.println("Producto: " + product.toString());
    });
%>
<main class="bg-main">
    <!-- Contenido de la sección de productos destacados -->
    <div class="container py-4">
        <!-- Encabezado -->
        <div class="row text-center text-white">
            <h1>Productos Destacados</h1>
        </div>

        <div id="productCarousel" class="carousel slide" data-bs-ride="carousel">
            <!-- Indicators -->
            <div class="carousel-indicators">
                <button type="button" data-bs-target="#productCarousel" data-bs-slide-to="0" class="active"
                        aria-current="true" aria-label="Slide 1"></button>
                <button type="button" data-bs-target="#productCarousel" data-bs-slide-to="1" aria-label="Slide 2"></button>
                <button type="button" data-bs-target="#productCarousel" data-bs-slide-to="2" aria-label="Slide 3"></button>
            </div>

            <!-- Carousel items -->
            <div class="carousel-inner">
                <!-- Slide 1 -->
                <div class="carousel-item active">
                    <div class="row align-items-center justify-content-center">
                        <!-- Columna izquierda -->
                        <div class="col-auto py-5 mx-5">
                            <img src="img/producto.jpg" class="img-fluid rounded-3" alt="Producto 1">
                        </div>

                        <!-- Columna derecha -->
                        <div class="col-auto text-center text-white mx-5 carousel">
                            <h1>Waifu</h1>
                            <h3>Precio Actual: S/99.99</h3>
                            <h5 class="tachado">Precio Anterior: S/100</h5>
                            <p>Lleve su Waifu a buen precio</p>
                            <button type="button" class="btn btn-success w-100">
                                Agregar al Carrito <i class="fa-solid fa-cart-shopping"></i>
                            </button>
                        </div>
                    </div>
                </div>

                <!-- Slide 2 -->
                <div class="carousel-item">
                    <div class="row align-items-center justify-content-center">
                        <!-- Columna izquierda -->
                        <div class="col-auto py-5 mx-5">
                            <img src="img/producto2.jpg" class="img-fluid rounded-3" alt="Producto 2">
                        </div>

                        <!-- Columna derecha -->
                        <div class="col-auto text-center text-white mx-5">
                            <h1>Waifu</h1>
                            <h3>Precio Actual: S/99.99</h3>
                            <h5 class="tachado">Precio Anterior: S/100</h5>
                            <p>Lleve su Waifu a buen precio</p>
                            <button type="button" class="btn btn-success w-100">
                                Agregar al Carrito <i class="fa-solid fa-cart-shopping"></i>
                            </button>
                        </div>
                    </div>
                </div>

                <!-- Slide 3 -->
                <div class="carousel-item">
                    <div class="row align-items-center justify-content-center">
                        <!-- Columna izquierda -->
                        <div class="col-auto py-5 mx-5">
                            <img src="#" class="img-fluid rounded-3" alt="Producto 3">
                        </div>

                        <!-- Columna derecha -->
                        <div class="col-auto text-center text-white mx-5">
                            <h1>Waifu</h1>
                            <h3>Precio Actual: S/99.99</h3>
                            <h5 class="tachado">Precio Anterior: S/100</h5>
                            <p>Lleve su Waifu a buen precio</p>
                            <button type="button" class="btn btn-success w-100">
                                Agregar al Carrito <i class="fa-solid fa-cart-shopping"></i>
                            </button>
                        </div>
                    </div>
                </div>

            </div>

            <!-- Controles -->
            <button class="carousel-control-prev" type="button" data-bs-target="#productCarousel" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#productCarousel" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>
    </div>

    <!-- Contenido de la sección de productos -->
    <div class="container-fluid my-2">
        <!-- Encabezado -->
        <div class="row text-center text-white">
            <h1>¿Que estas buscando hoy?</h1>
        </div>

        <div class="row">
            <!-- Sidebar de filtros -->
            <div class="col-md-3">
                <div class="sidebar">
                    <h5><i class="fa-solid fa-filter"></i> Filtros:</h5>

                    <!-- Filtro por nombre -->
                    <div class="filter-group">
                        <label for="proveedor-search">Nombre:</label>
                        <input type="text" id="nombre-search" class="form-control" placeholder="Buscar producto...">
                    </div>

                    <!-- Filtro por proveedor -->
                    <div class="filter-group">
                        <label for="proveedor-search">Proveedor:</label>
                        <input type="text" id="proveedor-search" class="form-control" placeholder="Buscar proveedor...">
                        <button class="btn btn-link w-100" type="button" data-bs-toggle="collapse" data-bs-target="#proveedor-list"
                                aria-expanded="false" aria-controls="proveedor-list">
                            Mostrar Opciones
                        </button>
                        <ul id="proveedor-list" class="list-unstyled collapse">
                            <li><input type="checkbox"> Proveedor 1</li>
                            <li><input type="checkbox"> Proveedor 2</li>
                            <li><input type="checkbox"> Proveedor 3</li>
                            <li><input type="checkbox"> Proveedor 4</li>
                        </ul>
                    </div>

                    <!-- Filtro por marca -->
                    <div class="filter-group">
                        <label for="marca-search">Marca:</label>
                        <input type="text" id="marca-search" class="form-control" placeholder="Buscar marca...">
                        <button class="btn btn-link w-100" type="button" data-bs-toggle="collapse" data-bs-target="#marca-list"
                                aria-expanded="false" aria-controls="marca-list">
                            Mostrar Opciones
                        </button>
                        <ul id="marca-list" class="list-unstyled collapse">
                            <li><input type="checkbox"> Marca 1</li>
                            <li><input type="checkbox"> Marca 2</li>
                            <li><input type="checkbox"> Marca 3</li>
                            <li><input type="checkbox"> Marca 4</li>
                        </ul>
                    </div>

                    <!-- Filtro por rango de precio -->
                    <div class="filter-group">
                        <label for="price-range">Rango de precio:</label>
                        <input type="range" id="price-range" class="form-control" min="0" max="1000" step="10">
                        <span id="price-value">0 - 1000</span>
                    </div>

                    <!-- Botón para aplicar los filtros -->
                    <button class="btn btn-secondary w-100">Aplicar Filtros</button>
                </div>
            </div>

            <!-- Zona principal de productos -->
            <div class="col-md-9">
                <div class="row row-cols-1 row-cols-md-3 gy-2">
                    <!-- Tarjeta de producto -->
                    <%for(Product product : listProducts) {%>
                    <div class="col">
                        <div class="product-card product-item">
                            <img src="img/producto.jpg" alt="Producto 1" class="product">
                            <h2><%=product.getName()%></h2>
                            <h4>Precio Actual: <%=String.format("S/%s",product.getPrice().toString()) %></h4>
                            <h5 class="tachado">Precio Anterior: S/100</h5>
                            <p><%=product.getDescription()%></p>
                            <button type="button" class="btn btn-success w-100">
                                Agregar al Carrito <i class="fa-solid fa-cart-shopping"></i>
                            </button>
                        </div>
                    </div>
                    <%}%>
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
<!--Enlace de JavaScript - Validación-->
<script src="js/product.js"></script>

</body>