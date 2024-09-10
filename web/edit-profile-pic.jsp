  <%-- 
    Document   : edit-profile-pic
    Created on : 01-Sept-2024, 12:10:05 am
    Author     : pawan kumar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:scriptlet>
    String name = (String) session.getAttribute("session_name");
    String profile_pic = (String)session.getAttribute("s_profilepic");
</jsp:scriptlet>

<%--<jsp:scriptlet>
    if (name == null || name.equals("")) {
        response.sendRedirect("login.jsp");
    }
</jsp:scriptlet>--%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Profile Pic</title>
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
             <div class="col-md-3">
                 <img src="profilepic/<jsp:expression>profile_pic</jsp:expression>" height="150" style="border-radius:75px"/>
             </div>
                <div class ="col-md-9">
                    <form action="UpdateProfilePic" method="POST" enctype="multipart/form-data">
                        <h2>Upload Profile Pic</h2>
                        <b> <jsp:expression> session.getAttribute("s_email")</jsp:expression> </b> <br> <br>
                        <input type="file" name="uploadprofilepic" />
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
