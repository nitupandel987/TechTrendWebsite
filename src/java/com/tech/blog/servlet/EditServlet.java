/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.tech.blog.servlet;

import com.tech.blog.dao.userDao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;
import com.tech.blog.helper.Helper;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;



@MultipartConfig
public class EditServlet extends HttpServlet {

  
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
       
//            fetch all data

              String userName = request.getParameter("user_name");
              String userEmail = request.getParameter("user_email");
              
              String userPass = request.getParameter("user_password");
              String userAbout = request.getParameter("user_about");
              
//              image fetching
              
              Part part = request.getPart("image");
              String imageName = part.getSubmittedFileName();
//          get the user from the session
              HttpSession s = request.getSession();
              User user = (User)s.getAttribute("currentUser");
              
              user.setName(userName);
              user.setEmail(userEmail);
              user.setPassword(userPass);
              user.setAbout(userAbout);
              String oldPath = user.getProfile();
              user.setProfile(imageName);
              
//              Update databases

               userDao userDao = new userDao(ConnectionProvider.getConnection());
               boolean ans = userDao.updateUser(user);
               if(ans){
                   out.print("Updated to dp");
                   
                   String path = request.getRealPath("/")+
                       "pics"+File.separator+user.getProfile();
                    String oldFilePath = request.getRealPath("/")+
                       "pics"+File.separator+oldPath;
                   
                    if(!oldPath.equals("default.png"));
                       Helper.deleteFile(oldFilePath);
                   
                   
                        if(Helper.saveFile(part.getInputStream(), path)){
                            Message msg = new Message("Profile Updated!!","success","alert-success");
                            s.setAttribute("message", msg);
                        }
                        else{
                            Message msg = new Message("Profile NOT Updated!!","error","alert-danger");
                            s.setAttribute("message", msg);
                        }
                            
                    }
               
               else{
                    Message msg = new Message("Profile NOT Updated!!","error","alert-danger");
                    s.setAttribute("message", msg);
               }
               
               
               response.sendRedirect("profile.jsp");
              
         
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
