/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet;

import dao.DAO;
import entity.AccountDTO;
import entity.Message;
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
public class realTimeChat extends HttpServlet {

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
      String fromUser= request.getParameter("fromUser");
     String toUser= request.getParameter("toUser");
        System.out.println(fromUser+"" + toUser);
       HttpSession session = request.getSession();
        AccountDTO a = (AccountDTO) session.getAttribute("acc");
     DAO dao = new DAO();
     String data ="";
//     List<Message> chats = dao.getMessage1(fromUser, toUser, toUser, fromUser);
//     for(Message dto: chats){
//                                    
//                                             if(dto.getFromUser()== a.getuID()){
//                                                  data .= "<div style=\"text-align: right;\">\n" +
//"                                             <p style=\"background-color: lightblue;word-wrap: break-word; display:inline-block; padding: 5px;border-radius: 10px; max-width: 70% \">\n" +dto.getMessage()+
//"                                                 \n" +
//"                                             </p>\n" +
//"                                             \n" +
//"                                         </div>";
//                                             }else{
//                                                  data .="<div style=\"text-align: left;\">\n" +
//"                                             <p style=\"background-color: lightblue;word-wrap: break-word; display:inline-block; padding: 5px;border-radius: 10px; max-width: 70% \">\n" +dto.getMessage()+
//"                                               ${dto.getMessage()}  \n" +
//"                                             </p>\n" +
//"                                             \n" +
//"                                         </div>";
//                                             }                                
//                                 
//     }
//     response.setContentType("text/plain");  // Set content type of the response so that jQuery knows what it can expect.
//    response.setCharacterEncoding("UTF-8"); // You want world domination, huh?
//    response.getWriter().write(data); 
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
