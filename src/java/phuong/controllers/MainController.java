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

/**
 *
 * @author User
 */
public class MainController extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String LOGIN = "LoginController";
    private static final String LOGOUT = "LogoutController";
    private static final String REGISTER = "RegisterController";

    private static final String SEARCHUSER = "SearchUserController";
    private static final String DELETEUSER = "DeleteUserController";
    private static final String EDITUSER = "EditUserController";
    private static final String UPDATEUSER = "UpdateUserController";

    private static final String SEARCHTOUR = "SearchTourController";
    private static final String DELETETOUR = "DeleteTourController";
    private static final String EDITTOUR = "EditTourController";
    private static final String UPDATETOUR = "UpdateTourController";
    private static final String INSERTTOUR = "InsertTourController";
    private static final String SHOWTOUR = "ShowTourController";

    private static final String ADDCART = "AddCartController";
    private static final String MYCART = "viewcart.jsp";
    private static final String REMOVECART = "RemoveCartController";
    private static final String UPDATECART = "UpdateCartController";

    private static final String CHECKOUT = "CheckOutController";
    private static final String MYORDER = "ShowOrderController";
    private static final String CANCEL = "CancelController";
    private static final String SEARCHORDER = "SearchOrderController";

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
            String action = request.getParameter("action");
            if (action.equals("Login")) {
                url = LOGIN;
            } else if (action.equals("Logout")) {
                url = LOGOUT;
            } else if (action.equals("Register")) {
                url = REGISTER;
            } else if (action.equals("Search User")) {
                url = SEARCHUSER;
            } else if (action.equals("Delete User")) {
                url = DELETEUSER;
            } else if (action.equals("Edit User")) {
                url = EDITUSER;
            } else if (action.equals("Update User")) {
                url = UPDATEUSER;
            } else if (action.equals("Search Tour")) {
                url = SEARCHTOUR;
            } else if (action.equals("Delete Tour")) {
                url = DELETETOUR;
            } else if (action.equals("Edit Tour")) {
                url = EDITTOUR;
            } else if (action.equals("Update Tour")) {
                url = UPDATETOUR;
            } else if (action.equals("Insert")) {
                url = INSERTTOUR;
            } else if (action.equals("Show Tour")) {
                url = SHOWTOUR;
            } else if (action.equals("Add Cart")) {
                url = ADDCART;
            } else if (action.equals("My Cart")) {
                url = MYCART;
            } else if (action.equals("Remove")) {
                url = REMOVECART;
            } else if (action.equals("Update Quantity")) {
                url = UPDATECART;
            } else if (action.equals("Check Out")) {
                url = CHECKOUT;
            } else if (action.equals("My Order")) {
                url = MYORDER;
            } else if (action.equals("Cancel")) {
                url = CANCEL;
            } else if (action.equals("Search Order")) {
                url = SEARCHORDER;
            } else {
                request.setAttribute("ERROR", "Action is not supported");
            }
        } catch (Exception e) {
            log("Error at MainController: " + e.getMessage());
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
