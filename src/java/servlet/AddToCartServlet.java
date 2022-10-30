/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet;

import dao.DAO;
import entity.Items;
import entity.Order;
import entity.Product;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Derek
 */
public class AddToCartServlet extends HttpServlet {

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
        int quantity = 1;
        if(request.getParameter("id") != null){
            DAO dao = new DAO();
            String id = request.getParameter("id");
            Product result = dao.getProductByPId(id);
            if(result != null){
                if(request.getParameter("quantity")!=null){
                    quantity = Integer.parseInt(request.getParameter("quantity"));
                }
                HttpSession session = request.getSession();
                if(session.getAttribute("order")==null){
                    Order order= new Order();
                    List<Items> list = new ArrayList<>();
                    Items item = new Items();
                    item.setQuantity(quantity);
                    item.setProduct(result);
                    item.setPrice(result.getPrice());
                    list.add(item);
                    order.setItems(list);
                    session.setAttribute("order", order);
                }else{
                    Order order = (Order) session.getAttribute("order");
                    List<Items> list = order.getItems();
                    boolean check = false;
                    for(Items item: list){
                        if(item.getProduct().getId()==result.getId()){
                            item.setQuantity(item.getQuantity()+quantity);
                            check = true;
                        }
                    }
                    if(check==false){
                        Items item = new Items();
                        item.setQuantity(quantity);
                        item.setProduct(result);
                        item.setPrice(result.getPrice());
                        list.add(item);
                    }
                    session.setAttribute("order", order);
                }
            }
           
            response.sendRedirect("HomeServlet");
        }else{
            response.sendRedirect("HomeServlet");
        }
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
