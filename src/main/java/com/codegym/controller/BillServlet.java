package com.codegym.controller;

import com.codegym.dao.BillDAO;
import com.codegym.model.Bill;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "BillServlet", urlPatterns = "/bill")
public class BillServlet extends javax.servlet.http.HttpServlet {
    private static final long serialVersionUID = 1L;
    private BillDAO billDAO;

    public void init() {
        billDAO = new BillDAO();
    }

    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {

    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) action = "";

        try {
            switch (action) {
                case "create":
                    break;
                default:
                    listBill(request,response);
                    break;
            }
        } finally {

        }
    }

    private void listBill(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Bill> bills = billDAO.selectAllBill();
        request.setAttribute("bills", bills);
        RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/views/bill/list_bill.jsp");
        dispatcher.forward(request,response);
    }
}