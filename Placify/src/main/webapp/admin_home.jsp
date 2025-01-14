<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Admin Home Page </title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
        
        <!-- Fonts -->
        <!-- Lato -->
        <link href='http://fonts.googleapis.com/css?family=Lato:400,300,700' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="http://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
        <!-- CSS -->
        <link rel="stylesheet" href="css/css_admin/bootstrap.min.css">
        <!-- <link rel="stylesheet" href="css/font-awesome.min.css"> -->
        <!-- <link rel="stylesheet" href="css/owl.carousel.css"> -->
        <link rel="stylesheet" href="css/css_admin/animate.css">
        <link rel="stylesheet" href="css/css_admin/main.css">
        <!-- Responsive Stylesheet -->
        <link rel="stylesheet" href="css/css_admin/responsive.css">
    </head>

    <body id="body">
	    <!-- 
	    Header start
	    ==================== -->
	    <div class="navbar-default navbar-fixed-top" id="navigation">
	        <div class="container">
	            <!-- Brand and toggle get grouped for better mobile display -->
	            <div class="navbar-header">
	                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar">
	                    <span class="sr-only">Toggle navigation</span>
	                    <span class="icon-bar"></span>
	                    <span class="icon-bar"></span>
	                    <span class="icon-bar"></span>
                        
	                </button>
	                <a class="navbar-brand" href="#">
<p>Placify</p>
	                </a>
	            </div>

	            <!-- Collect the nav links, forms, and other content for toggling -->
	            <nav class="collapse navbar-collapse" id="navbar">
	                <ul class="nav navbar-nav navbar-right" id="top-nav">
	                    <li class="current"><a href="#body">Home</a></li>
	                    <li><a href="#card">Browse Topics</a></li>
	                    <li><a href="#service">Services</a></li>
	                    <li><a href="#contact">Contact</a></li>
	                </ul>
	            </nav><!-- /.navbar-collapse -->
	        </div><!-- /.container-fluid -->
	    </div>

        <section id="hero-area">
            <div class="container">
                <div class="row">
                    <div class="col-md-6">
                        <div class="block">
                            <h1 id="typewriter-text" class="wow fadeInDown">A Placement Preparation Platform</h1>
                            <p class="wow fadeInDown" data-wow-delay="0.3s">Empowering students with trusted resources and guidance for placement success.</p>
                        </div>
                    </div>
                </div><!-- .row close -->
            </div><!-- .container close -->
        </section><!-- header close --> 
        



        <!-- Cards  ==================== -->

         <!-- Card Section -->
<!-- apply styling and text decoration none on p tag -->
<div id="card" class="container-fluid my-cards-section">
    <h2 class="text-center">Browse Topics</h2>
    <div class="row justify-content-center">
        <div class="col-md-3 my-card">
            <div class="card-content">
                <a href="manage_student.jsp"> 
                <img src="img\student.png" alt="" class="card-img">
                
                <h3>Manage Students</h3>
               <!--  <p>Stay updated with the latest placement news and official announcements.</p>  -->
            </a>
            </div>
        </div>
        <div class="col-md-3 my-card">
            <div class="card-content">
                <a href="manage_coordinator.jsp">
                <img src="img\Teacher.jpeg" alt="" class="card-img">
                
                <h3>Manage Co-ordinators</h3>
               <!--  <p>Test your knowledge with real-time quizzes designed to prepare you for placements.</p>    -->
            </a>
            </div>
        </div>
    </div>
</div>

        <!--  Service start ==================== -->
        <section id="service" class="section">
            <div class="container">
                <div class="row">
                    <div class="heading wow fadeInUp">
                        <h2>Our service</h2>
                        <p>Placify offers verified study resources, mock tests, and progress tracking to support students in their placement preparation. <br> It connects students, coordinators, and administrators seamlessly, making placement preparation organized and efficient</p>
                    </div>
                    <div class="col-sm-6 col-md-3 wow fadeInLeft">
                        <div class="service">
                            <div class="icon-box">
                            	<span class="icon">
                                    <i class="ion-android-desktop"></i>   
                                </span>
                            </div>
                            <div class="caption">
                                <h3>Manage Users</h3>
                                <p> Effectively manage users and also verify them.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-3 wow fadeInLeft" data-wow-delay="0.3s">
                        <div class="service">
                            <div class="icon-box">
                            	<span class="icon">
                                    <i class="ion-speedometer"></i>   
                                </span>
                            </div>
                            <div class="caption">
                            	<h3>track Progress</h3>
                                <p>Monitor student performance and growth with real-time progress tracking.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-3 wow fadeInLeft" data-wow-delay="0.6s">
                        <div class="service">
                            <div class="icon-box">
                            	<span class="icon">
                                    <i class="ion-ios-infinite-outline"></i>   
                                </span>
                            </div>
                            <div class="caption">
                                <h3>Seamless Interaction</h3>
                                <p>Enable smooth and efficient communication for an enhanced learning experience.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-3 wow fadeInLeft" data-wow-delay="0.9s">
                        <div class="service">
                            <div class="icon-box">
                            	<span class="icon">
                                    <i class="ion-ios-cloud-outline"></i>   
                                </span>
                            </div>
                            <div class="caption">
                                <h3>Manage Data</h3>
                                <p>Easily handle data with secure and organized management solutions</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div><!-- .container close -->
        </section>
        <!-- #service close -->

        <!-- Footer Section start -->
        <footer id="contact" class="footer">
            <div class="container">
                <div class="row1">
                    <div class="footer-col">
                        <h4>company</h4>
                        <ul>
                            <li><a href="#">about us</a></li>
                            <li><a href="#">our services</a></li>
                            <li><a href="#">privacy policy</a></li>
                            <li><a href="#">affiliate program</a></li>
                        </ul>
                    </div>
                    <div class="footer-col">
                        <h4>get help</h4>
                        <ul>
                            <li><a href="#">FAQ</a></li>
                            <li><a href="#">shipping</a></li>
                            <li><a href="#">returns</a></li>
                            <li><a href="#">order status</a></li>
                            <li><a href="#">payment options</a></li>
                        </ul>
                    </div>
                    <!-- 
                    <div class="footer-col">
                        <h4>online shop</h4>
                        <ul>
                            <li><a href="#">watch</a></li>
                            <li><a href="#">bag</a></li>
                            <li><a href="#">shoes</a></li>
                            <li><a href="#">dress</a></li>
                        </ul>
                    </div>
                     -->
                    <div class="footer-col">
                        <h4>follow us</h4>
                        <div class="social-links">
                            <a href="#"><i class="fab fa-facebook-f"></i></a>
                            <a href="#"><i class="fab fa-twitter"></i></a>
                            <a href="#"><i class="fab fa-instagram"></i></a>
                            <a href="#"><i class="fab fa-linkedin-in"></i></a>
                        </div>
                    </div>
                </div>
            </div>
       </footer>
<!-- Footer Section end-->

        <section clas="wow fadeInUp">
        	<div class="map-wrapper">
        	</div>
        </section>

        <footer>
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="block">
                            <p>Copyright &copy; | All right reserved.</p>
                        </div>
                    </div>
                </div>
            </div>
        </footer>


        <!-- Js -->
    
        <script src="js/js_admin/vendor/jquery-1.10.2.min.js"></script>
        <script src="js/js_admin/jquery.nav.js"></script>
        <script src="js/js_admin/wow.min.js"></script>
        <script src="js/js_admin/main.js"></script>
        
    </body>
</html>
