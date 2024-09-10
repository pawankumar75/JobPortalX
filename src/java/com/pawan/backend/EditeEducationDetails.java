/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.pawan.backend;

import com.pawan.connection.DbConnection;
import java.io.IOException;
import java.io.PrintWriter;
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
public class EditeEducationDetails extends HttpServlet
{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
    {
         PrintWriter out = resp.getWriter();
        
//        String email2=(String)session.getAttribute("session_email");
        HttpSession session= req.getSession();
        
        String id2=req.getParameter("id1");
        String school2=req.getParameter("school1");
        String degree2=req.getParameter("degree1");
        String year2=req.getParameter("year1");
        String grade2=req.getParameter("grade1");
        String description2=req.getParameter("description1");
        
        Connection con=null;
        PreparedStatement ps=null;
        try
        {
            con = DbConnection.getConnect();
            con.setAutoCommit(false);
            
            ps = con.prepareStatement("update education set school=?, degree=?, year=?, grade=?, description=? where id=?");
            
            ps.setString(1, school2);
            ps.setString(2, degree2);
            ps.setString(3, year2);
            ps.setString(4, grade2);
            ps.setString(5, description2);
            ps.setString(6, id2);
            
            int i=ps.executeUpdate();
            if(i>0)
            {
                con.commit();
                resp.sendRedirect("profile.jsp");
            }
            else
            {
                con.rollback();
                RequestDispatcher rd1=req.getRequestDispatcher("error.jsp");
                rd1.include(req, resp);
                
                RequestDispatcher rd2=req.getRequestDispatcher("edit-education-details.jsp");
                rd2.include(req, resp);
            }
        }
        catch(Exception e)
        {
            try 
            {
               con.rollback();
            } 
            catch (Exception ee) 
            {
                ee.printStackTrace();
            }
            //out.print("Exception "+e);
            RequestDispatcher rd1=req.getRequestDispatcher("error.jsp");
            rd1.include(req, resp);

            RequestDispatcher rd2=req.getRequestDispatcher("edit-education.jsp");
            rd2.include(req, resp);
        }
        finally
        {
            try
            {
              ps.close();
              con.close();
            }
            catch (Exception ee) 
            {
                ee.printStackTrace();
            }
            
        }
    }
    
    
}
