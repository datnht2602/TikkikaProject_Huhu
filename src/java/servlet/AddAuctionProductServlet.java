/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet;

import com.microsoft.sqlserver.jdbc.StringUtils;
import dao.DAO;
import entity.Category;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Derek
 */
public class AddAuctionProductServlet extends HttpServlet {

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
            DAO dao = new DAO();
        List<Category> category = dao.getAllCategory();
    request.setAttribute("category", category);
    request.getRequestDispatcher("addAuctionProduct.jsp").forward(request, response);
        
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
         String name = request.getParameter("name");
         System.out.println(name);
        int regular_price = Integer.parseInt(request.getParameter("regular_price"));
         System.out.println(regular_price);
        int start_bid = Integer.parseInt(request.getParameter("start_bid"));
          System.out.println(start_bid);
        String valueFromHtml= request.getParameter("birthdaytime");
        String dateTimeString = valueFromHtml.replace("T", " ");

        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
        LocalDateTime dateTime = LocalDateTime.parse(dateTimeString, formatter);
        Timestamp examDateTime = Timestamp.valueOf(dateTime);
        String datetime = examDateTime.toString();
        System.out.println(datetime);
        String description = request.getParameter("description");
          System.out.println(description);

         String image = request.getParameter("image");
           System.out.println(image);
        int cateId= Integer.parseInt(request.getParameter("category"));
          System.out.println(cateId);
        DAO dao = new DAO();
        if(dao.addAuctionProduct(name, cateId, description, regular_price, start_bid, datetime, image)){
            response.sendRedirect("ManageAuctionServlet");
        }
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
