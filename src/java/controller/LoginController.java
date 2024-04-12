/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import object.UserDAO;
import object.UserDTO;

/**
 *
 * @author Admin
 */
@WebServlet(name = "LoginController", urlPatterns = {"/LoginController"})
public class LoginController extends HttpServlet {

    public static final String ERROR = "login.jsp";
    public static final int ADMIN = 2;
    public static final String USER_PAGE = "user.jsp";
    public static final int USER = 0;
    public static final String MANAGER_PAGE = "manager.jsp";
    public static final int MANAGER = 1;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String userId = request.getParameter("userId");
            String password = request.getParameter("password");
            UserDAO dao = new UserDAO();
            UserDTO dto = dao.checkLogin(userId, Integer.parseInt(password));
            if (dto != null) {
                HttpSession session = request.getSession();
                session.setAttribute("LOGIN_USER", dto);
                int role = dto.getRole();
                if (role == ADMIN || role == MANAGER) {  
                    url = MANAGER_PAGE;  
                }
                else if (role == USER) {
                    url = USER_PAGE;
                } else {
                    request.setAttribute("ERROR", "Your role is not support!");
                }
            } else {
                request.setAttribute("ERROR", "Incorrect userID or Password");
            }

        } catch (Exception e) {
            log("Error at LoginController: " + e.toString());
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
