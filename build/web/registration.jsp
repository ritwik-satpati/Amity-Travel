<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Connection"%>
<%@page import="project.DBConnect"%>

<%@ include file="./sections/header.jsp" %>
<!DOCTYPE html>
<html>


    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Succesfully Registered</title>
        <link href="https://fonts.googleapis.com/css?family=ZCOOL+XiaoWei" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    </head>
    <body style="background: url('./assets/img/travelbg.png'); background-repeat: no-repeat; background-size: cover;" >
        <div class="container mt-5 pt-5">
            <div class="text-center">
                <img src="./assets/img/check.jpg" class="rounded-circle" style="width:100px;">
            </div>
            <h1 class="h1 text-center mt-1">You have Succesfully Registered</h1>
            <p class="lead text-center">You will be automatically redirected in <span id="countdown"></span> seconds.....</p>
            <h6 class="h6 text-center">If still not redirected, <a href="./home.jsp">Click Here</a></h6>
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
                window.location.href = './login.jsp';
                <% session.setAttribute("registered", "success"); %>
            }, 3000);
        </script>


        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    </body>

</html>


<%
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String phone = request.getParameter("phone");
    String password = request.getParameter("password");
    String cpassword = request.getParameter("cpassword");

    PreparedStatement prepare;

    try {
        Connection conn = DBConnect.getCon();
        Statement st = conn.createStatement();
        int query = st.executeUpdate("insert into travel.users(name, email, phone, password) values('"+name+"','"+email+"','"+phone+"','"+password+"')");
    } catch (Exception e) {
        out.print(e);
    }

%>

