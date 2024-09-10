<%-- 
    Document   : edit-details
    Created on : 22-Aug-2024, 12:56:24 am
    Author     : pawan kumar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:scriptlet>
        String name = (String)session.getAttribute("s_name");
        String gender = (String)session.getAttribute("s_gender");
        String field = (String)session.getAttribute("s_field");
        String city = (String)session.getAttribute("s_city");
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> job portal</title>
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
                <div class="row">
                    <div class="col-md-2">
                        <img src="images/profilePhoto.jpg" height="100"/>
                    </div>
                    <div class="col-md-10">
                        <h3 style="color: blue"> <jsp:expression> name.toUpperCase()</jsp:expression> </h3>
                        <table>
                            <tr>
                                <td> <span style="color: #acaaaa"> Gender : </span> </td>
                                <td> <input type="text" value="<jsp:expression> gender</jsp:expression>" class="textfield_design" placeholder="Enter Gender" /> <br> <br> </td>
                            </tr>
                            <tr>
                                <td> <span style="color: #acaaaa"> City : </span> </td>
                                <td> <input type="text" value="<jsp:expression> city</jsp:expression>" class="textfield_design" placeholder="Enter your city"/> <br> <br> </td>
                            </tr>
                            <tr>
                                <td> <span style="color: #acaaaa"> Fields : </span> </td>
                                <td> <input type="text" value="<jsp:expression> field</jsp:expression>" class="textfield_design" placeholder="Enter your Filelds" /> <br> <br> </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td> <input type="submit" value="Update" class="btn btn-danger" /> </td>
                            </tr>
                        </table>
                         
                        </div>
                    </div>
                        <div class="row">
                            <div class="col-md-2"> </div>
                            <div class="col-md-10">
                                <h5> Education Details </h5>
                                <table>
                                    <tr>
                                        <td> School : </td>
                                        <td> <input type="text" value="" class="textfield_design" /> <br> <br> </td>
                                    </tr>
                                    <tr>
                                        <td> Year : </td>
                                        <td> <input type="text" value="" class="textfield_design" /> <br> <br> </td>
                                    </tr>
                                    <tr>
                                        <td> College : </td>
                                        <td> <input type="text" value="" class="textfield_design" /> <br> <br> </td>
                                    </tr>
                                    <tr>
                                        <td> Passing Year : </td>
                                        <td> <input type="text" value="" class="textfield_design" /> <br> <br> </td>
                                    </tr>
                                    <tr>
                                        <td> Experience : </td>
                                        <td> <input type="text" value="" class="textfield_design" /> <br> <br> </td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td> <input type="submit" value="Update" class="btn btn-danger" /> </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                </div>
                <div class="col-md-2"> </div>
            </div>

      <jsp:include page="footer.jsp" />
    </body>
</html>
