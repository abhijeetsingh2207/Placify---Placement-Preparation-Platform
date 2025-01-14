<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
<% String nm=(String)session.getAttribute("name");
if(nm=="" || nm==null){
	response.sendRedirect("placement_cor_login.jsp");
}%>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick-theme.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.10.5/font/bootstrap-icons.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css">
    <title>Responsive Animated Navbar with Slider</title>
    <link rel="stylesheet" href="css/coordinatore.css">
</head>
<body>
    <!-- Header Section -->
    <header>
        <nav>
            <div class="logo">
                <a href="#" class="logo-text">Placify</a>
            </div>
            <div class="hamburger">
                <div class="line1"></div>
                <div class="line2"></div>
                <div class="line3"></div>
            </div>
            <ul class="nav-links">
                <li><a href="#hero" class="active">Home</a></li>
                <li><a href="#service">Services</a></li>
               <!--  <li><a href="#about">About </a></li>    -->
                <li><a href="#footer">Contact Us</a></li>  
            </ul>
   
            <form action="Search_coordinator" method="post"> 
   <button type ="submit" class="login-button" > Edit Profile </button>
   </form>
   <form action="Logout" method="post"> 
   <button type ="submit" class="login-button" > Logout </button>
   </form>
        </nav>
    </header>
    <section class="home-section d-flex align-items-center" id="hero">
      <div class="container">
          <div class="row align-items-center">
              <div class="col-lg-6 text-content">
                  <h1 class="title">Take Control of Your Classroom</h1>
                  <p class="description">
                      Serves as a centralized hub for teachers to efficiently manage and upload resources for students. 
                       With an intuitive and responsive interface, the teacher module simplifies resource sharing and student engagement for effective placement preparation.  </p>
                 <!--  <a href="#" class="btn btn-explore">Explore </a>  -->
              </div>
              <div class="col-lg-6 text-center image-content">
                  <div class="img-wrapper">
                      <img src="img\teacher1.jpeg" alt="Training and Placement Officer" class="img-fluid placement-img">
                  </div>
              </div>
          </div>
      </div>
  </section>

  <!-- Services Section -->
  <section class="services-section" id="service">
    <div class="container">
        <h2 class="services-heading">Our Services</h2>
        <div class="row">
            <!-- Card 1 -->
            <div class="col-lg-4 col-md-6 mb-4">
                <a href="pc_information.jsp" class="service-card-link">
                    <div class="service-card">
                        <div class="service-icon">&#128187;</div>
                        <h3>Upload Information</h3>
                        <p></p>
                    </div>
                </a>
            </div>

            <!-- Card 2 -->
            <div class="col-lg-4 col-md-6 mb-4">
                <a href="upload_quiz1.jsp" class="service-card-link">
                    <div class="service-card">
                        <div class="service-icon">&#127891;</div>
                        <h3>Upload Quiz</h3>
                        <p></p>
                    </div>
                </a>
            </div>

            <!-- Card 3 -->
            <div class="col-lg-4 col-md-6 mb-4">
                <a href="check_progress.jsp" class="service-card-link">
                    <div class="service-card">
                        <div class="service-icon">&#128203;</div>
                        <h3>Check Progress</h3>
                        <p></p>
                    </div>
                </a>
            </div>

            <!-- Card 4 -->
            <div class="col-lg-4 col-md-6 mb-4">
                <a href="upload_syllabus.jsp" class="service-card-link">
                    <div class="service-card">
                        <div class="service-icon">&#128218;</div>
                        <h3>Upload Syllabus</h3>
                        <p></p>s
                    </div>
                </a>
            </div>

            <!-- Card 5 -->
            <div class="col-lg-4 col-md-6 mb-4">
                <a href="upload_resources.jsp" class="service-card-link">
                    <div class="service-card">
                        <div class="service-icon">&#128187;</div>
                        <h3>Upload Resources</h3>
                        <p></p>
                    </div>
                </a>
            </div>

            <!-- Card 6 -->
            <div class="col-lg-4 col-md-6 mb-4">
                <a href="feedback_coordinator.jsp" class="service-card-link">
                    <div class="service-card">
                        <div class="service-icon">&#128188;</div>
                        <h3>Feedback</h3>
                        <p></p>
                    </div>
                </a>
            </div>
        </div>
    </div>
</section>


<!-- Footer Section -->
<footer class="footer bg-dark text-light py-5" id="footer">
    <div class="container">
        <div class="row">
            <!-- Logo and Description -->
            <div class="col-md-4 mb-3">
                <div class="footer-logo">
                    <h1 class="text-primary">Placify</h1> <!-- Logo text -->
                </div>
                <p class="mt-3">Your ultimate platform for career preparation and placement services.</p>
            </div>
            
            <!-- Links -->
            <div class="col-md-4 mb-3">
                <h5 class="text-primary">Quick Links</h5>
                <ul class="list-unstyled">
                    <li><a href="index.jsp#hero" class="text-light">Home</a></li>
                    <li><a href="index.jsp#about" class="text-light">About </a></li>
                    <li><a href="index.jsp#services" class="text-light">Services</a></li>
                    <li><a href="index.jsp#footer" class="text-light">Contact</a></li>
                </ul>
            </div>
            
            <!-- Contact Information -->
            <div class="col-md-4 mb-3">
                <h5 class="text-primary">Contact Us</h5>
                <ul class="list-unstyled">
                    <li><i class="bi bi-geo-alt"></i> INDIA , Madhya Pradesh, Indore - VijayNagar (452010)</li>
                    <li><i class="bi bi-envelope"></i> <a href="" class="text-light">placify@gmail.com</a></li>
                    <li><i class="bi bi-phone"></i> <a href="" class="text-light">+91 84354 18813</a></li>
                </ul>
                <div class="mt-3">
                    <a href="https://www.facebook.com/placify" class="text-light me-3" target="_blank" aria-label="Facebook"><i class="bi bi-facebook"></i></a>
                    <a href="https://x.com/placify" class="text-light me-3" target="_blank" aria-label="X"><i class="bi bi-x"></i></a>
                    <a href="https://www.linkedin.com/company/placify" class="text-light me-3" target="_blank" aria-label="LinkedIn"><i class="bi bi-linkedin"></i></a>
                    <a href="https://www.instagram.com/placify" class="text-light" target="_blank" aria-label="Instagram"><i class="bi bi-instagram"></i></a>
                </div>
            </div>
        </div>
        <div class="text-center mt-4">
            <p>&copy; 2024 Placify. All rights reserved.</p>
        </div>
    </div>
</footer>

<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
</body>
</html>
