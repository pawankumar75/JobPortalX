<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:scriptlet>
    String email = (String) session.getAttribute("s_email");
</jsp:scriptlet>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="row menubardiv">
              <div class ="col-md-7" id= "mynavbar">
                 <ul>
                    <li> <a href="index.jsp">Home</a></li>
                     <jsp:scriptlet>
                        if (email == null ? email == null : email.trim().equals("null")) {
                    </jsp:scriptlet>
                    
                    <jsp:scriptlet>
                    } else {
                    </jsp:scriptlet>
                    <li> <a href="my-applied-jobs.jsp"> My Applied Jobs </a> </li>
                    <jsp:scriptlet>
                        }
                    </jsp:scriptlet>
                 <li> <a href="simple-job-search.jsp"> search Jobs</a> </li>
                  <li> <a href="Companies.jsp"> Companies </a></li>
              
                 </ul>
          </div>
          <div class="col-md-5" id= "mynavbar">
            <ul>
                 <li> <a href="about-us.jsp"> About Us </a> </li>
                       <li> <a href="contact-us.jsp"> Contact US</a></li>
                   
            </ul>
          </div>
       </div>
</body>
</html>