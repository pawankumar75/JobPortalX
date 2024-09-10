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
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author pawan kumar
 */
public class Register extends HttpServlet
{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
    {
        resp.setContentType("text/html");
		PrintWriter out = resp.getWriter();
		
		String name2= req.getParameter("name1");
		String email2= req.getParameter("email1");
		String pass2= req.getParameter("pass1");
		String gender2= req.getParameter("gender1");
		String[] field2= req.getParameterValues("field1");
		String city2= req.getParameter("city1");
		
                String fields2="";
                if(field2!=null){
	        for(String s:field2)
	        {
	            fields2=fields2+","+s;
	        }
                }
		
		try
		{
                        Connection con = DbConnection.getConnect();
                        
			PreparedStatement ps = con.prepareStatement("insert into register(name,email,password,gender,field,city) value(?,?,?,?,?,?)");
			
			ps.setString(1, name2);
			ps.setString(2, email2);
			ps.setString(3, pass2);
			ps.setString(4, gender2);
			ps.setString(5, fields2);
			ps.setString(6, city2);
			int i1=ps.executeUpdate();
                        
                        PreparedStatement ps2 = con.prepareStatement("insert into about_user(email,about,skill) value(?,?,?)");
                        ps2.setString(1, email2);
                        ps2.setString(2, "");
                        ps2.setString(3, "");
                        int i2 = ps2.executeUpdate();
                        
                        PreparedStatement ps3 = con.prepareStatement("insert into profile_pics(email,path) value(?,?)");
                        ps3.setString(1, email2);
                        ps3.setString(2, "profilePic.png");
                        
			if(i1>0 && i2>0) 
			{
                            HttpSession session = req.getSession();
                            session.setAttribute("s_name", name2);
                            session.setAttribute("s_email", email2);
                            session.setAttribute("s_gender", gender2);
                            session.setAttribute("s_city", city2);
                            session.setAttribute("s_fields", field2);
                            
                            session.setAttribute("s_title", "");
                            session.setAttribute("s_skills", "");
                            
                            session.setAttribute("s_profilepic", "profilePic.png");
//				out.print("user register successfully");
                                resp.sendRedirect("profile.jsp");
			}
			else
			{
			    out.println("faield");	
			}
			
		}
		catch(Exception e) 
		{
			e.printStackTrace();
		}
    }
    
    
}
