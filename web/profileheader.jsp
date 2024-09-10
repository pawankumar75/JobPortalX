<%-- 
    Document   : profileheader
    Created on : 17-Aug-2024, 10:50:58 pm
    Author     : pawan kumar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:scriptlet>
        String name = (String)session.getAttribute("s_name");
        String profile_pic = (String)session.getAttribute("s_profilepic");
        
</jsp:scriptlet>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>welcome: <jsp:expression> name </jsp:expression></title>
    </head>
    <body>
        <div class=" row header_bg">
            <div class="col-md-9">
             <img src = "images/downloadlogo.jpeg" height="40"/>
              <span class ="Logo_text_design"> Job Portal</span>
            </div>
             <div class="col-md-3">
                 <img src="profilepic/<jsp:expression>profile_pic</jsp:expression>" height="30" style="border-radius:100%" /><a href="profile.jsp">  <jsp:expression> name </jsp:expression> </a> <span style="color:white"> / </span> <a href="Logout" class="hyperlinks_design"> Logout </a>
             </div>
          </div>
    </body>
</html>
