<%-- 
    Document   : upload-resume
    Created on : 02-Sept-2024, 9:52:56 am
    Author     : pawan kumar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:scriptlet>
    String name = (String) session.getAttribute("session_name");
    
</jsp:scriptlet>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
                 <img src="" height="150" />
             </div>
                <div class ="col-md-9">
                    <form action="UpdateResume" method="POST" enctype="multipart/from-data">
                        <h2>Upload Resume</h2>
                        <b> <jsp:expression> session.getAttribute("s_email")</jsp:expression> </b> <br> <br>
                        <input type="file" name="uplodresume" />
                        <input type="submit" value="Update Resume" class="btn btn-danger" />
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
