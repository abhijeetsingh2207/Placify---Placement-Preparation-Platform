<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">

<head>
<% String nm=(String)session.getAttribute("name");
if(nm=="" || nm==null){
	response.sendRedirect("student_login.jsp");
}%>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <title>Student Home Page</title>
  <!-- Favicons -->
  <!-- <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon"> -->
  <!-- Fonts -->
  <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&family=Inter:wght@100;200;300;400;500;600;700;800;900&family=Nunito:ital,wght@0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
  <!-- Vendor CSS Files -->
  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="vendor/aos/aos.css" rel="stylesheet"> <!-- scroling loading animation -->
  <!-- Main CSS File -->
  <link href="css/css_student/main.css" rel="stylesheet">

</head>

<body class="index-page">

  <header id="header" class="header d-flex align-items-center fixed-top">
    <div class="container-fluid container-xl position-relative d-flex align-items-center">

      <a href="index.jsp" class="logo d-flex align-items-center me-auto">
        <img src="img/logo.png" alt="">
        <h1 class="sitename">Placify</h1>
      </a>

      <nav id="navmenu" class="navmenu">
        <ul>
          <li><a href="#hero" class="active">Home</a></li>
          <li><a href="#about">About</a></li>
          <li><a href="#services">Services</a></li>
          <li><a href="#features">Features</a></li>
          <li><a href="#footer">Contact</a></li>
        </ul>
        <i class="mobile-nav-toggle d-xl-none bi bi-list"></i>
      </nav>
 
      <form action="Search_user" method="post"> 
   <button type ="submit" class="btn-getstarted" > Edit Profile </button>
   </form>
   <form action="Logout" method="post"> 
   <button type ="submit" class="btn-getstarted" > Logout </button>
   </form>
    </div>
  </header>

  <main class="main">

    <!-- Hero Section -->
    <section id="hero" class="hero section">
      <div class="hero-bg">
        <img src="img/hero-bg-light.webp" alt="">
      </div>
      <div class="container text-center">
        <div class="d-flex flex-column justify-content-center align-items-center">
          <h1 data-aos="fade-up">Welcome to <span>Placify</span></h1>
          <p data-aos="fade-up" data-aos-delay="100">Quickly start your preapration now and set the stage for success<br></p>
          <div class="d-flex" data-aos="fade-up" data-aos-delay="200">
            <a href="#services" class="btn-get-started">Get Started</a>
       <!--      <a href="https://www.youtube.com/watch?v=Y7f98aduVJ8" class="glightbox btn-watch-video d-flex align-items-center"><i class="bi bi-play-circle"></i><span>Watch Video</span></a>  -->
          </div>
          <img src="img/hero-services-img.webp" class="img-fluid hero-img" alt="" data-aos="zoom-out" data-aos-delay="300">
        </div>
      </div>

    </section><!-- /Hero Section -->

    <!-- Featured Services Section -->
    <section id="featured-services" class="featured-services section light-background">

      <div class="container">

        <div class="row gy-4">

          <div class="col-xl-4 col-lg-6" data-aos="fade-up" data-aos-delay="50">
            <div class="service-item d-flex">
              <div class="icon flex-shrink-0"><i class="bi bi-briefcase"></i></div>
              <div>
                <h4 class="title">Access Materials</h4>
                <p class="description"> 24/7 Access to Your Personalized Learning Portal.</p>
              </div>
            </div>
          </div>
          <!-- End Service Item -->

          <div class="col-xl-4 col-lg-6" data-aos="fade-up" data-aos-delay="100">
            <div class="service-item d-flex">
              <div class="icon flex-shrink-0"><i class="bi bi-card-checklist"></i></div>
              <div>
                <h4 class="title"><a href="#" class="stretched-link">Take Assessment</a></h4>
                <p class="description"> Assess Your Understanding with Real-World Scenarios.</p>
              </div>
            </div>
          </div><!-- End Service Item -->

          <div class="col-xl-4 col-lg-6" data-aos="fade-up" data-aos-delay="200">
            <div class="service-item d-flex">
              <div class="icon flex-shrink-0"><i class="bi bi-bar-chart"></i></div>
              <div>
                <h4 class="title"><a href="#" class="stretched-link">Track Your Progress</a></h4>
                <p class="description"> Identify Areas for Improvement and Celebrate Your Achievements.</p>
              </div>
            </div>
          </div><!-- End Service Item -->

        </div>

      </div>

    </section><!-- /Featured Services Section -->

    <!-- About Section -->
    <section id="about" class="about section">

      <div class="container">

        <div class="row gy-4">

          <div class="col-lg-6 content" data-aos="fade-up" data-aos-delay="50">
            <p class="who-we-are">Who We Are</p>
            <h3>Unleashing Potential with Creative Strategy</h3>
            <p class="fst-italic">
              
            </p>
            <ul>
              <li><i class="bi bi-check-circle"></i> <span>Innovative Learning Strategies to Boost Your Performance.</span></li>
              <li><i class="bi bi-check-circle"></i> <span>Creative Approaches to Master Complex Concepts.</span></li>
              <li><i class="bi bi-check-circle"></i> <span>Personalized Learning Paths to Achieve Your Goals.</span></li>
            </ul>
            <a href="#services" class="read-more"><span>Read More</span><i class="bi bi-arrow-right"></i></a>
          </div>

          <div class="col-lg-6 about-images" data-aos="fade-up" data-aos-delay="100">
            <div class="row gy-4">
              <div class="col-lg-6">
                <img src="img/Student Images/images11.jpg" class="img-fluid" alt="">
              </div>
              <div class="col-lg-6">
                <div class="row gy-4">
                  <div class="col-lg-12">
                    <img src="img/Student Images/images22.jpg" class="img-fluid" alt="">
                  </div>
                  <div class="col-lg-12">
                    <img src="img/Student Images/images33.jpg" class="img-fluid" alt="">
                  </div>
                </div>
              </div>
            </div>

          </div>

        </div>

      </div>
    </section><!-- /About Section -->


    <!-- Services Section -->
    <section id="services" class="services section light-background">

      <!-- Section Title -->
      <div class="container section-title" data-aos="fade-up">
        <h2>Services</h2>
        <p>Help you in achieving your goals, providing support, resources, or solutions tailored to your needs.</p>
      </div><!-- End Section Title -->

      <div class="container">

        <div class="row g-5">

          <div class="col-lg-6" data-aos="fade-up" data-aos-delay="50">
            <div class="service-item item-cyan position-relative">
              <img src="img\Student Images\Information img.avif" class="img" >
              <div>
                <h3>Information</h3>
                <p>Stay updated with the latest placement news and official announcements.</p>
                <a href="StudentInformation" class="read-more stretched-link">Learn More <i class="bi bi-arrow-right"></i></a>
              </div>
            </div>
          </div><!-- End Service Item 1 -->

          <div class="col-lg-6" data-aos="fade-up" data-aos-delay="100">
            <div class="service-item item-orange position-relative">
              <img src="img\Student Images\box2.webp"  class="img" >
              <div>
                <h3>Quiz</h3>
                <p>Test your knowledge with real-time quizzes designed to prepare you for placements.</p>
                <a href="quiz_input.jsp" class="read-more stretched-link">Learn More <i class="bi bi-arrow-right"></i></a>
              </div>
            </div>
          </div><!-- End Service Item 2-->

          <div class="col-lg-6" data-aos="fade-up" data-aos-delay="150">
            <div class="service-item item-teal position-relative">
              <img src="img\Student Images\box3.jpg" class="img" srcset="">
              <div>
                <h3>Track Progress</h3>
                <p>Track your preparation journey and see how you measure up against your goals.</p>
                <a href="track_progress.jsp" class="read-more stretched-link">Learn More <i class="bi bi-arrow-right"></i></a>
              </div>
            </div>
          </div><!-- End Service Item 3 -->

          <div class="col-lg-6" data-aos="fade-up" data-aos-delay="200">
            <div class="service-item item-red position-relative">
              <img src="img\Student Images\box4.avif" class="img" srcset="">
              <div>
                <h3>Resources</h3>
                <p>Access a curated collection of study materials and previous year questions.</p>
                <a href="resource_view.jsp" class="read-more stretched-link">Learn More <i class="bi bi-arrow-right"></i></a>
              </div>
            </div>
          </div><!-- End Service Item 4 -->

          <div class="col-lg-6" data-aos="fade-up" data-aos-delay="250">
            <div class="service-item item-indigo position-relative">
              <img src="img\Student Images\box5.jpg" class="img" srcset="">
              <div>
                <h3>Syllabus</h3>
                <p>Review the complete syllabus to ensure you're on the right track for your exams and placements.</p>
                <a href="syllabus_view.jsp" class="read-more stretched-link">Learn More <i class="bi bi-arrow-right"></i></a>
              </div>
            </div>
          </div><!-- End Service Item 5 -->

          <div class="col-lg-6" data-aos="fade-up" data-aos-delay="300">
            <div class="service-item item-pink position-relative">
              <img src="img\istockphoto-1347239959-612x612.jpg" alt="" class="img" srcset="">
              <div>
                <h3>Feedback</h3>
                <p>Share Your Thoughts, Shape the Future through your feedback and ideas.</p>
                <a href="feedback_student.jsp" class="read-more stretched-link">Learn More <i class="bi bi-arrow-right"></i></a>
              </div>
            </div>
          </div> 

          <!-- End Service Item 6 -->

        </div>

      </div>

    </section><!-- /Services Section -->




    <!-- Features Section -->
    <section id="features" class="features section">

      <!-- Section Title -->
      <div class="container section-title" data-aos="fade-up">
        <h2>Features</h2>
        <p>Transform Your Future with Creative Learning.</p>
      </div><!-- End Section Title -->

      <div class="container">
        <div class="row justify-content-between">

          <div class="col-lg-5 d-flex align-items-center">

            <ul class="nav nav-tabs" data-aos="fade-up" data-aos-delay="50">
              <li class="nav-item">
                <a class="nav-link active show" data-bs-toggle="tab" data-bs-target="#features-tab-1">
                  <i class="bi bi-binoculars"></i>
                  <div>
                    <h4 class="d-none d-lg-block"></h4>
                    <p>
                      Comprehensive Study Materials and Practice Tests.
                    </p>
                  </div>
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" data-bs-toggle="tab" data-bs-target="#features-tab-2">
                  <i class="bi bi-box-seam"></i>
                  <div>
                    <h4 class="d-none d-lg-block"></h4>
                    <p>
                      Personalized Learning Paths and Progress Tracking.
                    </p>
                  </div>
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" data-bs-toggle="tab" data-bs-target="#features-tab-3">
                  <i class="bi bi-brightness-high"></i>
                  <div>
                    <h4 class="d-none d-lg-block"></h4>
                    <p>
                     Expert Faculty and 24/7 Support.
                    </p>
                  </div>
                </a>
              </li>
            </ul><!-- End Tab Nav -->

          </div>

          <div class="col-lg-6">

            <div class="tab-content" data-aos="fade-up" data-aos-delay="100">

              <div class="tab-pane fade active show" id="features-tab-1">
                <img src="img\images.jpeg" alt="" class="img-fluid">
              </div><!-- End Tab Content Item -->

            </div>

          </div>

        </div>

      </div>

    </section><!-- /Features Section -->

    <!-- Faq Section -->
    <section id="faq" class="faq section">

      <!-- Section Title -->
      <div class="container section-title" data-aos="fade-up">
        <h2>Frequently Asked Questions</h2>
      </div><!-- End Section Title -->

      <div class="container">

        <div class="row justify-content-center">

          <div class="col-lg-10" data-aos="fade-up" data-aos-delay="50">

            <div class="faq-container">

              <div class="faq-item faq-active">
                <h3>Q: How do I track my placement preparation progress on Placify?</h3>
                <div class="faq-content">
                  <p>A: In the Student Module, you can view detailed progress reports based on your performance in quizzes, mock tests, and assessments. This feature helps you identify areas where you need improvement, track your progress over time, and stay motivated as you work toward your placement goals.</p>
                </div>
                <i class="faq-toggle bi bi-chevron-right"></i>
              </div><!-- End Faq item-->

              <div class="faq-item">
                <h3>Q: How do I access placement resources on Placify?</h3>
                <div class="faq-content">
                  <p>In the Resources section of the Student Module, youâll find materials like previous year questions, study guides, and interview preparation tips for companies like TCS, Infosys, and Accenture. These resources are regularly updated by coordinators to help you prepare effectively..</p>
                </div>
                <i class="faq-toggle bi bi-chevron-right"></i>
              </div><!-- End Faq item-->

              <div class="faq-item">
                <h3>Q: Can I take quizzes or mock tests to practice for placements?</h3>
                <div class="faq-content">
                  <p>A: Yes! Placify offers a range of quizzes and mock tests available in the Student Module. These are designed to simulate real placement exams and are updated by coordinators on a weekly or monthly basis to help you stay well-prepared.</p>
                </div>
                <i class="faq-toggle bi bi-chevron-right"></i>
              </div><!-- End Faq item-->

              <div class="faq-item">
                <h3>Q: How can I provide feedback on the resources and assessments on Placify?</h3>
                <div class="faq-content">
                  <p>A: You can submit feedback on resources, quizzes, or mock tests directly through the Feedback section in the Student Module. Your feedback helps coordinators enhance the quality of study materials and assessments for everyoneâs benefit.</p>
                </div>
                <i class="faq-toggle bi bi-chevron-right"></i>
              </div><!-- End Faq item-->

              <div class="faq-item">
                <h3>Q: Is my performance in Placify's quizzes and tests visible to other students?</h3>
                <div class="faq-content">
                  <p>A: No, your performance data is private and visible only to you and authorized coordinators. Placify is designed to maintain confidentiality, and the progress reports are strictly for your personal tracking and improvement.</p>
                </div>
                <i class="faq-toggle bi bi-chevron-right"></i>
              </div><!-- End Faq item-->
            </div>
          </div><!-- End Faq Column-->
        </div>
      </div>
    </section>
    <!-- /Faq Section -->
  </main>

  <footer id="footer" class="footer position-relative light-background">

    <div class="container footer-top">
      <div class="row gy-4">
        <div class="col-lg-4 col-md-6 footer-about">
          <a href="index.jsp" class="logo d-flex align-items-center">
            <span class="sitename">Placify</span>
          </a>
          <div class="footer-contact pt-3">
           <p> INDIA </p>
                  <p>VijayNagar - 452010</p>
                  <p>Indore, Madhya Pradesh</p>
            <p class="mt-3"><strong>Phone:</strong> <span>+91 84354 18813</span></p>
            <p><strong>Email:</strong> <span>placify@gmail.com</span></p>
          </div>
          <div class="social-links d-flex mt-4">
            <a href=""><i class="bi bi-twitter-x"></i></a>
            <a href=""><i class="bi bi-facebook"></i></a>
            <a href=""><i class="bi bi-instagram"></i></a>
            <a href=""><i class="bi bi-linkedin"></i></a>
          </div>
        </div>

        <div class="col-lg-2 col-md-3 footer-links">
          <h4>Useful Links</h4>
          <ul>
            <li><a href="index.jsp#hero" class="active">Home</a></li>
            <li><a href="index.jsp#about">About</a></li>
            <li><a href="index.jsp#services">Services</a></li>
            <li><a href="index.jsp#features">Features</a></li>
          </ul>
        </div>

        <div class="col-lg-2 col-md-3 footer-links">
          <h4>Our Services</h4>
          <ul>
            <li><a href="#services">Information</a></li>
            <li><a href="#services">Quiz</a></li>
            <li><a href="#services">Track Progress</a></li>
            <li><a href="#services">Resources</a></li>
            <li><a href="#services">Syllabus</a></li>
          </ul>
        </div>
      </div>
    </div>

    <div class="container copyright text-center mt-4">
      <p>Â© <span>Copyright</span> <strong class="px-1 sitename">Placify</strong><span>All Rights Reserved</span></p>
      <div class="credits">
      </div>
    </div>

  </footer>

  <!-- Scroll Top -->
  <a href="#" id="scroll-top" class="scroll-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Preloader -->
  <div id="preloader"></div>

  <!-- Vendor JS Files -->
  <script src="vendor/aos/aos.js"></script>
  <!-- Main JS File -->
  <script src="js/js/main.js"></script>

</body>

</html>