<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Connection"%>
<%@page import="project.DBConnect"%>

<%@ include file="./sections/header.jsp" %>

<%
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
                        Sign up to create an account and book your favourite holiday.
                    </p>

                    <div class="info">
                        <div class="information">
                            <div class="address">
                                <p>Already a member? <a class="link-success fw-bold" href="./login.jsp">Sign in</a> here</p>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="contact-form">
                    <span class="circle one"></span>
                    <span class="circle two"></span>

                    <form action="" id="registerForm" onsubmit="return registerValidate()" method="post">
                        <h3 class="title mb-4">Sign Up</h3>

                        <div class="input-contact-us">
                            <input type="text" id="name" name="name" class="input" placeholder="Enter your Name"/>
                        </div>
                        <div class="input-contact-us">
                            <input type="text" id="email" name="email" class="input" placeholder="Enter your email"/>
                        </div>
                        <div class="input-contact-us">
                            <input type="tel" id="phone" name="phone" maxlength="10" class="input" placeholder="Enter your mobile no."/>
                        </div>
                        <div class="input-contact-us">
                            <input type="password" id="password" name="password" class="input" placeholder="Enter a Password" />
                        </div>
                        <div class="input-contact-us">
                            <input type="password" id="cpassword" name="cpassword" class="input" placeholder="Re-enter your Password" />
                        </div>
                        <div class="text-end mt-4">
                            <input type="submit" value="Sign up" class="bnt" />
                        </div>
                    </form>
                </div>
            </div>
        </div>
        





<%@ include file="./sections/footer.jsp" %>


