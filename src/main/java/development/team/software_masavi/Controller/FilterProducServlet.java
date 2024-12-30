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

@WebServlet(name = "FiltrarProductosServlet", urlPatterns = {"/FiltrarProductosServlet"})
public class FilterProducServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Obtener los parámetros del formulario
        String nombre = req.getParameter("nombre");
        String categoria = req.getParameter("categoria");

        List<Product> productsFilter = CatalogoProducts.filterProducts(nombre,categoria);

        req.setAttribute("filteredProducts", productsFilter);
        req.getRequestDispatcher("product.jsp").forward(req, resp);
    }
}
