<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Connection"%>
<%@page import="project.DBConnect"%>

<%@ include file="./sections/header.jsp" %>

<%

    if(session.getAttribute("userid")==null){
        response.sendRedirect("./login.jsp");    
    }

%>

<%

    Connection conn = DBConnect.getCon();
    Object userid = session.getAttribute("userid");
    String userquery = "Select * from travel.users where id=('"+userid+"') ";
    PreparedStatement st = conn.prepareStatement(userquery);
    ResultSet rs = st.executeQuery();

%>


<!DOCTYPE html>
<html>


    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Succesfully Registered</title>
        <link href="https://fonts.googleapis.com/css?family=ZCOOL+XiaoWei" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    </head>
    <body style="background: url('./assets/img/travelbg.png'); background-repeat: no-repeat; background-size: cover;" >
        <div class="container mt-5 pt-5 pb-5" style="background-color: #0f776205; border-bottom-left-radius: 30px; border-bottom-right-radius: 30px;">
            <h1 class="text-center">
                <img src="./assets/img/password.jpg" class="rounded-pill" style="width:150px;">
            </h1>
            <h1 class="h1 text-center mt-2">Password changed Successfully</h1>
            <p class="lead text-center">You will be automatically redirected in <span id="countdown"></span> seconds.....</p>
            <h6 class="h6 text-center">If still not redirected, <a href="./profile.jsp">Click Here</a></h6>
        </div>


        <script>
            var timeLeft = 3;
            var elem = document.getElementById('countdown');
            var timerId = setInterval(countdown, 1000);

            function countdown() {
                if (timeLeft < 0) {
                    clearTimeout(timerId);
                } else {
                    elem.innerHTML = timeLeft;
                    timeLeft--;
                }
            }
            setTimeout(function(){
                window.location.href = './profile.jsp';
            }, 3000);
        </script>


        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    </body>

</html>


<%

    String currpassword = request.getParameter("currpassword");
    String newpassword = request.getParameter("newpassword");
    String cnewpassword = request.getParameter("cnewpassword");

    if(rs.next()){
        String dbpassword = rs.getString("password");
        if(dbpassword.equals(currpassword)){
            if(!currpassword.equals(newpassword)){
                try {
                    Statement ust = conn.createStatement();
                    int updatequery = ust.executeUpdate("update travel.users set password=('"+newpassword+"') where id=('"+userid+"')");
                }
                catch (Exception e) {
                    out.print(e);
                }
            }
            else{
                out.println("<script>alertmsg('Your new password should not match with your current password')</script>");
            }            
        }
        else{
            out.println("<script>alertmsg('Your current password is incorrect');</script>");
            response.sendRedirect("./changePasswordFail.jsp");
        }
    }

%>



<script>

</script>