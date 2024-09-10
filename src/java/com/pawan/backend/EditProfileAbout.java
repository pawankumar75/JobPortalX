/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.pawan.backend;

import com.pawan.connection.DbConnection;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author pawan kumar
 */
public class EditProfileAbout extends HttpServlet
{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
    {
        HttpSession session = req.getSession();
        String email = (String)session.getAttribute("s_email");
        
        String name = req.getParameter("name1");
        String gender = req.getParameter("gender1");
        String city = req.getParameter("city1");
        String title = req.getParameter("title1");
        String skills = req.getParameter("skills1");
        
        Connection con = null;
        PreparedStatement ps1 = null;
        try 
        {
            con = DbConnection.getConnect();
            con.getAutoCommit();
            
            ps1 = con.prepareStatement("update register set name=?,gender=?,city=? where email=?");
            ps1.setString(1, name);
            ps1.setString(2, gender);
            ps1.setString(3, city);
            ps1.setString(4,email);
            int i1 = ps1.executeUpdate();
            
            PreparedStatement ps2= con.prepareStatement("update about_user set about=?, skill=? where email=?");
            ps2.setString(1, title);
            ps2.setString(2, skills);
            ps2.setString(3, email);
            int i2 = ps2.executeUpdate();
            
            if (i1>0 && i2>0)
            {
                con.commit();
                
                session.setAttribute("s_name", name);
                session.setAttribute("s_email", email);
                session.setAttribute("s_gender", gender);
                session.setAttribute("s_city", city);
//                session.setAttribute("s_field", field);

                 session.setAttribute("s_title", title);
                 session.setAttribute("s_skill", skills);
                 
                resp.sendRedirect("profile.jsp");
            }
            else
            {
                con.rollback();
                
                RequestDispatcher rd1 = req.getRequestDispatcher("error.jsp");
                rd1.include(req, resp);
                
                RequestDispatcher rd2 = req.getRequestDispatcher("edit-profile-about.jsp");
                rd2.include(req, resp);
            }

        }
        
        catch (Exception e) 
        {
             try
            {
              con.rollback();
            } 
            catch (Exception ee)
            {
                ee.printStackTrace();
            }
        }
        finally
        {
            try
            {
              ps1.close();
              con.close();
            }
            catch (Exception ee) 
            {
                ee.printStackTrace();
            }
            
        }
    }
    
    
}
