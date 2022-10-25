<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Connection"%>
<%@page import="project.DBConnect"%>

<%@ include file="./sections/header.jsp" %>

<%
    if(session.getAttribute("registered")=="success"){
%>
    <script>
        alertmsg("Account created succesfully!! You can login to your account now");
    </script>
<%
        session.setAttribute("registered", "null");
    }
  
    
    if(session.getAttribute("flightLogin")=="false"){
%>
    <script>
        alertmsg("Please login to your account before booking a flight");
    </script>
<%
        session.setAttribute("flightLogin","true");
    }


    if(session.getAttribute("hotelLogin")=="false"){
%>
    <script>
        alertmsg("Please login to your account before booking a hotel");
    </script>
<%
        session.setAttribute("hotelLogin","true");
    }

    
    if(session.getAttribute("userid")!=null){
        response.sendRedirect("./home.jsp");    
    }
%>


        <div class="contact-us" id="contact-us">
            <span class="big-circle"></span>
            <div class="form">
                <div class="contact-info">
                    <h3 class="title">Amity Travels</h3>
                    <p class="text">
                        Sign in to your account to book a holiday.
                    </p>

                    <div class="info">
                        <div class="information">
                            <div class="address">
                                <p>Are you new here? <a class="link-success fw-bold" href="./signup.jsp">Register yourself</a></p>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="contact-form">
                    <span class="circle one"></span>
                    <span class="circle two"></span>

                    <form action="" id="loginForm" method="post">
                        <h3 class="title">Sign In</h3>
                        <h5 class="lead mb-4 text-white" style="font-size:16px">Enter your credentials</h5>

                        <div class="input-contact-us mb-4">
                            <input type="text" id="email" name="email" class="input" placeholder="Enter your email"/>
                        </div>
                        <div class="input-contact-us mb-4">
                            <input type="password" name="password" class="input" placeholder="Enter Password" />
                        </div>
                        <div class="text-end mt-4">
                            <input type="submit" value="Sign me in" class="bnt" />
                        </div>
                    </form>


<%

    try {
        Connection conn = DBConnect.getCon();
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String query = "Select * from travel.users";
        PreparedStatement st = conn.prepareStatement(query);
        ResultSet rs = st.executeQuery();
        String loginStatus = "true"; 
        
        if(email != null){
            while(rs.next()){
                String dbUserEmail = rs.getString("email");
                String dbUserPass = rs.getString("password");
                if(email.equals(dbUserEmail) && password.equals(dbUserPass)){
                    String dbId = rs.getString("id");
                    String dbName = rs.getString("name");
                    session.setAttribute("userid",dbId);
                    session.setAttribute("username",dbName); 
                    session.setAttribute("alertmsg","ok");
                    response.sendRedirect("./home.jsp");
                }
                else{
                    loginStatus = "false";
                }
            }                
        }
        if(loginStatus=="false"){
            out.println("<div class='alert alert-danger alert-dismissible fade show' role='alert'><strong>Oops!</strong> Your credentials do not match.<button type='button' class='btn-close' data-bs-dismiss='alert' aria-label='Close'></button></div>");
        }
    } 
        catch (Exception e) {
            out.print(e);
        }

%>
                </div>
            </div>
        </div>
        




<%@ include file="./sections/footer.jsp" %>


