/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import object.MobileDAO;
import object.MobileDTO;
import object.MobileErr;

/**
 *
 * @author Admin
 */
@WebServlet(name = "CreateController", urlPatterns = {"/CreateController"})
public class CreateController extends HttpServlet {

    private static final String ERROR = "create.jsp";
    private static final String SUCCESS = "manager.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        MobileDAO dao = new MobileDAO();
        MobileErr mobileErr = new MobileErr();
        try {
            String mobileId = request.getParameter("mobileId");
            String description = request.getParameter("description");
            String price = request.getParameter("price");
            String mobileName = request.getParameter("mobileName");
            String yearOfProduction = request.getParameter("yearOfProduction");
            String quantity = request.getParameter("quantity");

            boolean checkValidation = true;
            if (mobileId.length() > 10 || mobileId.length() <= 0) {
                mobileErr.setMobileId("Mobile ID must be at range (0,10]");
                checkValidation = false;
            }
            boolean checkDuplicate = dao.checkDuplicate(mobileId);
            if (checkDuplicate) {
                mobileErr.setMobileId("Duplicate userID!");
                checkValidation = false;
            }
            if (description.trim().isEmpty()) {
                mobileErr.setDescription("Description is required.");
                checkValidation = false;
            } else if (description.trim().length() > 250) {
                mobileErr.setDescription("Description must not exceed 250 characters.");
                checkValidation = false;
            } else if (description.matches("\\d+")) {
                mobileErr.setDescription("Description cannot consist of only numbers.");
                checkValidation = false;
            }
            if (Float.parseFloat(price) <= 0) {
                mobileErr.setPrice("Price must be postive number");
                checkValidation = false;
            }
            if (mobileName == null || mobileName.trim().isEmpty()) {
                mobileErr.setMobileName("Mobile name is required.");
                checkValidation = false;
            } else if (mobileName.trim().length() > 20) {
                mobileErr.setMobileName("Mobile name must not exceed 20 characters.");
                checkValidation = false;
            } else if (mobileName.matches("\\d+")) {
                mobileErr.setMobileName("Mobile name cannot consist of only numbers.");
                checkValidation = false;
            }
            if (Integer.parseInt(yearOfProduction) <= 0) {
                mobileErr.setYearOfProduction("Year must not be negative nor 0");
                checkValidation = false;
            }
            if (Integer.parseInt(quantity) <= 0) {
                mobileErr.setQuantity("Quantity must not be negative nor 0");
                checkValidation = false;
            }
            if (checkValidation) {
                MobileDTO mobile = new MobileDTO(mobileId, description, Float.parseFloat(price), mobileName, Integer.parseInt(yearOfProduction), Integer.parseInt(quantity), false);
                boolean checkInsert = dao.insert(mobile);
                if (checkInsert) {
                    url = SUCCESS;
                }
            } else {
                request.setAttribute("MOBILE_ERROR", mobileErr);
            }
        } catch (Exception e) {
            log("Error at CreateController: " + e.toString());
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
