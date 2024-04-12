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
import javax.servlet.http.HttpSession;
import object.CartDTO;
import object.MobileDTO;

/**
 *
 * @author Admin
 */
@WebServlet(name = "AddToCartController", urlPatterns = {"/AddToCartController"})
public class AddToCartController extends HttpServlet {

   private static final String ERROR="mobileShop.jsp";
    private static final String SUCCESS="mobileShop.jsp";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
         String url= ERROR;
        try {
            String cmbMobile= request.getParameter("cmbMobileName");
            String tmp[]= cmbMobile.split("-");
            String mobileId= tmp[0];
            String mobileName= tmp[1];
            float price= Float.parseFloat(tmp[2]);
            int quantity= Integer.parseInt(request.getParameter("cmbQuantity"));
            
            HttpSession session= request.getSession();
            CartDTO cart= (CartDTO)session.getAttribute("CART");
            if(cart == null){
                cart= new CartDTO();
            }
            boolean check= cart.add(new MobileDTO(mobileId, price, mobileName, quantity));
            if(check){
                session.setAttribute("CART", cart);
                request.setAttribute("MESSAGE", "You added "+ tmp[1]+". quantity: "+ quantity);
                url=SUCCESS;
            }
            
        } catch (Exception e) {
            log("Error at AddToCartController: "+ e.toString());
        }finally{
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
