package development.team.software_masavi.Controller;

import development.team.software_masavi.Business.CatalogoProducts;
import development.team.software_masavi.Model.Product;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "product", urlPatterns = {"/product"})
public class ProductController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        CatalogoProducts catalogo = new CatalogoProducts();
        List<Product> products = catalogo.getAllProducts();
        List<Product> productsFeatured = catalogo.getProductFeatured();
        //List<String> categoryProducts = catalogo.getCategoryProducts();
        req.setAttribute("products", products);
        req.setAttribute("productsFeatured", productsFeatured);
        //req.setAttribute("categoryProducts", categoryProducts);

        req.getRequestDispatcher("product.jsp").forward(req, resp);
    }
}
