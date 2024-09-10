<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>register</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" ></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" type="text/css" href="css/style.css" />
    
    
    <%--validation using java Script of registration page --%>
    <script>
        function validation()
        {
            var name2 = document.regform.name1.value;
            var email2 = document.regform.email1.value;
            var pass2 = document.regform.pass1.value;
            var gender2 = document.regform.gender1.value;
//            var field2 = document.regform.field1.value;
            var city2 = document.regform.city1.value;
            
            var name_pattern=/^[a-zA-Z]{3,30}$/;
            var email_pattern = /^([a-zA-Z0-9])(([a-zA-Z0-9])*([\._\+-])*([a-zA-Z0-9]))*@(([a-zA-Z0-9\-])+(\.))+([a-zA-Z]{2,4})+$/;
            var password_pattern = /^(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{6,16}$/;
            
            
            if(name2===""){
                alert("Name can not be empty");
                return false;
            }
             else if(email2===""){
                alert("email can not empty");
                return false;
            }
            else if(pass2===""){
                alert("password can not be empty");
                return false;
            }
            else if(gender2===""){
                alert("select your gender");
                return false;
            }
         /*  else if(field2===""){
                alert("select minmum one field");
                return false;
            } */
            else if(city2==="Select City"){
                alert("select your city");
                return false;
            }
            else{
                document.regform.action="regi";
                document.regform.submit();
            }
        }
    </script>
    
</head>
<body>
   <div class="container-fluid">
    <jsp:include page="header.jsp"></jsp:include>
     <jsp:include page="menubar.jsp"></jsp:include>
       
       <div class="row">
          <div class="col-md-3"></div>
          
          <div class="col-md-6">
                        <div class="reg_div_design">
                            <form method="POST" name="regform" onsubmit="return validation()" action="regi">
                                <br> <h2> Register Here </h2> <br>
                                <input type="text" placeholder="Enter Name" name="name1" class="reglog_tf_design" /> <br> <br>
                                <input type="text" placeholder="Enter Email" name="email1" class="reglog_tf_design" /> <br> <br>
                                <input type="password" placeholder="Enter Password" name="pass1" class="reglog_tf_design" /> <br> <br>
                                <b> Select Gender : </b> <input type="radio" name="gender1" value="Male" /> Male <input type="radio" name="gender1" value="Female" /> Female <br> <br>
                                <b> Select Fields : </b> <input type="checkbox" name="field1" value="Information Technology" /> Information Technology <br>
                                <input type="checkbox" name="field1" value="Marketing" /> Marketing
                                <input type="checkbox" name="field1" value="Finance" /> Finance <br> <br>
                                <select name="city1" class="reglog_tf_design">
                                    <option> Select City </option>
                                    <option value="Delhi"> Delhi </option>
                                    <option value="noida"> noida </option>
                                    <option value="Gurugram"> Gurugram </option>
                                </select> <br> <br>
                                <input type="submit" value="Register" class="btn btn-primary" /> <br> <br>
                            </form>
                        </div>
                    </div>
          
          <div class="col-md-3"></div>
       </div>
     
      <jsp:include page="footer.jsp"></jsp:include>
   </div>

</body>
</html>