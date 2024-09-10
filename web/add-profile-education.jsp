<%-- 
    Document   : edit-profile-education
    Created on : 25-Aug-2024, 3:18:47 pm
    Author     : pawan kumar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:scriptlet>
        String name = (String)session.getAttribute("s_name");
        
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
        <title>Add eduction</title>
          <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
		<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" ></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" type="text/css" href="css/style.css" />
    
    </head>
    <body>
         <jsp:include page="profileheader.jsp" />
     <jsp:include page="menubar.jsp" />
     
     <div class="row">
         <div class="col-md-2"> </div>
         <div class="col-md-8">
             <div class="row" style="border: 1px solid gray; box-shadow: 0px 0px 2px gray">
             <div class="col-md-2">
                 <img src="images/profilePhoto.jpg" height="100" />
             </div>
                <div class ="col-md-10">
                    <form action="addprofileducation" method="POST">
                        <h2>Add Education Details</h2>
                        <b><jsp:expression>name</jsp:expression> </b>(<jsp:expression> session.getAttribute("s_email")</jsp:expression>) <br> <br>
                        School/Collage/University: <br> <input type="text"  name="school1" class="textfield_design" /> <br> <br>
                        Degree: <br> <input type="text"  name="degree1" class="textfield_design" /> <br> <br>
                        Year: <br> <input type="text"  name="year1" class="textfield_design" /> <br><br>
                        Grade: <br> <input type="text"  name="grade1" class="textfield_design" /><br><br>
                        Description: <br>
                        <textarea placeholder="description" name="description1" style="padding: 5px 10px; width: 300px; height: 100px; border-radius: 5px; border: 1px solid gray;"></textarea> <br> <br>
                        <input type="submit" value="Add Education" class="btn btn-danger" />
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
