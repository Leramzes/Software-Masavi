package development.team.software_masavi.Controller;

import development.team.software_masavi.Business.CatalogoProducts;
import development.team.software_masavi.Model.Cart;

import development.team.software_masavi.Model.CartItem;
import development.team.software_masavi.Model.Product;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "cart", urlPatterns = {"/cart"})
public class CartServlet extends HttpServlet {

    CatalogoProducts productdao = new CatalogoProducts();
    Product product = new Product();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        Cart cart = getOrCreateCart(session);

        // Actualizar atributos
        updateCartAttributes(cart, session, request);

        // Redireccionar al JSP
        request.getRequestDispatcher("shopping_cart.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        Cart cart = getOrCreateCart(session);

        String productId = request.getParameter("productId");
        String quantityString = request.getParameter("quantity");
        //ACCION QUE DESEA EJECUTAR: AÑADIR, EDITAR CANTIDAD O ELIMINAR
        String action = request.getParameter("action");

        // Validación de entradas
        if (productId == null || productId.isEmpty() || quantityString == null || quantityString.isEmpty() || action == null) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Faltan parámetros: producto, cantidad o acción.");
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

        // Realizar acción según el parámetro "action"
        try {
            switch (action) {
                case "add":
                    cart.addToCart(product, quantity);
                    // Actualizar atributos
                    updateCartAttributes(cart, session, request);

                    response.sendRedirect("product");
                    return;
                case "update":
                    cart.updateItemQuantity(product, quantity);
                    // Actualizar atributos
                    updateCartAttributes(cart, session, request);

                    response.sendRedirect("cart");
                    return;
                case "remove":
                    cart.removeItem(product);
                    break;
                default:
                    response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Acción desconocida.");
                    return;
            }
        } catch (Exception e) {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error al procesar la acción.");
            return;
        }

        // Actualizar atributos
        updateCartAttributes(cart, session, request);
        // Redireccionar al JSP para mostrar el carrito actualizado
        request.getRequestDispatcher("shopping_cart.jsp").forward(request, response);
    }

    /**
     * Obtiene el carrito de la sesión o crea uno nuevo si no existe.
     */
    private Cart getOrCreateCart(HttpSession session) {
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null) {
            cart = new Cart();
            session.setAttribute("cart", cart);
        }
        return cart;
    }

    /**
     * Actualiza los atributos relacionados con el carrito en la sesión y en la solicitud.
     */
    private void updateCartAttributes(Cart cart, HttpSession session, HttpServletRequest request) {
        int itemCount = cart.getCartItems().size();
        System.out.println("Cantidad de ítems en el carrito: " + itemCount);
        double sumTotal = 0;
        int quantityTotal = 0;
        for(CartItem item : cart.getCartItems()){
            sumTotal += item.getProduct().getPrice()*item.getQuantity();
            quantityTotal += item.getQuantity();
        }
        String total = String.format("%.2f", sumTotal+(sumTotal*0.18f));
        double totalPago = Double.parseDouble(total);
        session.setAttribute("quantityTotal", quantityTotal);
        session.setAttribute("subTotal", sumTotal);
        session.setAttribute("totalPago",totalPago);
        session.setAttribute("cart", cart);
        session.setAttribute("cartItemsInSession", cart.getCartItems());
        request.setAttribute("cartItems", cart.getCartItems());
        session.setAttribute("itemCount", itemCount);
    }
}