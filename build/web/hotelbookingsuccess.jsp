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
    String bookingType = "Hotel";
    Random rand = new Random();
    int bookingId = rand.nextInt(90000000) + 10000000;
    Object sessionuserid = session.getAttribute("userid");
    String city = request.getParameter("city");
    String checkInDate = request.getParameter("checkInDate");
    int noOfRooms = Integer.parseInt(request.getParameter("noofrooms"));
    int noOfNights = Integer.parseInt(request.getParameter("noofnights"));
    int totalFare = FareCalculation.hotelFareCalculation(city, noOfRooms, noOfNights);
    
%>


<!DOCTYPE html>
<html>


    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Succesfully Registered</title>
        <link href="https://fonts.googleapis.com/css?family=ZCOOL+XiaoWei" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    </head>
    <body style="background: url('./assets/img/hotelbg.png'); background-repeat: no-repeat; background-size: cover;">
        <div class="container mt-5 pt-4">
            <div class="text-center">
                <img src="./assets/img/check.jpg" class="rounded-circle" style="width:150px;">
            </div>
            <h1 class="h1 text-center mt-1"><%=bookingType%> booked successfully</h1>
            <div class="card my-5 text-center">
                <div class="card-body">
                    <h3 class="card-subtitle mb-5 text-muted">Booking Id: <%=bookingId %></h3>
                    <div class="row">
                        <div class="col-2">
                            <h5 class="card-title"><i class="fa-solid fa-door-open"></i> <%=noOfRooms %> Room/s</h5>
                        </div>
                        <div class="col-3">
                            <h3 class="card-title">Check-In: <%=checkInDate %></h3>
                            <h6 class="card-title"><i class="fa-solid fa-moon"></i> <%=noOfNights %> Night/s</h6>
                        </div>
                        <div class="col-4">
                            <h4 class="card-title"> <i class="fa-solid fa-hotel"></i> <%=city%></h4>
                        </div>
                        <div class="col-3">
                            <h5 class="card-text"><i class="fa-solid fa-indian-rupee-sign"></i> <%=totalFare%></h5>
                            <h6 class="card-text text-muted">(<i class="fa-solid fa-indian-rupee-sign"></i> <%=totalFare%>/person)</h6>
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
            int insertquery = st.executeUpdate("insert into travel.booking(bookingId, userid, username, email, bookingType, hotelCity, checkIn, noOfNights, noOfRooms, totalFare) values('"+bookingId+"','"+sessionuserid+"','"+username+"','"+useremail+"','"+bookingType+"','"+city+"','"+checkInDate+"','"+noOfNights+"','"+noOfRooms+"','"+totalFare+"')");
            bookingId = rand.nextInt(90000000) + 10000000;
        }
    } 
    catch (Exception e) {
        out.print(e);
    }
  
%>
