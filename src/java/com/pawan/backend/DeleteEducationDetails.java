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

/**
 *
 * @author pawan kumar
 */
public class DeleteEducationDetails extends HttpServlet
{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
    {
        String id2= req.getParameter("id1");
        
        Connection con=null;
        PreparedStatement ps=null;
        try 
        {
            con= DbConnection.getConnect();
            con.setAutoCommit(false);
            
            ps= con.prepareStatement("delete from education where id=?");
                    ps.setString(1, id2);
                    
                    int i= ps.executeUpdate();
                    if (i>0)
                    {
                        con.commit();
                        resp.sendRedirect("profile.jsp");
                    }
                    else{
                        con.rollback();
                        RequestDispatcher rd1= req.getRequestDispatcher("error.jsp");
                        rd1.include(req, resp);
                        RequestDispatcher rd2= req.getRequestDispatcher("edit-education-details.jsp");
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
            RequestDispatcher rd1= req.getRequestDispatcher("error.jsp");
            rd1.include(req, resp);
            RequestDispatcher rd2= req.getRequestDispatcher("edit-education-details.jsp");
            rd2.include(req, resp);
        }
        finally
        {
            try 
            {
               con.close();
               ps.close();
            } 
            catch (Exception e) 
            {
               e.printStackTrace();
            }
            
        }
    }
    
    
}
