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
import phuong.daos.RegistrationDAO;
import phuong.dtos.RegistrationDTO;
import phuong.dtos.RegistrationErrorObj;

/**
 *
 * @author User
 */
public class UpdateUserController extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String SUCCESS = "user.jsp";
    private static final String INVALID = "updateuser.jsp";

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
            String username = request.getParameter("txtUsername");
            String fullname = request.getParameter("txtFullname");
            String address = request.getParameter("txtAddress");
            String phone = request.getParameter("txtPhone");
            RegistrationDTO dto = new RegistrationDTO(username, fullname, address, phone);

            //validate
            RegistrationErrorObj errObj = new RegistrationErrorObj();
            boolean valid = true;

            if (fullname.length() == 0) {
                errObj.setFullnameErr("Fullname can not be blank!");
                valid = false;
            }

            if (address.length() == 0) {
                errObj.setAddressErr("Address can not be blank!");
                valid = false;
            }

            if (phone.length() == 0) {
                errObj.setPhoneErr("Phone number can not be blank!");
                valid = false;
            } else if (!phone.matches("[0-9]{10,15}")) {
                errObj.setPhoneErr("Invalid phone number!");
                valid = false;
            }

            if (valid) {
                RegistrationDAO dao = new RegistrationDAO();
                boolean check = dao.update(dto);
                if (check) {
                    url = SUCCESS;
                } else {
                    request.setAttribute("ERROR", "Update failed!");
                }
            } else {
                request.setAttribute("INVALID", errObj);
                request.setAttribute("DTO", dto);
                url = INVALID;
            }
        } catch (Exception e) {
            log("Error at UpdateUserController: " + e.getMessage());
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
