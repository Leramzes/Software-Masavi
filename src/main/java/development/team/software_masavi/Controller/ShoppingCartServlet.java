package development.team.software_masavi.Controller;

import development.team.software_masavi.Business.CatalogoProducts;
import development.team.software_masavi.Model.Product;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "shoppingCartServlet", urlPatterns = {"/shoppingCartServlet"})
public class ShoppingCartServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        //ESTE ES UN SERVLET TEMPORAL DE PRUEBA!
        //para implementar la session del carrito (que persista la cantidad seleccionada)
        HttpSession session = req.getSession();

        String productId = req.getParameter("productId");
        String quantity = req.getParameter("quantity");

        // Validar los parámetros
        if (productId != null && quantity != null) {
            CatalogoProducts catalogo = new CatalogoProducts();
            Product product = catalogo.getProductById(productId);

            if (product != null) {
                double unitPrice = product.getPrice();
                int qty = Integer.parseInt(quantity);
                double totalPrice = unitPrice * qty;

                resp.setContentType("text/plain;charset=UTF-8");
                try (PrintWriter out = resp.getWriter()) {
                    System.out.println("El precio total por los productos es de: "+totalPrice);
                }
            }
        }
    }
}
