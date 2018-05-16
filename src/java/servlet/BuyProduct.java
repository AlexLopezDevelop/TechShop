/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import static com.sun.corba.se.spi.presentation.rmi.StubAdapter.request;
import dao.TechShopDAO;
import entities.User;
import exceptions.ExceptionsTechShop;
import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 *
 * @author alexlopez
 */
@WebServlet(name = "BuyProduct", urlPatterns = {"/BuyProduct"})
public class BuyProduct extends HttpServlet {

    TechShopDAO techShopDAO = new TechShopDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            User user = (User) request.getSession(true).getAttribute("user");
            entities.Transaction transaction = new entities.Transaction();
            transaction.setProduct(techShopDAO.allProductData(request.getParameter("idproduct")));
            transaction.setUser(user);
            techShopDAO.buyProduct(transaction);
            request.setAttribute("Status", "Comprado correctamente");
            request.getRequestDispatcher("JSP/Status.jsp").forward(request, response);
        } catch (SQLException | ClassNotFoundException | ExceptionsTechShop ex) {
            request.setAttribute("Status", ex.getMessage());
            request.getRequestDispatcher("JSP/Status.jsp").forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
