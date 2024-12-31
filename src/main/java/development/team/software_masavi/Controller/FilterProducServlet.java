package development.team.software_masavi.Controller;

import development.team.software_masavi.Business.CatalogoProducts;
import development.team.software_masavi.Model.Product;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "filterProducServlet", urlPatterns = {"/filterProducServlet"})
public class FilterProducServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = resp.getWriter()) {
            String filter = req.getParameter("filter");
            List<Product> products = CatalogoProducts.filterProducts(filter);
            for (Product product : products) {
                out.println("<div class=\"col product-card d-flex flex-column justify-content-between align-items-center\">");
                out.println("<img src='"+product.getImage()+"' alt='"+product.getName()+"'");
                out.println("<h3 class='product-title'>"+product.getName()+"</h3>");
                out.println("<p class='product-price'>Precio: S/"+product.getPrice()+"</p>");
                if (product.getQuantityInStock() < 10) {
                    out.println("<h5 style=\"color: #dc3545\">¡Quedan Pocas Unidades!</h5>");
                }
                out.println("<button type='button' class='btn btn-success w-100'>");
                out.println("Agregar al Carrito <i class='fa-solid fa-cart-shopping'></i>");
                out.println("</button>");
                out.println("</div>");
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
