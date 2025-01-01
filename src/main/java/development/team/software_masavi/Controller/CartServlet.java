package development.team.software_masavi.Controller;

import development.team.software_masavi.Business.CatalogoProducts;
import development.team.software_masavi.Model.CartItem;

import development.team.software_masavi.Model.Product;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "cart", urlPatterns = {"/cart"})
public class CartServlet extends HttpServlet {

    CatalogoProducts productdao = new CatalogoProducts();
    Product product = new Product();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        double total = 0;
        double descuento = 0;

        HttpSession session = request.getSession();
        List<CartItem> cartItems = (List<CartItem>) session.getAttribute("cartItems");

        if (cartItems == null) {
            System.out.println("El carrito no existe en la sesión. Creando uno nuevo...");
            cartItems = new ArrayList<>();
        } else {
            System.out.println("Carrito recuperado de la sesión. Tamaño: " + cartItems.size());
        }

        // Pasar los datos al JSP
        request.setAttribute("cartItems", cartItems);
        request.setAttribute("total", total);
        request.setAttribute("descuento", descuento);

        // Redireccionar al JSP
        request.getRequestDispatcher("shopping_cart.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        List<CartItem> cartItems = (List<CartItem>) session.getAttribute("cartItems");

        // Verificar si el carrito es nulo y inicializarlo si es necesario
        if (cartItems == null) {
            cartItems = new ArrayList<>();
            session.setAttribute("cartItems", cartItems); // Actualizar el carrito en la sesión
        }

        String productId = request.getParameter("productId");
        String quantityString = request.getParameter("quantity");

        System.out.println("SE SOLICITÓ productId: "+productId+" quantity: "+quantityString);

        // Validación de entradas
        if (productId == null || productId.isEmpty() || quantityString == null || quantityString.isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "ID del producto o cantidad no proporcionados.");
            return;
        }

        int quantity;
        try {
            quantity = Integer.parseInt(quantityString);
            if (quantity <= 0) {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "La cantidad debe ser un número positivo.");
                return;
            }
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Cantidad inválida.");
            return;
        }

        // Obtener el producto de la base de datos
        Product product = productdao.getProductById(productId);
        if (product == null) {
            System.out.println("Error al encontrar el Producto.");
            return;
        }

        // Añadir producto al carrito
        try {
            addToCart(cartItems, product, quantity);
            session.setAttribute("cartItems", cartItems); // Actualizar el carrito en la sesión
        } catch (Exception e) {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error al añadir el producto al carrito.");
            return;
        }

        // Imprimir los elementos del carrito para depuración
        System.out.println("Elementos actuales en el carrito:");
        for (CartItem cartItem : cartItems) {
            System.out.println("Producto: " + cartItem.getProduct().getName() +
                    ", Cantidad: " + cartItem.getQuantity() +
                    ", ID: " + cartItem.getProduct().getId());
        }

        // Redireccionar al JSP
        request.setAttribute("cartItems", cartItems);
        request.getRequestDispatcher("shopping_cart.jsp").forward(request, response);
    }

    /**
     * Método para añadir un producto al carrito.
     *
     * @param cartItems Lista de items en el carrito.
     * @param product   Producto a añadir.
     * @param quantity  Cantidad del producto a añadir.
     */
    private void addToCart(List<CartItem> cartItems, Product product, int quantity) {
        // Validación básica
        if (product == null || quantity <= 0) {
            throw new IllegalArgumentException("El producto no puede ser nulo y la cantidad debe ser mayor a cero.");
        }

        // Buscar el producto en el carrito
        for (CartItem cartItem : cartItems) {
            if (cartItem.getProduct() != null && cartItem.getProduct().getId() == product.getId()) {
                cartItem.setQuantity(cartItem.getQuantity() + quantity);
                System.out.println("Producto existente, cantidad actualizada.");
                return; // Termina después de actualizar la cantidad
            }
        }

        // Si el producto no está en el carrito, añadirlo como un nuevo item
        cartItems.add(new CartItem(product, quantity));
        System.out.println("Producto añadido como nuevo al carrito.");
    }

}