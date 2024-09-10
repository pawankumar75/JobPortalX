<%-- 
    Document   : edit-experience-details
    Created on : 29-Aug-2024, 3:47:00 pm
    Author     : pawan kumar
--%>
<%@page import="com.pawan.connection.DbConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:declaration>
    String company="", location="", year="", job_title="", description="";
</jsp:declaration>

<jsp:scriptlet>
        String name = (String)session.getAttribute("s_name");
        String id = request.getParameter("id");
        
//         String school="", degree="", year="", grade="", description="";
    try
    {
        Connection con= DbConnection.getConnect();
        
        PreparedStatement ps=con.prepareStatement("select*from experience where id=?");
        ps.setString(1, id);
        ResultSet rs=ps.executeQuery();
        while(rs.next())
        {
            company=rs.getString("company");
            location=rs.getString("location");
            year=rs.getString("year");
            job_title=rs.getString("job_title");
            description=rs.getString("description");
        }
    }
    catch(Exception e)
    {
         out.print(e);
    }
        
        
</jsp:scriptlet>

<jsp:scriptlet>
    if(name==null || name.equals(""))
    {
       response.sendRedirect("login.jsp");
    }
</jsp:scriptlet>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Experience</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" ></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" type="text/css" href="css/style.css" />
        <script>
        function submitFunction(val)
            {
                if(val==='update')
                {
                    document.editexpfrom.action="EditExperienceDetails";
                    document.editexpfrom.submit();
                }
                if(val==='delete')
                {
                    document.editexpfrom.action="DeleteExperienceDetails";
                    document.editexpfrom.submit();
                }
                
            } 
        </script>
    </head>
    <body>
        <jsp:include page="profileheader.jsp" />
     <jsp:include page="menubar.jsp" />
     
     <div class="row">
         <div class="col-md-2"> </div>
         <div class="col-md-8">
             <div class="row" style="border: 1px solid gray; box-shadow: 0px 0px 2px gray">
             <div class="col-md-2">
                 <img src="images/experience.png" height="100" />
             </div>
                <div class ="col-md-10">
                    <form action="editexpfrom"  method="POST" name="editexpfrom">
                        <h2>Edit Experience Details</h2>
                        <input type="hidden" value="<jsp:expression>id</jsp:expression>" name="id1" />
                        <b><jsp:expression>name</jsp:expression> </b>(<jsp:expression> session.getAttribute("s_email")</jsp:expression>) <br> <br>
                        School/Collage/University: <br> <input type="text" value="<jsp:expression>company</jsp:expression>" name="school1" class="textfield_design" /> <br> <br>
                        Degree: <br> <input type="text"  name="degree1" class="textfield_design" value="<jsp:expression>location</jsp:expression>" /> <br> <br>
                        Year: <br> <input type="text"  name="year1" class="textfield_design" value="<jsp:expression>year</jsp:expression>" /> <br><br>
                        Job_title: <br> <input type="text"  name="grade1" class="textfield_design" value="<jsp:expression>job_title</jsp:expression>" /><br><br>
<!--                        Description: <br>
                        <textarea placeholder="description" name="description1" style="padding: 5px 10px; width: 300px; height: 100px; border-radius: 5px; border: 1px solid gray;"></textarea> <br> <br>-->
                         <input type="submit" value="Update " class="btn btn-danger" onclick="submitFunction('update')" />
                         <input type="submit" value="Delete " class="btn btn-danger" onclick="submitFunction('delete')" />
                    </form>    
                  
                </div>
             </div>
          </div>
      </div>
         <div class="col-md-2"> </div>
         
     </div>
             
      <jsp:include page="footer.jsp" />
    </body>
</html>
