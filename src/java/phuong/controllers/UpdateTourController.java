/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phuong.controllers;

import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import phuong.daos.TourDAO;
import phuong.dtos.TourDTO;
import phuong.dtos.TourErrorObj;

/**
 *
 * @author User
 */
public class UpdateTourController extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String SUCCESS = "SearchTourController";
    private static final String INVALID = "updatetour.jsp";

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
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        try {
            TourErrorObj errObj = new TourErrorObj();
            boolean valid = true;

            String search = request.getParameter("txtSearch");

            String id = request.getParameter("txtId");

            String name = request.getParameter("txtName");
            if (name.length() == 0) {
                errObj.setNameErr("Tour name can not be blank!");
                valid = false;
            }

            String des = request.getParameter("txtDes");
            if (des.length() == 0) {
                errObj.setDesErr("Description can not be blank!");
                valid = false;
            }

            Date start = null;
            try {
                start = new Date(sdf.parse(request.getParameter("txtStart")).getTime());
                if (start == null) {
                    errObj.setDateStartErr("Start date can not be blank!");
                    valid = false;
                }
            } catch (ParseException e) {
                errObj.setDateStartErr("Wrong format date!");
                valid = false;
            }

            Date end = null;
            try {
                end = new Date(sdf.parse(request.getParameter("txtEnd")).getTime());
                if (end == null) {
                    errObj.setDateEndErr("End date can not be blank!");
                    valid = false;
                }
            } catch (ParseException e) {
                errObj.setDateEndErr("Wrong format date!");
                valid = false;
            }

            String maxSeat = request.getParameter("txtSeat");
            int seat = -1;
            try {
                seat = Integer.parseInt(maxSeat);
                if (seat == -1 || maxSeat == null) {
                    errObj.setMaxSeatErr("Max seat can not be blank!");
                    valid = false;
                } else if (seat < 0) {
                    errObj.setMaxSeatErr("Max seat must be a positive number.");
                    valid = false;
                }
            } catch (NumberFormatException e) {
                errObj.setMaxSeatErr("Only contains number.");
                valid = false;
            }

            String priceTour = request.getParameter("txtPrice");
            float price = -1;
            try {
                price = Float.parseFloat(priceTour);
                if (price == -1 || priceTour == null) {
                    errObj.setPriceErr("Price can not be blank!");
                    valid = false;
                } else if (price <= 0) {
                    errObj.setPriceErr("Price must be more than 0!");
                    valid = false;
                }
            } catch (NumberFormatException e) {
                errObj.setPriceErr("Only contains number.");
                    valid = false;
            }

            TourDTO dto = new TourDTO(id, name, des, start, end, seat, price, true);

            //validate
            if (start.after(end)) {
                errObj.setDateStartErr("Start date can not be after end date!");
                valid = false;
            }

            if (end.before(start)) {
                errObj.setDateEndErr("End date can not be before start date!");
                valid = false;
            }

            if (valid) {
                TourDAO dao = new TourDAO();
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
            log("Error at UpdateTourController: " + e.getMessage());
            e.printStackTrace();
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
