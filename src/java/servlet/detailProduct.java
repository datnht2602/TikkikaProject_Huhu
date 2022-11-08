/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet;

import dao.DAO;
import entity.AccountDTO;
import entity.InfoCart;
import entity.Product;
import java.io.IOException;
import java.io.PrintWriter;
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
public class detailProduct extends HttpServlet {

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
      String pk = request.getParameter("id");
      DAO dao = new DAO();
      Product result = dao.getProductByPId(pk);
        HttpSession session = request.getSession();
        AccountDTO a = (AccountDTO) session.getAttribute("acc");
      request.setAttribute("result", result);
          request.setAttribute("uid", a);
        System.out.println(pk);
        request.getRequestDispatcher("detailProduct.jsp").forward(request, response);
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
        String uid = request.getParameter("uid");
       int id = Integer.parseInt(uid);
       String pid = request.getParameter("pid");
          String name = request.getParameter("name");
       int pid_Check = Integer.parseInt(request.getParameter("pid"));
          String price = request.getParameter("price");
          DAO dao = new DAO();
        List<InfoCart> list = dao.getCart(id);
        boolean exist = false;
        for(InfoCart check : list){
            if(check.getPid() == pid_Check){
                exist = true;
            }
        }
        if(exist){
            String check = "San Pham Nay Da Co Trong Gio Hang";
             response.setContentType("text/plain");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().print(check);
        }else
                 dao.updateNotification(id, "vua them vao gio hang  " + name );
          dao.addCart(uid, pid, price);
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
