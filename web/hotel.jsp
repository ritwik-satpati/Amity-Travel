<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.Date" %>
<%@page import="java.util.*" %>

<%@include file = "./sections/header.jsp" %>


<% 
  if(session.getAttribute("userid")==null){
    session.setAttribute("hotelLogin", "false");
    response.sendRedirect("./login.jsp");
  }
%>

<%

  String[] city = {"Cairo, Egypt", "Paris, France", "Maldives", "Bern, Switzerland"};
  String monthyear = "/06/2022";
  
%>

<style> 
  .input-counter {
    max-width: 100%;
    min-width: 150px;
    text-align: center;
    position: relative;
  }
  .input-counter span {
    top: 0;
    width: 20%;
    height: 100%;
    font-size: 30px;
    cursor: pointer;
    line-height: 40px;
    position: absolute;
    border-radius:50px;
  }
  .input-counter span.minus-btn {
    left: 0;
    border-right: 1px solid #eeeeee;
    background: #ffc107;
    border-top-left-radius: 5px;
    border-bottom-left-radius: 5px;
    transition: all 0.3s ease;
  }
  .input-counter span.plus-btn {
    right: 0;
    border-left: 1px solid #eeeeee;
    background: #ffc107;
    border-bottom-right-radius: 5px;
    border-top-right-radius: 5px;
    transition: all 0.3s ease;
  }
  .input-counter span.minus-btn:hover {
    background: #1cd4af;
  }
  .input-counter span.plus-btn:hover {
    background: #1cd4af;
  }

  .input-counter span:hover {
  }
  .input-counter input {
    outline: 0;
    height: 47px;
    display: block;
    text-align: center;
    border: 1px solid #eeeeee;
    font-size: 18px;
    font-weight: 600;
  }
  .input-counter input::placeholder {
    color: var(--blackColor);
  }
</style>


<body style="background-image:url('./assets/img/hotelbg.png'); background-repeat: no-repeat; background-size: cover;">


    <div class="container mt-5 mb-5 p-4" style="min-height:55vh">
        <form action="./hotelbookingsuccess.jsp" style="background: #6c757d90;" class="rounded-3 shadow-lg m-1 p-5">
            <h3 class="text-light">
                <i class="fa-solid fa-hotel"></i> Hotel Booking
            </h3>
            <p class="lead text-light mb-4" style="opacity: 80%; font-size: 16px;">Book Hotels at affordable price</p>
            <div class="row">
                <div class="col-6">
                    <label class="lead text-light" for="cin">Choose your stay: </label>
                    <select class="form-select form-select-lg mb-3" aria-placeholder="Select City/Country"
                        aria-label=".form-select-lg source" name="city">
                        <option selected disabled>Select City/Country</option>
                        <% 
                          for(int i=0;i<city.length;i++){
                        %>
                          <option value="<%=city[i] %>"><%=city[i] %></option>
                        <%
                          }
                        %>                        
                    </select>
                </div>
                <div  class="col-6"> 
                    <label class="lead text-light" for="cin">(Maximum 4 guests/room:) </label>
                    <div class="input-counter room-counter">
                      <span class="minus-btn">-</span>
                      <input type="text" class="form-control form-control-lg mb-3" name="noofrooms" value="1">
                      <span class="plus-btn">+</i></span>
                    </div>
                </div>
            </div>
                
            <div class="row">
                <div class="col-7">

                  <label class="lead text-light" for="cin">Check-in Date: </label>
                  <select type="number" class="form-select form-select-lg mb-3" aria-placeholder="Check in date" aria-label=".form-select-lg source" name="checkInDate">
                    <option selected disabled>Select Date</option>
                    <% 
                      for(int i=1;i<=30;i++){
                    %>
                      <option value="<%=i+monthyear %>"><%=i+monthyear%></option>
                    <%
                      }
                    %>
                  </select>
                </div>
                <div  class="col-5"> 
                    <label class="lead text-light" for="cin">Select no. of nights:</label>
                    <div class="input-counter night-counter">
                      <span class="minus-btn">-</span>
                      <input type="text" class="form-control form-control-lg mb-3" name="noofnights" value="1">
                      <span class="plus-btn">+</i></span>
                    </div>
                </div>
            </div>

            <div class="mt-3">
                <input type="submit" value="Book Now" class="btn btn-lg btn-warning col-12 text-uppercase tex">
            </div>


        </form>
    </div>


<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<script>
$('.room-counter').each(function() {
  var spinner = jQuery(this),
  input = spinner.find('input[type="text"]'),
  btnUp = spinner.find('.plus-btn'),
  btnDown = spinner.find('.minus-btn'),
  min = 1,
  max = 4;
  btnUp.on('click', function() {
    var oldValue = parseFloat(input.val());
    if (oldValue >= max) {
      var newVal = oldValue;
    } else {
      var newVal = oldValue + 1;
     }
     spinner.find("input").val(newVal);
     spinner.find("input").trigger("change");
    });
    btnDown.on('click', function() {
      var oldValue = parseFloat(input.val());
      if (oldValue <= min) {
        var newVal = oldValue;
      } else {
        var newVal = oldValue - 1;
      }
      spinner.find("input").val(newVal);
      spinner.find("input").trigger("change");
   });
});

$('.night-counter').each(function() {
  var spinner = jQuery(this),
  input = spinner.find('input[type="text"]'),
  btnUp = spinner.find('.plus-btn'),
  btnDown = spinner.find('.minus-btn'),
  min = 1,
  max = 6;
  btnUp.on('click', function() {
    var oldValue = parseFloat(input.val());
    if (oldValue >= max) {
      var newVal = oldValue;
    } else {
      var newVal = oldValue + 1;
     }
     spinner.find("input").val(newVal);
     spinner.find("input").trigger("change");
    });
    btnDown.on('click', function() {
      var oldValue = parseFloat(input.val());
      if (oldValue <= min) {
        var newVal = oldValue;
      } else {
        var newVal = oldValue - 1;
      }
      spinner.find("input").val(newVal);
      spinner.find("input").trigger("change");
   });
});

</script>





<%@ include file="./sections/footer.jsp" %>