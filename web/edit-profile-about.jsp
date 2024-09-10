<%-- 
    Document   : edit-profile-about
    Created on : 22-Aug-2024, 1:38:33 pm
    Author     : pawan kumar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:scriptlet>
        String name = (String)session.getAttribute("s_name");
        String gender = (String)session.getAttribute("s_gender");
        String field = (String)session.getAttribute("s_field");
        String city = (String)session.getAttribute("s_city");
        String title = (String)session.getAttribute("s_title");
        if(title==null || title.equals(""))
        {
           title="";
        }
        
        String skills = (String)session.getAttribute("s_skill");
        if(skills==null || skills.equals(""))
        {
           skills="";
        }
        
        String id =request.getParameter("id");
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
        <title>JSP Page</title>
        
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
                    <form action="EditProfileAbout" method="POST">
                        <<h2>Add Personal Details</h2>
                        <b> <jsp:expression> session.getAttribute("s_email")</jsp:expression> </b> <br> <br>
                        Name:<br><input type="text" value="<jsp:expression> name </jsp:expression>" name="name1" class="textfield_design" placeholder="Enter Name" /> <br> <br>
                        Gender:<br><input type="text" value="<jsp:expression> gender </jsp:expression>" name="gender1" class="textfield_design" placeholder="Eneter Gender" /> <br> <br>
                        city:<br><input type="text" value="<jsp:expression> city </jsp:expression>" name="city1" class="textfield_design" placeholder="Enter City" /> <br><br>
                        Field:<br><input type="text" value="<jsp:expression> field </jsp:expression>" name="field1" class="textfield_design" placeholder="Enter Filed" /><br><br>
                        Title:<br><input type="text" value="<jsp:expression> title </jsp:expression>" name="title1" class="textfield_design" placeholder="Enter title" /><br><br>
                        Skill:<br><textarea placeholder="skills" name="skills1" style="padding: 5px 10px; width: 300px; height: 100px; border-radius: 5px; border: 1px solid gray;"><jsp:expression> skills </jsp:expression></textarea> <br> <br>
                        <input type="submit" value="Update" class="btn btn-danger" />
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
