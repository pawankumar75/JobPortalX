/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.pawan.backend;

import com.pawan.connection.DbConnection;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author pawan kumar
 */
public class ContactUs extends HttpServlet
{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
    {
       String name1 =req.getParameter("name1");
       String email1 =req.getParameter("email1");
       String subject1 =req.getParameter("subject1");
       String message1 =req.getParameter("message1");
       
        Date d = new Date();
        SimpleDateFormat sdf1 = new SimpleDateFormat("dd-mm-yyyy");
        String date1 = sdf1.format(d);
        
        SimpleDateFormat sdf2 = new SimpleDateFormat("HH:mm:ss");
        String time1 = sdf2.format(d);
        
        
        Connection con=null;
        try
        {
            con= DbConnection.getConnect();
            con.setAutoCommit(false);
            
             PreparedStatement ps = con.prepareStatement("insert into contact_us(name, email, subject, message, date1, time1) values(?,?,?,?,?,?)");
             ps.setString(1, name1);
              ps.setString(2, email1);
               ps.setString(3, subject1);
                ps.setString(4, message1);
                 ps.setString(5, date1);
                  ps.setString(6, time1);
                  
                int i= ps.executeUpdate();
                if (i>0)
                {
                  con.commit();
                  
                    RequestDispatcher rd1= req.getRequestDispatcher("success.jsp");
                    rd1.include(req, resp);
                    
                    RequestDispatcher rd2= req.getRequestDispatcher("contact-us.jsp");
                    rd2.include(req, resp);
                }
                else
                {
                    con.rollback();
                    
                    RequestDispatcher rd1= req.getRequestDispatcher("error.jsp");
                    rd1.include(req, resp);
                    
                    RequestDispatcher rd2= req.getRequestDispatcher("contact-us.jsp");
                    rd2.include(req, resp);
                    
                }
        }
        catch (Exception e)
        {
           e.printStackTrace();
           
            try
            {
                con.rollback();
                
           RequestDispatcher rd1= req.getRequestDispatcher("error.jsp");
           rd1.include(req, resp);
                    
           RequestDispatcher rd2= req.getRequestDispatcher("contact-us.jsp");
           rd2.include(req, resp);
            } 
            catch (Exception ee)
            {
                ee.printStackTrace();
            }
           
           RequestDispatcher rd1= req.getRequestDispatcher("error.jsp");
           rd1.include(req, resp);
                    
           RequestDispatcher rd2= req.getRequestDispatcher("contact-us.jsp");
           rd2.include(req, resp);
        }
        finally
        {
            try 
            {
              con.close();
            
            }
            catch (Exception e)
            {
               e.printStackTrace();
            }
            
        }
    }
    
    
}
