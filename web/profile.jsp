<%@page import="com.pawan.connection.DbConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:scriptlet>
        String name = (String)session.getAttribute("s_name");
        String gender = (String)session.getAttribute("s_gender");
        String field = (String)session.getAttribute("s_field");
        String city = (String)session.getAttribute("s_city");
        String title = (String)session.getAttribute("s_title");
        String skill = (String)session.getAttribute("s_skill");
        String profile_pic = (String)session.getAttribute("s_profilepic");
</jsp:scriptlet>

<%-- it is use to send login page if name is null show on profie page --%>
<jsp:scriptlet>
    if(name==null || name.equals(""))
    {
       response.sendRedirect("login.jsp");
    }
</jsp:scriptlet>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Profile Page</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
		<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" ></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" type="text/css" href="css/style.css" />
    
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<body> 
    <jsp:include page="profileheader.jsp" />
     <jsp:include page="menubar.jsp" />
     
     <div class="row">
         <div class="col-md-2"> </div>
         <div class="col-md-8">
             <div class="row" style="border: 1px solid gray; box-shadow: 0px 0px 2px gray">
             <div class="col-md-4">
                 <a href="edit-profile-pic.jsp" style="font-size: 12px; float:right "> <span class="glyphicon glyphicon-pencil"></span></a>
                 <img src="profilepic/<jsp:expression>profile_pic</jsp:expression>" height="150" style="border-radius: 50px" />
             </div>
                <div class ="col-md-8">
                   <h3> <jsp:expression>name </jsp:expression><span style="font-size: 12px ; float: right"> <a href="edit-profile-about.jsp"> <span class="glyphicon glyphicon-pencil"></span> </a></span> </h3>
                   <jsp:expression>title</jsp:expression> <br>
               Skills : <jsp:expression>skill</jsp:expression> <br>
               Gender : <jsp:expression>gender</jsp:expression> <br>
                Field : <jsp:expression>field</jsp:expression> <br>
                 City : <jsp:expression>city</jsp:expression>
                </div>
             </div><br>
                
                <div class="row" style="border: 1px solid gray; box-shadow: 0px 0px 2px gray">
                    
                    <div class="col-md-12">
                        <h4> Education Details <a href="add-profile-education.jsp" style="font-size: 12px; float: right"> <span class="glyphicon glyphicon-plus"></span> </a> </h4>
                    <%--line of code is use for display education on profile page  --%>                     
                    <jsp:scriptlet>
                     String school="", degree="", grade="", year="", id="";
                     String email=(String)session.getAttribute("s_email");
                    try
                    {
             
                       Connection con=DbConnection.getConnect();
                       
                       PreparedStatement ps=con.prepareStatement("select * from education where email=?");
                       ps.setString(1,email);
                       ResultSet rs=ps.executeQuery();
                                while(rs.next())
                                {
                                    id= rs.getString("id");
                                    school=rs.getString("school");
                                    degree=rs.getString("degree");
                                    grade=rs.getString("grade");
                                    year=rs.getString("year");
                        </jsp:scriptlet>
                            
                            <div class="row" style="background-color: #eeecec">
                                <div class="col-md-2"> &nbsp;&nbsp;&nbsp; <img src="images/education-icon.jpg" height="70" /> </div>
                                <div class="col-md-10">
                                    <a href="edit-education-details.jsp?id=<jsp:expression>id</jsp:expression>" style="font-size: 12px; float: right"> <span class="glyphicon glyphicon-pencil"></span> </a>
                                    <b> <span class="glyphicon glyphicon-home">&nbsp;</span> <jsp:expression>school</jsp:expression> <br> </b>
                                <span class="glyphicon glyphicon-book"></span> &nbsp; <jsp:expression> degree </jsp:expression> <span style="color: #858585">(<jsp:expression> year </jsp:expression>)</span> <br>
                                <span class="glyphicon glyphicon-file"></span> &nbsp; <jsp:expression> grade </jsp:expression>% <br>
                                
                                </div>
                        </div> <br>
                    <jsp:scriptlet>
                        }
                    }      
                   
                    catch(Exception e)
                    {
                        out.print(e);
                    }
                    </jsp:scriptlet>
                        
                    </div>
                    
                 </div><br><br>
                 <!-- Display experience on profile page -->
                 
                 <div class="row"  style="border: 1px solid gray; box-shadow: 0px 0px 2px gray; border-radius: 3px">
                        
                        <div class="col-md-12">
                            <h4> Experience Details <a href="add-profile-experience.jsp" style="font-size: 12px; float: right"> <span class="glyphicon glyphicon-plus"></span> </a> </h4>
                        <jsp:scriptlet>
                            String company1="", location1="", jobtitle1="", year1="", id1="";
                            try
                            {   
                                Connection con = DbConnection.getConnect();
                                PreparedStatement ps=con.prepareStatement("select * from experience where email=?");
                                ps.setString(1, email);
                                ResultSet rs=ps.executeQuery();
                                while(rs.next())
                                {
                                    id1=rs.getString("id");
                                    company1=rs.getString("company");
                                    location1=rs.getString("location");
                                    jobtitle1=rs.getString("job_title");
                                    year1=rs.getString("year");
                        </jsp:scriptlet>
                            
                            <div class="row" style="background-color: #eeecec">
                                <div class="col-md-2"> &nbsp;&nbsp;&nbsp; <img src="images/experience.png" height="70" /> </div>
                                <div class="col-md-10">
                                    <a href="edit-experience-details.jsp?id=<jsp:expression>id1</jsp:expression>" style="font-size: 12px; float: right"> <span class="glyphicon glyphicon-pencil"></span> </a>
                                    <b> <span class="glyphicon glyphicon-home">&nbsp;</span> <jsp:expression>company1</jsp:expression> <br> </b>
                                <span class="glyphicon glyphicon-book"></span> &nbsp; <jsp:expression>location1</jsp:expression> <span style="color: #858585">(<jsp:expression> year1 </jsp:expression>)</span> <br>
                                <span class="glyphicon glyphicon-file"></span> &nbsp; <jsp:expression>jobtitle1</jsp:expression> <br>
                                </div>
                        </div> <br>
                            
                        <jsp:scriptlet>
                                }
                            }
                            catch(Exception e)
                            {
                                out.print(e);
                            }
                        </jsp:scriptlet>
                        </div>
                    </div> <br> <br>
                    
                    <div class="row"  style="border: 1px solid gray; box-shadow: 0px 0px 2px gray; border-radius: 3px">
                     <div class="col-md-12">
                            <h4> Resume Details <a href="add-profile-experience.jsp" style="font-size: 12px; float: right"> <span class="glyphicon glyphicon-plus"></span> </a> </h4>
                            
                             <div class="row" style="background:#f0f0f0">
                            <div class="col-md-12">
                                <a href="upload-resume.jsp">Upload Resume <span class="glyphicon glyphicon-pencil"></span></a>
                                <jsp:scriptlet>
                                 
                                 String file_name= null;
                                 try
                                 {
                                   Connection con = DbConnection.getConnect();
                                   PreparedStatement ps= con.prepareStatement("select*from resume where email=?");
                                   ps.setString(1, email);
                                   ResultSet rs= ps.executeQuery();
                                   if (rs.next())
                                   {
                                   file_name= rs.getString("path");
                                 </jsp:scriptlet>
                                &nbsp;&nbsp;&nbsp;&nbsp;<a herf="DownloadResume?fn=<jsp:expression> file_name</jsp:expression>" class="btn btn-success">Download</a>
                                <jsp:scriptlet>
                                   }
                                 }
                                 catch (Exception e) 
                                 {
                                    e.printStackTrace();
                                 }
   
                                </jsp:scriptlet>     
                                
                                
                            </div> <br><br>    
                        </div>
                        <div class="row" style="background:#f0f0f0">
                            <div class="col-md-12">
                                <a href="">Resume Builder </a>
                            </div>   
                        </div>
                     </div>   
                    </div>    
                <div class="row">
                    <div class="col-md-2"></div>
                    <div class="col-md-8">
                        <input type="submit" value="Follow" />
                    </div>
                    <div class="col-md-2"></div>
                   
                </div>
              
             
         </div>
         <div class="col-md-2"> </div>
         
     </div>
             
      <jsp:include page="footer.jsp" />
</body> 
</html>