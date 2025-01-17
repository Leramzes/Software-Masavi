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
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "cart", urlPatterns = {"/cart"})
public class CartServlet extends HttpServlet {

    CatalogoProducts productdao = new CatalogoProducts();
    Product product = new Product();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");

        // Verificar si el carrito es nulo y inicializarlo si es necesario
        if (cart == null) {
            System.out.println("El carrito no existe en la sesión. Creando uno nuevo...");
            cart = new Cart();
            session.setAttribute("cart", cart); // Almacenar el carrito en la sesión
        } else {
            System.out.println("Carrito recuperado de la sesión. Tamaño: " + cart.getCartItems().size());

        }

        // Obtener la cantidad de ítems en el carrito
        int itemCount = cart.getCartItems().size();

        // Pasar los datos al JSP
        request.setAttribute("cartItems", cart.getCartItems());
        session.setAttribute("itemCount", itemCount);

        // Redireccionar al JSP
        request.getRequestDispatcher("shopping_cart.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");

        // Verificar si el carrito es nulo y inicializarlo si es necesario
        if (cart == null) {
            cart = new Cart(); // Inicializa una nueva instancia de Cart si no existe en la sesión
            session.setAttribute("cart", cart); // Almacena el carrito en la sesión
        }

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

                    // Obtener la cantidad de ítems en el carrito
                    int itemCount = cart.getCartItems().size();

                    // Actualizar el carrito en la sesión
                    session.setAttribute("cart", cart);

                    // Redireccionar al JSP para mostrar el carrito actualizado
                    request.setAttribute("cartItems", cart.getCartItems());
                    session.setAttribute("itemCount", itemCount);
                    response.sendRedirect("product");
                    return;
                case "update":
                    cart.updateItemQuantity(product, quantity);
                    break;
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

        // Obtener la cantidad de ítems en el carrito
        int itemCount = cart.getCartItems().size();

        // Imprimir en consola (o pasar al JSP si lo necesitas)
        System.out.println("Cantidad de ítems en el carrito: " + itemCount);

        // Actualizar el carrito en la sesión
        session.setAttribute("cart", cart);

        // Redireccionar al JSP para mostrar el carrito actualizado
        request.setAttribute("cartItems", cart.getCartItems());
        session.setAttribute("itemCount", itemCount);
        request.getRequestDispatcher("shopping_cart.jsp").forward(request, response);
    }
}