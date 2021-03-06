package com.codegym.controller.maincontroller;

import com.codegym.dao.ProductDAO;
import com.codegym.model.Product;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "TVServlet",urlPatterns = "/tivi")
public class TVServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ProductDAO productDAO;

    public void init() {
        productDAO = new ProductDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) action = "";

        switch (action) {
            case "view":
                showDetailOfTV(request,response);
                break;
            default:
                showListOfTV(request,response);
                break;
        }
    }

    private void showDetailOfTV(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        Product product = productDAO.selectProduct(id);
        List<String> details = productDAO.getDetailOfTV(id);

        request.setAttribute("product",product);
        request.setAttribute("details",details);

        RequestDispatcher dispatcher = request.getRequestDispatcher("views/main/product_detail.jsp");
        dispatcher.forward(request,response);
    }

    private void showListOfTV(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Product> products;
        products = productDAO.getProductNewByType("tivi",9);
        request.setAttribute("products",products);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/views/main/tivi.jsp");
        dispatcher.forward(request,response);
    }
}
