<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Connection"%>
<%@page import="project.DBConnect"%>
<%@page import="project.FareCalculation"%>

<%@ include file="./sections/header.jsp" %>

<%
    String bookingType = "Flight";
    Random rand = new Random();
    int bookingId = rand.nextInt(90000000) + 10000000;
    Object sessionuserid = session.getAttribute("userid");
    String sourceCity = request.getParameter("sourcecity");
    String destinationCity = request.getParameter("destinationcity");
    String depdate = request.getParameter("departuredate");
    int pax = Integer.parseInt(request.getParameter("noofpassengers"));
    int totalFare = FareCalculation.flightFareCalculation(sourceCity, destinationCity, pax);
    
%>


<!DOCTYPE html>
<html>


    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Succesfully Registered</title>
        <link href="https://fonts.googleapis.com/css?family=ZCOOL+XiaoWei" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    </head>
    <body style="background: url('./assets/img/flightbg.png'); background-repeat: no-repeat; background-size: cover;">
        <div class="container mt-5 pt-3">
            <div class="text-center">
                <img src="./assets/img/check.jpg" class="rounded-circle" style="width:150px;">
            </div>
            <h1 class="h1 text-center mt-1"><%=bookingType%> booking is successful</h1>
            <div class="card my-5 text-center">
                <div class="card-body">
                    <h4 class="card-subtitle mb-2 text-muted">Booking Id: <%=bookingId %></h4>
                    <div class="row">
                        <div class="col-4">
                            <h4 class="card-title">Ticket Qty: <%=pax %></h4>
                        </div>
                        <div class="col-4">
                            <h2 class="card-title"><%=sourceCity %> <i class="fa-solid fa-plane-departure"></i> <%=destinationCity%></h2>
                        </div>
                        <div class="col-4">
                            <h4 class="card-text"><i class="fa-solid fa-indian-rupee-sign"></i> <%=totalFare%></h4>
                            <h6 class="card-text"><i class="fa-solid fa-indian-rupee-sign"></i> <%=totalFare/pax%>/person</h6>
                        </div>
                    </div>
                </div>
            </div>
                            
            <p class="lead text-center">You will be automatically redirected in <span id="countdown"></span> seconds.....</p>
            <h6 class="h6 text-center">If still not redirected, <a href="./profile.jsp#mybookings">Click Here</a></h6>
        </div>


        <script>
            var timeLeft = 5;
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
                window.location.href = './profile.jsp#mybookings';
            }, 5000);
        </script>


        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    </body>

</html>

<%
    

    try {
        
        Connection conn = DBConnect.getCon();
        String query = "Select * from travel.users where id='"+sessionuserid+"'";
        PreparedStatement pst = conn.prepareStatement(query);
        ResultSet rs = pst.executeQuery(); 
        if(rs.next()){
            String username = rs.getString("name");
            String useremail = rs.getString("email");
            Statement st = conn.createStatement();
            int insertquery = st.executeUpdate("insert into travel.booking(bookingId, userid, username, email, bookingType, sourceCity, destinationCity, departureDate, noOfPassenger, totalFare) values('"+bookingId+"','"+sessionuserid+"','"+username+"','"+useremail+"','"+bookingType+"','"+sourceCity+"','"+destinationCity+"','"+depdate+"','"+pax+"','"+totalFare+"')");
            bookingId = rand.nextInt(90000000) + 10000000;
        }
    } 
    catch (Exception e) {
        out.print(e);
    }
  
%>
