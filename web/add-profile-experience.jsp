<%-- 
    Document   : add-profile-experience
    Created on : 29-Aug-2024, 10:26:18 am
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
        <title>Add Experience Details</title>
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
                    <form action="AddExperienceDetails" method="POST">
                        <h2>Add Experience Details</h2>
                        <b><jsp:expression>name</jsp:expression> </b>(<jsp:expression> session.getAttribute("s_email")</jsp:expression>) <br> <br>
                        Company: <br> <input type="text"  name="company1" placeholder="Name of company" class="textfield_design" /> <br> <br>
                        Location: <br> <input type="text"  name="location1" placeholder="ex:-mumbai" class="textfield_design" /> <br> <br>
                        Year: <br> <input type="text"  name="year1" placeholder="Ex-2020-2024" class="textfield_design" /> <br><br>
                        Title: <br> <input type="text"  name="title1" placeholder="Ex-Juniar java developer" class="textfield_design" /><br><br>
                        Description: <br>
                        <textarea placeholder="description" name="description1" style="padding: 5px 10px; width: 300px; height: 100px; border-radius: 5px; border: 1px solid gray;"></textarea> <br> <br>
                        <input type="submit" value="Add Experience" class="btn btn-danger" />
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
