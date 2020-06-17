package com.example.controller;

import com.example.da.ProductDAO;
import com.example.entity.Product;
import com.example.entity.User;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/")



public class ProductServlet extends HttpServlet {

    private ProductDAO productDAO;
    public void init(){productDAO = new ProductDAO();
    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        doGet(request,response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        String action = request.getServletPath();
        try {
            switch (action){
                case "/new":
                    showNewFrom(request,response);
                    break;
                default:
                    listProduct(request,response);
                    break;
            }
        } catch (SQLException |ClassNotFoundException ex){
            throw new ServletException(ex);
        }
    }
    private void showNewFrom(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("product1.jsp");
        dispatcher.forward(request,response);
    }
    private void listProduct(HttpServletRequest request, HttpServletResponse response) throws SQLException, ClassNotFoundException, ServletException, IOException {
        List<Product> listProduct = productDAO.selectAllProduct();
        request.setAttribute("listProduct",listProduct);
        RequestDispatcher dispatcher = request.getRequestDispatcher("product.jsp");
        dispatcher.forward(request,response);
    }
}
