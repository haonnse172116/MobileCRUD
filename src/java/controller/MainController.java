/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
public class MainController extends HttpServlet {

    private static final String ERROR = "error.jsp";
    public static final String LOGIN = "Login";
    public static final String LOGIN_CONTROLLER = "LoginController";
    public static final String LOGOUT = "Logout";
    public static final String LOGOUT_CONTROLLER = "LogoutController";
    public static final String SEARCH = "Search";
    public static final String SEARCH_CONTROLLER = "SearchController";
    public static final String DELETE = "Delete";
    public static final String DELETE_CONTROLLER = "DeleteController";
    public static final String UPDATE = "Update";
    public static final String UPDATE_CONTROLLER = "UpdateController";
    private static final String CREATE = "Create";
    private static final String CREATE_CONTROLLER = "CreateController";
    private static final String PRICE_SEARCH = "PriceSearch";
    private static final String PRICE_SEARCH_CONTROLLER = "PriceSearchController";
    private static final String ADD = "Add";
    private static final String ADD_TO_CART_CONTROLLER = "AddToCartController";
    private static final String VIEW = "View Cart";
    private static final String VIEW_CONTROLLER = "mobileCart.jsp";
    private static final String CHANGE = "Change";
    private static final String CHANGE_CONTROLLER = "ChangeController";
    private static final String REMOVE = "Remove";
    private static final String REMOVE_CONTROLLER = "RemoveController";
    private static final String SAVE_CART = "Save Cart";
    private static final String SAVE_CART_CONTROLLER = "SaveCartController";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String action = request.getParameter("btAction");
            if (action.equals(LOGIN)) {
                url = LOGIN_CONTROLLER;
            }
            else if (action.equals(LOGOUT)) {
                url = LOGOUT_CONTROLLER;
            }
            else if (action.equals(SEARCH)) {
                url = SEARCH_CONTROLLER;
            }
            else if (action.equals(DELETE)) {
                url = DELETE_CONTROLLER;
            }
            else if (action.equals(UPDATE)) {
                url = UPDATE_CONTROLLER;
            }
            else if (action.equals(CREATE)) {
                url = CREATE_CONTROLLER;
            }
            else if (action.equals(PRICE_SEARCH)) {
                url = PRICE_SEARCH_CONTROLLER;
            }
            else if (action.equals(ADD)) {
                url = ADD_TO_CART_CONTROLLER;
            }
            else if (action.equals(VIEW)) {
                url = VIEW_CONTROLLER;
            }
            else if (action.equals(CHANGE)) {
                url = CHANGE_CONTROLLER;
            }
            else if (action.equals(REMOVE)) {
                url = REMOVE_CONTROLLER;
            }
            else if (action.equals(SAVE_CART)) {
                url = SAVE_CART_CONTROLLER;
            }
            else {
                request.setAttribute("ERROR", "Your action not support");
            }
        } catch (Exception e) {
            log("Error at MainController:" + e.toString());
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
