/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import object.MobileDAO;
import object.MobileDTO;

/**
 *
 * @author Admin
 */
@WebServlet(name = "PriceSearchController", urlPatterns = {"/PriceSearchController"})
public class PriceSearchController extends HttpServlet {

     private static final String ERROR="mobileShop.jsp";
    private static final String SUCCESS="mobileShop.jsp";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url= ERROR;
        try {
            String minPrice= request.getParameter("minPrice");
            if(minPrice.trim().isEmpty()){
                minPrice = "0";
            }
            String maxPrice= request.getParameter("maxPrice");
            if(maxPrice.trim().isEmpty()){
                maxPrice = "1000";
            }
            MobileDAO dao= new MobileDAO(); 
            List<MobileDTO> listMobile= dao.getListByMinAndMax(minPrice, maxPrice);
            if(listMobile.size()>0){
                request.setAttribute("LIST_MOBILE", listMobile);
                url= SUCCESS;
            }
            
        } catch (Exception e) {
            log("Error at SearchController:"+ e.toString());
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