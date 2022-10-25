function registerValidate(){
    var name = document.getElementById("name").value;
	var email = document.getElementById("email").value;
	var phone = document.getElementById("phone").value;
	var password = document.getElementById("password").value;
	var cpassword = document.getElementById("cpassword").value;
	
	var alphaExp = /^[a-zA-Z\s]+$/;
	var emailExp = /^[\w\-\.\+]+\@[a-zA-Z0-9\.\-]+\.[a-zA-z0-9]{2,4}$/;
	var phoneExp = /^\d{10}$/; 
	var passExp = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[^a-zA-Z0-9])(?!.*\s).{8,20}$/;
  

	if(name.length<=2){
		document.getElementById("name").focus();
		alert("Name should be greater than 2 characters");
		return false;
	}
	else{
	
		if(!name.match(alphaExp)){ 
			document.getElementById("name").focus();
			alert("Please enter only letters for your name");
			return false;
		}	 
		else{
		
			if (!email.match(emailExp)){
				document.getElementById("email").focus();
				alert("Please enter a valid email address");
				return false;
			}	 
			else{	
				
				if (!phone.match(phoneExp)){
					document.getElementById("phone").focus();
					alert("Please enter a valid phone number");
					return false;
				}
				else{

					if (!password.match(passExp)){
						document.getElementById("password").focus();
						alert("Please enter a password between 8 to 20 characters with at least one lowercase letter, one uppercase letter, one numeric digit, and one special character");
						return false;
					}
					else{
					
						if (password != cpassword){
							document.getElementById("cpassword").focus();
							alert("Password and confirm password does not match")
							return false;
						}	
						else{
							document.getElementById("registerForm").action = "./registration.jsp";
							return true;
						}
					}								
				}

			}	
		}	
	}		
}



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

 

 
