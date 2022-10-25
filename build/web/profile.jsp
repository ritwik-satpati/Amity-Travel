<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Connection"%>
<%@page import="project.DBConnect"%>

<%@ include file="./sections/header.jsp" %>

<script>
function changePasswordValidate(){
	var newpassword = document.getElementById("newpassword").value;
	var cnewpassword = document.getElementById("cnewpassword").value;

	var passExp = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[^a-zA-Z0-9])(?!.*\s).{8,20}$/;
 
	
	if (newpassword != cnewpassword){
		alert("Password and confirm password does not match")
		return false;
	}
	else{
		if (!newpassword.match(passExp)){
			alert("Please enter a password between 8 to 20 characters with at least one lowercase letter, one uppercase letter, one numeric digit, and one special character");
			return false;
		}
		else{
			document.getElementById("changePassword").action = "./changePassword.jsp";
			return true;
		}
	}	
}

</script>

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

        String bookingquery = "Select * from travel.booking where userid='"+userid+"'";
        PreparedStatement bookingpst = conn.prepareStatement(bookingquery);
        ResultSet bookrs = bookingpst.executeQuery(); 



%>



<body style="background: url('./assets/img/travelbg.png'); background-position: center; background-attachment: fixed; background-repeat: no-repeat; background-size: cover;" >

    <div class="profile-section mt-5 pt-1" style="min-height: 60vh; background-color: #0f776220; border-bottom-left-radius: 30px; border-bottom-right-radius: 30px;">

        <div class="d-flex align-items-start justify-content-center mt-5">
        
            <div class="nav flex-column nav-pills me-3" id="v-pills-tab" role="tablist" aria-orientation="vertical" style=" background-color: #0f776270; border-top-left-radius: 30px; border-bottom-left-radius: 30px;">
                <button class="nav-link active text-white" style="color:#fff !important; border-radius:40px !important;" id="v-pills-bookings-tab" data-bs-toggle="pill" data-bs-target="#v-pills-bookings"
                    type="button" role="tab" aria-controls="v-pills-bookings" aria-selected="false" id="mybookings">My Bookings</button>
                <button class="nav-link text-white" id="v-pills-account_details-tab" style="color:#fff !important; border-radius:40px !important;" data-bs-toggle="pill"
                    data-bs-target="#v-pills-account_details" type="button" role="tab"
                    aria-controls="v-pills-account_details" aria-selected="true" id="accountdetails">Account Details</button>
                <button class="nav-link text-white" id="v-pills-change_password-tab" style="color:#fff !important; border-radius:40px !important;" data-bs-toggle="pill"
                    data-bs-target="#v-pills-change_password" type="button" role="tab"
                    aria-controls="v-pills-change_password" aria-selected="false" id="changepasss">Change Password</button>
            </div>

            <div class="tab-content" id="v-pills-tabContent">


                <!-- Start : My Booking Tab -->
                <div class="tab-pane fade show active" style="width: 700px;" id="v-pills-bookings" role="tabpanel" aria-labelledby="v-pills-bookings-tab">
                    <%
                      //if(!bookrs.next()){

                        
                    %>
                        <!--        <div class="card mb-3 bg-light text-center" style="width: 700px;">
                                    <div class="card-body">
                                        <h1>No bookings Yet</h1>    
                                    </div>
                                </div>-->
                    <%
                            
                        //}
                    
                        
                        while(bookrs.next()){
                            String bookingType = bookrs.getString("bookingType");

                            String bookingId = bookrs.getString("bookingId");
                            
                            String username = bookrs.getString("username");
                            String useremail = bookrs.getString("email");
                            
                            String totalFare = bookrs.getString("totalFare");
                            
                            String bookingDate = bookrs.getString("bookingDate");


                            if(bookingType.equals("Flight")){
                                String sourceCity = bookrs.getString("sourceCity");
                                String destinationCity = bookrs.getString("destinationCity");
                                String departureDate = bookrs.getString("departureDate");
                                String noOfPassenger = bookrs.getString("noOfPassenger");
                            

                    %>
                    <!-- Start : Booking Cards -->
                    <!-- Flight -->
                    <div class="card mb-3 bg-light text-center" style="width: 700px;">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-4"></div>
                                <div class="col-4">
                                    <p class="card-subtitle text-muted">Booking Id: <span class="h6 fw-bold text-success"><%=bookingId %></span></p>
                                </div>
                                <div class="col-4">
                                    <p class="card-title text-muted">Travel Date: <span class="h6 fw-bold text-warning"><%=departureDate %></span></p>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-4">
                                    <p class="card-title"><span class="h5 fw-light text-uppercase me-2 text-success"><%=sourceCity %></span> <i class="fa-solid fa-plane-departure"></i> <span class="ms-2 h5 fw-light text-success text-uppercase"><%=destinationCity%></span></p>
                                </div>
                                <div class="col-4">
                                    <p class="card-title h6 fw-bold text-success"><%=noOfPassenger %> <span class="h6 fw-normal text-dark">Passenger/s<span></p>
                                </div>
                                <div class="col-4">
                                    <p class="card-text h5 fw-normal"><i class="fa-solid fa-indian-rupee-sign"></i> <span class="h5 fw-bold text-primary"><%=totalFare%></span> /-</p>
                                </div>
                            </div>
                            <div class="row mt-5">
                                <div class="col-12 text-end">
                                    <p class="card-subtitle small text-muted">Booked on: <span class="fw-bold text-success"><%=bookingDate %></span></p>
                                </div>
                            </div>
                         
                        </div>
                    </div>
                    
                    <%
                            }
                            if(bookingType.equals("Hotel")){
                                String hotelCity = bookrs.getString("hotelCity");
                                String checkIn = bookrs.getString("checkIn");
                                String noOfNights = bookrs.getString("noOfNights");
                                String noOfRooms = bookrs.getString("noOfRooms");
                                
                    %>
                    
                    <!-- Hotel -->
                    <div class="card mb-3 bg-light text-center" style="width: 700px;">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-4">
                                    <p class="card-subtitle text-muted">Booking Id: <span class="h6 fw-bold text-success"><%=bookingId %></span></p>
                                </div>
                                <div class="col-4">
                                    <p class="card-title text-muted">Check-In Date: <span class="h6 fw-bold text-warning"><%=checkIn %></span></p>
                                </div>
                                <div class="col-4">
                                    <p class="card-title text-muted">No. of nights: <span class="h6 fw-bold text-dark"><%=noOfNights %></span></p>                                
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-4">
                                    <p class="card-title"> <i class="fa-solid fa-hotel"></i> <span class="ms-2 h5 fw-light text-success text-uppercase"><%=hotelCity%></span></p>
                                </div>
                                <div class="col-4">
                                    <p class="card-title h6 text-success"><%=noOfRooms %> <span class="fw-normal text-dark"> Room/s<span> </p>
                                </div>
                                <div class="col-4">
                                    <p class="card-text h5 fw-normal "><i class="fa-solid fa-indian-rupee-sign"></i> <span class="h5 fw-bold text-primary"><%=totalFare%></span> /-</p>
                                </div>
                            </div>
                            <div class="row mt-5">
                                <div class="col-12 text-end">
                                    <p class="card-subtitle small text-success">Booked on: <span class="fw-bold"><%=bookingDate %></span></p>
                                </div>
                            </div>
                            <!-- <a href="#" class="card-link">Card link</a>
                            <a href="#" class="card-link">Another link</a> -->
                        </div>
                    </div>
                    <%
                            }   
                        }
                    %>
                </div>    
                <!-- End : Booking Cards -->
                
                <!-- End : My Booking Tab -->
                

                
                
                <!-- Start : Account Details Tab -->
                <%

                    if(rs.next()){
                        String dbname = rs.getString("name");
                        String dbemail = rs.getString("email");
                        String dbphone = rs.getString("phone");
                        String dbpassword = rs.getString("password");

                %>
                
                <div class="tab-pane fade" id="v-pills-account_details" role="tabpanel"
                    aria-labelledby="v-pills-account_details-tab">
                    <!-- Start : Account Details using Table -->
                    <div class="card text-dark rounded-3 mb-3 p-5" style="background:#1cd4af; width: 700px;">
                    <p class="text-center card-title fs-4 fw-light">Personal <span class="fs-4 fw-bold text-uppercase text-danger">Information</span></p>
                        <div class="text-center p-3">
                            <img src="./assets/img/user.png" class="rounded-circle" style="width: 150px;" alt="Avatar" />
                        </div>
                        <div class="col-md-12">
                            <table class="table table-borderless">
                                <tbody>
                                    <tr class="fs-5 fw-normal">
                                        <td scope="row">Name</td>
                                        <td class="fw-normal"><input type="text" class="form-control form-control-lg px-4 bg-white rounded-pill" value="<%=dbname%>" disabled></td>
                                    </tr>
                                    <tr class="fs-5 fw-normal">
                                        <td scope="row">Email</td>
                                        <td class="fw-normal"><input type="text" class="form-control form-control-lg px-4 bg-white rounded-pill" value="<%=dbemail%>" disabled></td>
                                    </tr>
                                    <tr class="fs-5 fw-normal">
                                        <td scope="row">Phone Number</td>
                                        <td class="fw-normal"><input type="text" class="form-control form-control-lg px-4 bg-white rounded-pill" value="+91 <%=dbphone%>" disabled></td>
                                    </tr>
                                    <tr class="fs-5 fw-normal">
                                        <td scope="row">Password</td>
                                        <td class="fw-normal"><input type="text" class="form-control form-control-lg px-4 bg-white rounded-pill" value="<%=dbpassword%>" disabled></td>
                                    </tr>
                                    <tr class="fs-5 fw-normal">
                                        <td scope="row">Account Type</td>
                                        <td class="fw-normal"><input type="text" class="form-control form-control-lg px-4 bg-white rounded-pill" value="Active" disabled></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>

                    <!-- End : Account Details using Table -->
                </div>
                <%
                
                    }
                
                %>
                <!-- End : Account Details Tab -->

                <!-- Start : Change Password Tab -->
                <div class="tab-pane fade rounded-3" style="background:#1cd4af;" id="v-pills-change_password" role="tabpanel"
                    aria-labelledby="v-pills-change_password-tab" style="width=700px;">
                    <!-- Start : Change Password Form -->
                    <form action="" id="changePassword" onsubmit="return changePasswordValidate()" method="post" style="width=700px;">
                        <div class="mb-4" style="width: 700px;">
                            <label for="inputOldPassword" class="form-label text-dark">Current Password</label>
                            <input type="password" class="form-control" name="currpassword" id="currpassword" placeholder="Enter your current password">
                            
                        </div>
                        <div class="mb-4" style="width: 700px;">
                            <label for="inputNewPassword" class="form-label text-dark">New Password</label>
                            <input type="password" name="newpassword" id="newpassword" class="form-control"
                                aria-describedby="passwordHelpBlock" placeholder="Enter new password">
                            <div id="passwordHelpBlock" class="form-text text-secondary">
                                Your password must be 8-20 characters long, contain letters, numbers and special characters and must not contain spaces, emoji.
                            </div>
                        </div>
                        <div class="mb-4" style="width: 700px;">
                            <label for="inputConfirmPassword" class="form-label text-dark">Confirm New Password</label>
                            <input type="password" class="form-control" name="cnewpassword" id="cnewpassword" placeholder="Re-enter your new password">
                        </div>
                        <div class="text-end">
                            <button type="submit" class="btn btn-warning">Submit</button>
                        </div>
                    </form>
                    <!-- End : Change Password Form -->
                </div>
                <!-- End : Change Password Tab -->
            </div>
        </div>
    
    </div>


<%@ include file="./sections/footer.jsp" %>