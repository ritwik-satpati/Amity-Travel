<!doctype html>
<html lang="en">    
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
              <link href='https://fonts.googleapis.com/css?family=Cairo&display=swap' rel='stylesheet'>
    <link href='https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap' rel='stylesheet'>
    

        <link rel="stylesheet" href="css/home.css">
        
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
        integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />

        <script src="./js/validation.js"></script>
        <script src="./js/functions.js"></script>


        <script>
            var checkSession = '<%=session.getAttribute("alertmsg") %>';
            if(checkSession != "null"){
                function alertLog() {
                    alert("Successfully Logged in");
                    <% session.setAttribute("alertmsg",null); %>
                }
            }
        </script>
        
        <title>Amity Travels</title>

    </head>

    <body>

        <nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark">
            <div class="container-fluid">
                <a class="navbar-brand">
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                    Amity Travels
                </a>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="home.jsp">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" href="./home.jsp#about-us">About Us</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" href="./home.jsp#contact-us">Contact Us</a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link active dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown"
                               aria-expanded="false">
                                Travels
                            </a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="flight.jsp">Book Flights</a></li>
                                <li>
                                    <hr class="dropdown-divider">
                                </li>
                                <li><a class="dropdown-item" href="hotel.jsp">Book Hotels</a></li>
                            </ul>
                        </li>
                    </ul>
                    <div class="butn">
                        <%
                            if(session.getAttribute("userid")!=null){
                                
                        %>
                                <a href="./profile.jsp" class="btn btn-outline-light rounded-pill text-uppercase bnt mx-2">My Account</a>
                                <a href='./logout.jsp' class='btn btn-outline-light rounded-pill text-uppercase bnt mx-2' onclick="alertmsg('You have successfully logged out')">Logout</a>
                        <%  
                            }
                            else{
                        %>
                            <a href="./login.jsp" class="btn btn-outline-light rounded-pill text-uppercase bnt mx-2">Login</a>
                            <a class="btn btn-outline-light rounded-pill text-uppercase bnt mx-2" href="./signup.jsp">SignUp</a>
                        <%
                            }
                        %>
                    </div>
                </div>
            </div>
        </nav>

<script>
    window.onload = alertLog;
</script>

