/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phuong.controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import phuong.daos.CartDAO;
import phuong.daos.OrderDAO;
import phuong.daos.TourDAO;
import phuong.dtos.CartDTO;

/**
 *
 * @author User
 */
public class CheckOutController extends HttpServlet {

    private static final String SUCCESS = "success.jsp";
    private static final String ERROR = "error.jsp";
    private static final String INVALID = "viewcart.jsp";

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            HttpSession session = request.getSession();
            CartDAO cart = (CartDAO) session.getAttribute("CART");
            TourDAO tourDao = new TourDAO();
            int quantity, seat;
            String tourid;
            boolean valid = true;
            for (CartDTO dto : cart.getCart().values()) {
                tourid = dto.getTour().getId();
                quantity = dto.getQuantity();
                seat = tourDao.getSeat(tourid);

                if (seat - quantity < 0) {
                    valid = false;
                }
            }

            if (valid) {
                OrderDAO dao = new OrderDAO();
                dao.insert(cart);
                url = SUCCESS;
                session.removeAttribute("CART");

            } else {
                url = INVALID;
                request.setAttribute("INVALID", "Quantity can not be more than available seat");
            }
        } catch (Exception e) {
            log("Error at CheckOutController: " + e.getMessage());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
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
