/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import dao.DAO;
import entity.AccountDTO;
import entity.Product;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */

public class UpdateAccountServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        int pk = Integer.parseInt(request.getParameter("pk"));
        DAO dao = new DAO();
        AccountDTO result = dao.searchAccount(pk);
        request.setAttribute("result", result);
        request.getRequestDispatcher("updateAccount.jsp").forward(request, response);

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    int id=Integer.parseInt(request.getParameter("id"));
    String name = request.getParameter("user");
    String pass = request.getParameter("pass");
    int sell = Integer.parseInt(request.getParameter("sell"));
    int role = Integer.parseInt(request.getParameter("role"));
    
    if (sell>1||sell<0) {
            request.setAttribute("mess","1 for yes,0 for no");
        }
    if (role>1||role<0) {
            request.setAttribute("mess","1 for admin,0 for user");
        }
    DAO adao = new DAO();
    adao.UpdateAccount(id, name, pass, sell, role);
    response.sendRedirect("DisplayAccountServlet");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
