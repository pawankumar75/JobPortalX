/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.pawan.connection;

import com.mysql.cj.jdbc.MysqlDataSource;
import java.io.InputStream;
import java.sql.Connection;
import java.util.Properties;

/**
 *
 * @author pawan kumar
 */
public class DbConnection
{
    static Connection con;
//   
    static public Connection getConnect()
    {
        String jdbc_url=null, username=null, password=null;
        try 
        {
//             Class.forName("com.mysql.cj.jdbc.Driver");
//             con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportal", "user name", "password");
            InputStream is= DbConnection.class.getResourceAsStream("db.properties");
            
            Properties p = new Properties();
            p.load(is);
            
//            MysqlDataSource ds= new MysqlDataSource();
//            ds.setURL("jdbc:mysql://localhost:3306/jobportal");
//            ds.setUser("user name");
//            ds.setPassword("password");

             jdbc_url=p.getProperty("jdbc_url");
             username=p.getProperty("username");
             password=p.getProperty("password");
            
           
        }
        catch (Exception e)
        {
//   
            e.printStackTrace();
        }
        try
        {
//            Class.forName("com.mysql.cj.jdbc.Driver");
//            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportal", "root", "12345");
            
              MysqlDataSource ds= new MysqlDataSource();
              ds.setURL("jdbc:mysql://localhost:3306/jobportal");
              ds.setUser("root");
              ds.setPassword("12345");  
              
              con= ds.getConnection();


        } 
        catch (Exception e)
        {
            e.printStackTrace();
        }
        
       return con;
    }
    
}
