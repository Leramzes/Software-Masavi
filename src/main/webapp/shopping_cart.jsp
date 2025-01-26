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
                                <td class="text-center">
                                    <strong><%= item.getProduct().getName() %></strong><br>
                                    <small class="text-muted"><%= item.getProduct().getDescription() %></small>
                                </td>

                                <!-- Cantidad -->
                                <td class="text-center" style="vertical-align: middle;">
                                    <input type="hidden" class="objetoProducto" value="<%= item.getProduct().getId() %>">
                                    <input type="number" class="form-control text-center mx-auto" id="cantidad-producto" style="width: 60px;"
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
                    <div>
                        <p class="fw-bold text-decoration-underline">Detalle</p>

                        <!-- Encabezados -->
                        <div class="d-flex justify-content-between fw-bold border-bottom pb-2">
                            <p class="mb-0">N°</p>
                            <p class="mb-0">Producto</p>
                            <p class="mb-0">P. Unit.</p>
                            <p class="mb-0">Cant.</p>
                            <p class="mb-0">Total</p>
                        </div>

                        <!-- Lista de productos -->
                        <% int counter = 1; %>
                        <% for (CartItem item : cartItems) { %>
                        <div class="d-flex justify-content-between align-items-center my-2">
                            <p class="mb-0"><%= counter++ %></p>
                            <p id="nameXproduct" class="mb-0">
                                <%= item.getProduct().getName() %>
                            </p>
                            <p id="priceXproduct" class="mb-0">
                                S/ <%= item.getProduct().getPrice() %>
                            </p>
                            <p id="quantityXproduct-<%= item.getProduct().getId() %>" class="mb-0">
                                <%= item.getQuantity() %>
                            </p>
                            <p id="subtotalXproduct-<%= item.getProduct().getId() %>" class="mb-0">
                                S/ <%= item.getSubtotal() %>
                            </p>
                        </div>
                        <% } %>

                        <!-- Línea separadora -->
                        <hr class="my-3">
                    </div>

                    <!-- Total Final -->
                    <div>
                        <p class="fw-bold text-decoration-underline">Total</p>

                        <!-- Cantidad Total de productos -->
                        <div class="d-flex justify-content-between align-items-center">
                            <p class="fw-bold mb-0">Cantidad:</p>
                            <p id="total-quantity" class="mb-0">
                                <%= ses.getAttribute("quantityTotal") %>
                            </p>
                        </div>

                        <!-- Subtotal -->
                        <div class="d-flex justify-content-between align-items-center">
                            <p class="fw-bold mb-0">Sub Total:</p>
                            <p id="sub-total" class="mb-0">
                                S/ <%= ses.getAttribute("subTotal") %>
                            </p>
                        </div>

                        <!-- IGV -->
                        <div class="d-flex justify-content-between align-items-center">
                            <p class="fw-bold mb-0">IGV (18%):</p>
                            <p id="igv" class="mb-0">
                                S/ <%= String.format("%.2f", ((double) ses.getAttribute("subTotal")) * 0.18) %>
                            </p>
                        </div>

                        <!-- Precio Total -->
                        <div class="d-flex justify-content-between align-items-center">
                            <p class="fw-bold mb-0">Precio Total:</p>
                            <p id="total-final" class="mb-0">
                                S/ <%= ses.getAttribute("totalPago")%>
                            </p>
                        </div>
                    </div>

                    <%if(ses.getAttribute("usuario")!=null){%>
                        <form id="paymentForm">
                            <button type="button" class="btn btn-success w-100 mt-3" data-bs-toggle="modal" data-bs-target="#paymentModal">
                                Continuar Compra
                            </button>
                        </form>
                    <%}else{%>
                        <a href="login.jsp" type="button" class="btn btn-success w-100 mt-3" id="btnRegistrar">
                            Continuar Compra
                        </a>
                    <%}%>


                    <!-- Modal de Selección de Método de Pago -->
                    <div class="modal fade" id="paymentModal" tabindex="-1" aria-labelledby="paymentModalLabel" aria-hidden="true" data-bs-backdrop="static">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="paymentModalLabel">Selecciona un Método de Pago</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <!-- Opciones de métodos de pago -->
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="paymentMethod" id="creditCard" value="Tarjeta" required>
                                        <label class="form-check-label" for="creditCard">Tarjeta de Crédito/Débito</label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="paymentMethod" id="yape" value="Yape" required>
                                        <label class="form-check-label" for="yape">Yape</label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="paymentMethod" id="plin" value="Plin" required>
                                        <label class="form-check-label" for="plin">Plin</label>
                                    </div>
                                    <div id="alertMessage" class="text-danger d-none">Por favor, selecciona un método de pago.</div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                                    <button type="button" class="btn btn-success" id="confirmPaymentMethod">Continuar</button>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Modales adicionales para cada método de pago -->
                    <div class="modal fade" id="creditCardModal" tabindex="-1" aria-labelledby="creditCardModalLabel" aria-hidden="true" data-bs-backdrop="static">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="creditCardModalLabel">Tarjeta de Crédito/Débito</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <!-- Formulario para tarjeta -->
                                    <form class="payment-form">
                                        <input type="hidden" name="optionPago" value="1">
                                        <div class="mb-3">
                                            <label for="cardNumber" class="form-label">Número de Tarjeta</label>
                                            <input type="text" class="form-control" id="cardNumber" name="cardNumber" maxlength="19" placeholder="1234-5678-9012-3456" required>
                                        </div>
                                        <div class="mb-3">
                                            <label for="cardHolder" class="form-label">Titular de la Tarjeta</label>
                                            <input type="text" class="form-control" id="cardHolder" name="cardHolder" required>
                                        </div>
                                        <div class="mb-3">
                                            <label for="expirationDate" class="form-label">Fecha de Expiración</label>
                                            <input type="text" class="form-control" id="expirationDate" name="expirationDate" placeholder="MM/AA" required>
                                        </div>
                                        <div class="mb-3">
                                            <label for="cvv" class="form-label">CVV</label>
                                            <input type="text" class="form-control" id="cvv" name="cvv" maxlength="3" placeholder="123" required>
                                        </div>
                                        <button type="button" class="btn btn-secondary h-100" data-bs-dismiss="modal" id="backToPaymentMethods">Atrás</button>
                                        <!-- Botón de Confirmar Pago -->
                                        <button type="button" class="btn btn-success confirm-payment-btn">Confirmar Pago</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="modal fade" id="yapeModal" tabindex="-1" aria-labelledby="yapeModalLabel" aria-hidden="true" data-bs-backdrop="static">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="yapeModalLabel">Pagar con Yape</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <!-- Información de pago con Yape -->
                                    <form class="payment-form">
                                        <input type="hidden" name="optionPago" value="2">
                                        <p>Escanea el código QR con Yape para completar tu pago.</p>
                                        <img src="img/yape.png" alt="QR de Yape" class="img-fluid">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" id="backToPaymentMethodsYape">Atrás</button>
                                        <!-- Botón de Confirmar Pago -->
                                        <button type="button" class="btn btn-success confirm-payment-btn" data-bs-toggle="modal" data-bs-target="#confirmModal">Confirmar Pago</button>
                                    </form>

                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="modal fade" id="plinModal" tabindex="-1" aria-labelledby="plinModalLabel" aria-hidden="true" data-bs-backdrop="static">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="plinModalLabel">Pagar con Plin</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <!-- Información de pago con Plin -->
                                    <form class="payment-form">
                                        <input type="hidden" name="optionPago" value="3">
                                        <p>Escanea el código QR con Plin para completar tu pago.</p>
                                        <img src="img/yape.png" alt="QR de Plin" class="img-fluid">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" id="backToPaymentMethodsPlin">Atrás</button>
                                        <!-- Botón de Confirmar Pago -->
                                        <button type="button" class="btn btn-success confirm-payment-btn" data-bs-toggle="modal" data-bs-target="#confirmModal">Confirmar Pago</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Modal del Comprobante de Pago -->
                    <div class="modal fade" id="confirmModal" tabindex="-1" aria-labelledby="confirmModalLabel" aria-hidden="true" data-bs-backdrop="static">
                        <div class="modal-dialog modal-lg">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title fw-bold" id="confirmModalLabel">Comprobante N° <span id="receiptNumber">001-000001</span></h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <div class="container">
                                        <!-- Logo y Título -->
                                        <div class="row mb-4 align-items-center">
                                            <div class="col-md-6">
                                                <img src="img/logo.jpg" class="rounded-circle border img-fluid" alt="Masavi" style="max-width: 100px;">
                                            </div>
                                            <div class="col-md-6 text-end">
                                                <h4 class="fw-bold">Centro Agronómico MASAVI</h4>
                                                <p>RUC: 12345678901</p>
                                                <p>Fecha: <span id="receiptDate"></span></p>
                                                <p>Hora: <span id="receiptTime"></span></p>
                                            </div>
                                        </div>

                                        <!-- Detalle del Cliente -->
                                        <div class="row mb-3">
                                            <div class="col-12">
                                                <h5 class="fw-bold">Datos del Cliente:</h5>
                                                <p>Nombre: <span id="customerName">Cliente</span></p>
                                                <p>DNI: <span id="customerDNI">12345678</span></p>
                                                <p>Dirección: <span id="customerAddress">Av. Principal 666</span></p>
                                                <p>Celular: <span id="customerPhone">987654321</span></p>
                                            </div>
                                        </div>

                                        <!-- Detalle del Pago -->
                                        <div class="row mb-3">
                                            <div class="col-12">
                                                <h5 class="fw-bold">Método de Pago:</h5>
                                                <p><span id="paymentMethod">Tarjeta de Crédito/Débito</span></p>
                                            </div>
                                        </div>

                                        <!-- Tabla de Productos -->
                                        <div class="row mb-4">
                                            <div class="col-12">
                                                <h5 class="fw-bold">Detalle de la Compra:</h5>
                                                <div class="table-responsive" style="max-height: 500px; overflow-y: auto;">
                                                    <table class="table table-bordered text-center">
                                                        <thead class="table-success">
                                                        <tr>
                                                            <th scope="col">N°</th>
                                                            <th scope="col">Producto</th>
                                                            <th scope="col">Precio Unitario</th>
                                                            <th scope="col">Cantidad</th>
                                                            <th scope="col">Total</th>
                                                        </tr>
                                                        </thead>
                                                        <tbody id="receiptProducts">
                                                        <!-- Productos dinámicos -->
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>

                                        <!-- Resumen de Pago -->
                                        <div class="row">
                                            <div class="col-12 text-end">
                                                <p class="fw-bold">Sub-Total: <span id="receiptSubtotal">S/ 0.00</span></p>
                                                <p class="fw-bold">IGV (18%): <span id="receiptIGV">S/ 0.00</span></p>
                                                <h5 class="fw-bold">Total: <span id="receiptTotal">S/ 0.00</span></h5>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-success" id="printReceipt">Imprimir</button>
                                </div>
                            </div>
                        </div>
                    </div>

                    <script>
                        document.querySelector('.confirm-payment-btn').addEventListener('click', function () {
                            const form = document.querySelector('.payment-form');
                            const selectedMethod = document.querySelector('input[name="paymentMethod"]:checked');

                            if (!selectedMethod) {
                                alert('Por favor, selecciona un método de pago.');
                                return;
                            }

                            const paymentType = selectedMethod.value; // Valor del método de pago seleccionado

                            if (paymentType === 'Tarjeta') {
                                // Validaciones para tarjeta
                                const cardNumber = form.querySelector('#cardNumber').value.trim();
                                const cardHolder = form.querySelector('#cardHolder').value.trim();
                                const expirationDate = form.querySelector('#expirationDate').value.trim();
                                const cvv = form.querySelector('#cvv').value.trim();

                                const cardNumberRegex = /^\d{4}-\d{4}-\d{4}-\d{4}$/;
                                const expirationDateRegex = /^(0[1-9]|1[0-2])\/\d{2}$/;
                                const cvvRegex = /^\d{3}$/;

                                if (!cardNumberRegex.test(cardNumber)) {
                                    alert('Por favor, ingrese un número de tarjeta válido (1234-5678-9012-3456).');
                                    return;
                                }

                                if (cardHolder === '') {
                                    alert('Por favor, ingrese el titular de la tarjeta.');
                                    return;
                                }

                                if (!expirationDateRegex.test(expirationDate)) {
                                    alert('Por favor, ingrese una fecha de expiración válida (MM/AA).');
                                    return;
                                }

                                if (!cvvRegex.test(cvv)) {
                                    alert('Por favor, ingrese un CVV válido (3 dígitos).');
                                    return;
                                }
                            } else if (paymentType === 'Yape' || paymentType === 'Plin') {
                                // Mensaje opcional si es Yape o Plin
                                alert(`Usando ${paymentType}: Asegúrate de completar el pago con el código QR.`);
                            }

                            // Generar datos dinámicos del comprobante
                            const receiptNumber = '001-000001';
                            const products = [
                                { id: 1, name: "Producto A", unitPrice: 10.0, quantity: 2, subtotal: 20.0 },
                                { id: 2, name: "Producto B", unitPrice: 15.0, quantity: 1, subtotal: 15.0 }
                            ];
                            const subtotal = products.reduce((sum, p) => sum + p.subtotal, 0);
                            const igv = subtotal * 0.18;
                            const total = subtotal + igv;
                            const date = new Date();

                            // Actualizar datos en el modal del comprobante
                            document.getElementById('receiptNumber').textContent = receiptNumber;
                            document.getElementById('paymentMethod').textContent = paymentType;
                            document.getElementById('receiptProducts').innerHTML = products
                                .map(
                                    (p, index) =>
                                        `<tr>
                                            <td>${index + 1}</td>
                                            <td>${p.name}</td>
                                            <td>S/ ${p.unitPrice.toFixed(2)}</td>
                                            <td>${p.quantity}</td>
                                            <td>S/ ${p.subtotal.toFixed(2)}</td>
                                        </tr>`
                                )
                                .join('');
                            document.getElementById('receiptSubtotal').textContent = `S/ ${subtotal.toFixed(2)}`;
                            document.getElementById('receiptIGV').textContent = `S/ ${igv.toFixed(2)}`;
                            document.getElementById('receiptTotal').textContent = `S/ ${total.toFixed(2)}`;
                            document.getElementById('receiptDate').textContent = date.toLocaleDateString();
                            document.getElementById('receiptTime').textContent = date.toLocaleTimeString('en-GB', { hour12: false, hour: '2-digit', minute: '2-digit' });

                            // Mostrar el modal del comprobante
                            const receiptModal = new bootstrap.Modal(document.getElementById('confirmModal'));
                            receiptModal.show();
                        });
                    </script>

                    <!-- Script para manejar la lógica -->
                    <script>
                        document.getElementById('confirmPaymentMethod').addEventListener('click', function () {
                            const selectedMethod = document.querySelector('input[name="paymentMethod"]:checked');
                            const alertMessage = document.getElementById('alertMessage');
                            if (selectedMethod) {
                                alertMessage.classList.add('d-none');
                                const method = selectedMethod.value;
                                const modalId = method === 'Tarjeta' ? 'creditCardModal' :
                                    method === 'Yape' ? 'yapeModal' :
                                        method === 'Plin' ? 'plinModal' : null;
                                if (modalId) {
                                    const paymentModal = bootstrap.Modal.getInstance(document.getElementById('paymentModal'));
                                    paymentModal.hide();
                                    const nextModal = new bootstrap.Modal(document.getElementById(modalId));
                                    nextModal.show();
                                }
                            } else {
                                alertMessage.classList.remove('d-none');
                            }
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
                    </script>
                </div>
            </div>
        </div>
    </div>
</main>

<%@ include file="footer.jsp" %>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

<!-- Enlace de JavaScript - JSPDF -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.2/jspdf.umd.min.js"></script>

<!--Enlace de JavaScript - SweetAlert2-->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<!--Funcionalidad de las alertas - SweetAlert2-->
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

</script>

</body>

</html>
