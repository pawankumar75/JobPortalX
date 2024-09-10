<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.pawan.connection.DbConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<jsp:scriptlet>
   String email = (String)session.getAttribute("s_email");
  
   
</jsp:scriptlet>
<html>
<head>
<meta charset="UTF-8">
<title>Job Portal website</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
		<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" ></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" type="text/css" href="css/style.css" />
</head>
<body>
     <div class="container-fluid">
         
         <jsp:scriptlet>
             if (email==null ? email == null :email.trim().equals("null")) 
             {
         </jsp:scriptlet>
                  <jsp:include page="header.jsp"></jsp:include>
         <jsp:scriptlet>
              }else{
         </jsp:scriptlet>
                  <jsp:include page="profileheader.jsp"></jsp:include>
         <jsp:scriptlet>
            }
         </jsp:scriptlet>
    
     <jsp:include page="menubar.jsp"></jsp:include>
     
     <div class="row" style="border: 2px solid black;">
				<img src="images/jobbanner.jpg" class="img-fluid" alt="Job Banner"/>
			</div>
			<!-- ==============search job div starts================= -->
			<div class="row">
				<div class="col-md-2"></div>
				<div class="col-md-8 job_search_div">
					<h3> Find A Job at India's No.1 Job Site </h3>
                                        <form action="search-jobs-result.jsp" method="POST">
                                            <input type="text" name="technolgy1" placeholder="Technology..." class="textfield_design" />
                                            <input type="text" name="location1" placeholder="Location..." class="textfield_design" />
					   <input type="submit" value="Search" class="btn btn-primary" />
                                        </form>
		
				</div>
								<div class="col-md-2"></div>
			</div>
			<!-- ==============search job div ends================= -->
			
			<div class="row">
				<div class="col-md-3">
					<ul>
						<li> <a href=""> Microsoft </a> </li>
						<li> <a href=""> Infosys </a> </li>
						<li> <a href=""> Wipro </a> </li>
						<li> <a href=""> IBM </a> </li>
						<li> <a href=""> Google </a> </li>
					</ul>
				</div>
				<div class="col-md-6" style="background-color: #fafcfa; margin-top:10px " >
					<div class="row">
                                        <jsp:scriptlet>
                                            String id,jop_profile,company,experience,description,date1,time1;
                                            try
                                           
                                             {
                                               Connection con= DbConnection.getConnect();
                                               PreparedStatement ps=con.prepareStatement("select*from jobs");
                                               ResultSet rs=ps.executeQuery();
                                               while (rs.next())
                                               {
                                               id = rs.getString("id");
                                               jop_profile = rs.getString("job_profile");
                                               company = rs.getString("company");
                                               experience = rs.getString("experience");
                                               description = rs.getString("description");
//                                               job_location = rs.getString(" job_location");
                                               date1 = rs.getString("date1");
                                               time1 = rs.getString("time1");
                                               </jsp:scriptlet>
                                                <div class="col-md-12 display_job_div">
                                                    <b><jsp:expression> jop_profile </jsp:expression></b> <br>
                                                <span><b> Company :</b> <jsp:expression> company </jsp:expression> </span> <br>
							<span> <b>Experiene:</b> <jsp:expression> experience </jsp:expression> </span> <br>
                                                        <span> <b> Description:</b> <jsp:expression> description </jsp:expression> </span> <br>
                                                        
							<a href="job-description.jsp?jid=<jsp:expression>id</jsp:expression>"> See Full Details </a>
						</div>
                                            
                                               <jsp:scriptlet>
                                        
                                               }
                                              } 
                                             catch (Exception e)
                                             {
                                              e.printStackTrace();
                                              
                                             }
                                            
                                         </jsp:scriptlet>
						
					</div>
				</div>
				<div class="col-md-3">
					<ul>
						<li> <a href=""> Microsoft </a> </li>
						<li> <a href=""> Infosys </a> </li>
						<li> <a href=""> Wipro </a> </li>
						<li> <a href=""> IBM </a> </li>
						<li> <a href=""> Google </a> </li>
					</ul>
				</div>
			</div>
			</div>
    
     <jsp:include page="footer.jsp"></jsp:include>
  </body>
</html>