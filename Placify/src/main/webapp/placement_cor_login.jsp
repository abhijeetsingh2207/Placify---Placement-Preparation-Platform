<!DOCTYPE html>
<html lang="en">
<head>
<% String nm=(String)session.getAttribute("name");
if(nm!="" && nm!=null){
	session.invalidate();
}%>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="css/placement_cordinatore_login.css">
</head>
<body>
    <div id="container" class="container">
		<!-- FORM SECTION -->
		<div class="row">
			<!-- SIGN UP -->
			<div class="col align-items-center flex-col sign-up">
				<div class="form-wrapper align-items-center">
					<div class="form sign-up">
					<form action="Registration_coordination" method="post">
						<div class="input-group">
							<i class='bx bxs-user'></i>
							<input type="text" name="name" placeholder="Full Name">
						</div>
                        
						<div class="input-group">
							<i class='bx bx-mail-send'></i>
							<input type="text" name="coordinatorId" placeholder="Teacher ID">
						</div>
                        <div class="input-group">
							<i class='bx bx-mail-send'></i>
							<input type="text" name="phoneNo" placeholder="Phone no.">
						</div>
						<div class="input-group">
							<i class='bx bx-mail-send'></i>
							<input type="email" name="email" placeholder="Email">
						</div>
						<div class="input-group">
							<i class='bx bxs-lock-alt'></i>
							<input type="password" name="password" placeholder="Password">
						</div>
						
						<!--  <div class="input-group">
							<i class='bx bxs-lock-alt'></i>
							<input type="password" placeholder="Confirm password">
						</div>
						-->
                   
                        
						<button>
							Sign up
						</button>
						</form>
						<p>
							<span>
								Already have an account?
							</span>
							<b onclick="toggle()" class="pointer">
								Sign in here
							</b>
						</p>
					</div>
				</div>
			
			</div>
			<!-- END SIGN UP -->
			<!-- SIGN IN -->
			<div class="col align-items-center flex-col sign-in">
				<div class="form-wrapper align-items-center">
					<div class="form sign-in">
					   <!-- Display login message if present -->
                       <% if (request.getAttribute("loginMessage") != null) { %>
                    <p style="color: red;"><%= request.getAttribute("loginMessage") %></p>
                <% } %>
					<form action="Login_coordinator" method="post">
						<div class="input-group">
							<i class='bx bxs-user'></i>
							<input type="text" name="coordinatorId" placeholder="Teacher ID">
						</div>
						<div class="input-group">
							<i class='bx bxs-lock-alt'></i>
							<input type="password" name="password" placeholder="Password">
						</div>
						<button>
							Sign in
						</button>
						</form>
						<p>
							<b>
							<a href="forget_password_coordinator.jsp"	>Forgot password? </a>
							</b>
						</p>
						<p>
							<span>
								Don't have an account?
							</span>
							<b onclick="toggle()" class="pointer">
								Sign up here
							</b>
						</p>
					</div>
				</div>
				<div class="form-wrapper">
		
				</div>
			</div>
			<!-- END SIGN IN -->
		</div>
		<!-- END FORM SECTION -->
		<!-- CONTENT SECTION -->
		<div class="row content-row">
			<!-- SIGN IN CONTENT -->
			<div class="col align-items-center flex-col">
				<div class="text sign-in">
					<h2>
						Welcome
					</h2>
	
				</div>
				<div class="img sign-in">
		
				</div>
			</div>
			<!-- END SIGN IN CONTENT -->
			<!-- SIGN UP CONTENT -->
			<div class="col align-items-center flex-col">
				<div class="img sign-up">
				
				</div>
				<div class="text sign-up">
					<h2>
						Join with us
					</h2>
	
				</div>
			</div>
			<!-- END SIGN UP CONTENT -->
		</div>
		<!-- END CONTENT SECTION -->
	</div>

    <script src="js/placement_cordinatore_login.js"></script>
</body>
</html>