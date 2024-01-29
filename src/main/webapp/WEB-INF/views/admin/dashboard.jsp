<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>

<html lang="en">

<head>

    <!-- META -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="keywords" content="" />
    <meta name="author" content="" />
    <meta name="robots" content="" />    
    <meta name="description" content="" />
    
    <!-- FAVICONS ICON -->
    <link rel="icon" href="images/favicon.ico" type="image/x-icon" />
    <link rel="shortcut icon" type="image/x-icon" href="images/favicon.png" />
    
    <!-- PAGE TITLE HERE -->
    <title>jobzilla Template | dashboard</title>
    
    <!-- MOBILE SPECIFIC -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
 
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.min.css"><!-- BOOTSTRAP STYLE SHEET -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/font-awesome.min.css"><!-- FONTAWESOME STYLE SHEET -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/feather.css"><!-- FEATHER ICON SHEET -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/owl.carousel.min.css"><!-- OWL CAROUSEL STYLE SHEET -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/magnific-popup.min.css"><!-- MAGNIFIC POPUP STYLE SHEET -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/lc_lightbox.css"><!-- Lc light box popup -->     
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap-select.min.css"><!-- BOOTSTRAP SLECT BOX STYLE SHEET  -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/dataTables.bootstrap5.min.css"><!-- DATA table STYLE SHEET  -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/select.bootstrap5.min.css"><!-- DASHBOARD select bootstrap  STYLE SHEET  -->     
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/dropzone.css"><!-- DROPZONE STYLE SHEET -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/scrollbar.css"><!-- CUSTOM SCROLL BAR STYLE SHEET -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/datepicker.css"><!-- DATEPICKER STYLE SHEET -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/flaticon.css"> <!-- Flaticon -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/swiper-bundle.min.css"><!-- Swiper Slider -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css"><!-- MAIN STYLE SHEET -->

    <!-- THEME COLOR CHANGE STYLE SHEET -->
    <link rel="stylesheet" class="skin" type="text/css" href="css/skins-type/skin-6.css">
       
        

 
</head>

<body>

    <!-- LOADING AREA START ===== -->
    <div class="loading-area">
        <div class="loading-box"></div>
        <div class="loading-pic">
            <div class="wrapper">
                <div class="cssload-loader"></div>
            </div>
        </div>
    </div>
    <!-- LOADING AREA  END ====== -->    

	<div class="page-wraper">
    
        <header id="header-admin-wrap" class="header-admin-fixed">
        
            <!-- Header Start -->
            <div id="header-admin">
                <div class="container">
                    
                    <!-- Left Side Content -->
                    <div class="header-left">
                        <div class="nav-btn-wrap">
                            <a class="nav-btn-admin" id="sidebarCollapse">
                                <span class="fa fa-angle-left"></span>
                            </a>                           
                        </div>
                    </div>
                    <!-- Left Side Content End -->
                    
                    <!-- Right Side Content -->
                    <div class="header-right">
                        <ul class="header-widget-wrap">
                            <!--Message-->
                            <li class="header-widget dashboard-message-dropdown">

                                <div class="dropdown">
                                    <a href="javascript:;" class="dropdown-toggle jobzilla-admin-messange" id="ID-MSG_dropdown" data-bs-toggle="dropdown">
                                        <i class="far fa-envelope"></i>
                                        <span class="notification-animate">4</span>
                                    </a>
                                    <div class="dropdown-menu" aria-labelledby="ID-MSG_dropdown">
                                        <div class="message-list dashboard-widget-scroll">
                                            <ul>
                                                <li class="clearfix">
                                                    <span class="msg-avtar">
                                                        <img src="images/user-avtar/pic1.jpg" alt="">
                                                    </span>
                                        
                                                    <div class="msg-texting">
                                                        <strong>Alexa Johnson</strong> 
                                                        <small class="msg-time">
                                                            <span class="far fa-clock p-r-5"></span>12 mins ago
                                                        </small>
                                                        <p>Lorem ipsum dolor sit amet, consectetur...</p>
                                                    </div>
                                                </li>
                                                <li class="clearfix">
                                                    <span class="msg-avtar">
                                                        <img src="images/user-avtar/pic2.jpg" alt="">
                                                    </span>
                                        
                                                    <div class="msg-texting">
                                                        <strong>Johan Smith</strong> 
                                                        <small class="msg-time">
                                                            <span class="far fa-clock p-r-5"></span>2 hours ago
                                                        </small>
                                                        <p>Lorem ipsum dolor sit amet, consectetur...</p>
                                                    </div>
                                                </li>
                                                <li class="clearfix">
                                                    <span class="msg-avtar">
                                                        <img src="images/user-avtar/pic3.jpg" alt="">
                                                    </span>
                                        
                                                    <div class="msg-texting">
                                                        <strong>Bobby Brown</strong> 
                                                        <small class="msg-time">
                                                            <span class="far fa-clock p-r-5"></span>3 hours ago
                                                        </small>
                                                        <p>Lorem ipsum dolor sit amet, consectetur...</p>
                                                    </div>
                                                </li>
                                                <li class="clearfix">
                                                    <span class="msg-avtar">
                                                        <img src="images/user-avtar/pic4.jpg" alt="">
                                                    </span>
                                        
                                                    <div class="msg-texting">
                                                        <strong>David Deo</strong> 
                                                        <small class="msg-time">
                                                            <span class="far fa-clock p-r-5"></span>4 hours ago
                                                        </small>
                                                        <p>Lorem ipsum dolor sit amet, consectetur...</p>
                                                    </div>
                                                </li>                                                                              
                                            </ul>
                                            <div class="message-view-all">
                                                <a href="javascript:;">View All</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </li>

                            <!--Notification-->
                            <li class="header-widget dashboard-noti-dropdown">

                                <div class="dropdown">
                                    <a  href="javascript:;" class="dropdown-toggle jobzilla-admin-notification" id="ID-NOTI_dropdown" data-bs-toggle="dropdown">
                                        <i class="far fa-bell"></i>
                                        <span class="notification-animate">8</span>
                                    </a>
                                    <div class="dropdown-menu" aria-labelledby="ID-NOTI_dropdown">
                                        <div class="dashboard-widgets-header">You have 7 notifications</div>
                                        <div class="noti-list dashboard-widget-scroll">
                                            <ul>
                                                    
                                                <li>
                                                    <a href="#">
                                                        <span class="noti-icon"><i class="far fa-bell"></i></span>
                                                        <span class="noti-texting">Devid applied for <b>Webdesigner.</b> </span> 
                                                    </a>
                                                </li>
                                                <li>
                                                    <a href="#">
                                                        <span class="noti-icon"><i class="far fa-bell"></i></span>
                                                        <span class="noti-texting">Nikol sent you a message. </span> 
                                                    </a>
                                                </li>
                                                <li>
                                                    <a href="#">
                                                        <span class="noti-icon"><i class="far fa-bell"></i></span>
                                                        <span class="noti-texting">lucy bookmarked your <b>SEO Expert</b> Job! </span> 
                                                    </a>
                                                </li>
                                                <li>
                                                    <a href="#">
                                                        <span class="noti-icon"><i class="far fa-bell"></i></span>
                                                        <span class="noti-texting">Your job for <b>teacher</b> has been approved! </span> 
                                                    </a>
                                                </li> 
                                                <li>
                                                    <a href="#">
                                                        <span class="noti-icon"><i class="far fa-bell"></i></span>
                                                        <span class="noti-texting">Thor applied for <b>Team Leader</b>. </span> 
                                                    </a>
                                                </li>
                                                                                                                                                                                                                                                                
                                            </ul>

                                            <div class="noti-view-all">
                                                    <a href="javascript:;">View All</a>
                                            </div>
                                            
                                        </div>
                                    </div>
                                </div>



                            </li>

                            <!--Account-->
                            <li class="header-widget">
								<div class="dashboard-user-section">
                                	<div class="listing-user">
                                        <div class="dropdown">
                                            <a href="javascript:;" class="dropdown-toggle" id="ID-ACCOUNT_dropdown" data-bs-toggle="dropdown">
                                                <div class="user-name text-black">
                                                    <span>
                                                        <img src="images/user-avtar/pic4.jpg" alt="">
                                                    </span>Nikola Tesla
                                                </div> 
                                            </a>
                                            <div class="dropdown-menu" aria-labelledby="ID-ACCOUNT_dropdown">
                                                  
                                                <ul>
                                                    <li><a href="dashboard.html"><i class="fa fa-home"></i>Dashboard</a></li>
                                                    <li><a href="dash-messages.html"><i class="fa fa-envelope"></i> Messages</a></li>
                                                    <li><a href="dash-my-profile.html"><i class="fa fa-user"></i> Profile</a></li>
                                                    <li><a href="index.html"><i class="fa fa-share-square"></i> Logout</a></li>
                                                </ul>
                                                    
                                                
                                            </div>
                                        </div>

                                    </div>                                
                               </div>
                            </li>

                        </ul>
                    </div>
                    <!-- Right Side Content End -->
        
                </div>
            </div>
            <!-- Header End -->
        
        </header>            
    	
        <!-- Sidebar Holder -->
        <nav id="sidebar-admin-wraper">
            <div class="page-logo">
                <a href="index.html"><img src="images/logo-dark.png" alt=""></a>
            </div>
            
            <div class="admin-nav scrollbar-macosx">
                <ul>
                    <li class="active">
                        <a href="dashboard.html"><i class="fa fa-home"></i><span class="admin-nav-text">Dashboard</span></a>
                    </li>

                    <li>
                        <a href="dash-company-profile.html"><i class="fa fa-user-tie"></i><span class="admin-nav-text">Company Profile</span></a>
                    </li>

                    <li>
                    	<a href="javascript:;"><i class="fa fa-suitcase"></i><span class="admin-nav-text">Jobs</span></a>
                        <ul class="sub-menu">
                        	<li> <a href="dash-post-job.html"><span class="admin-nav-text">Post a New Jobs</span></a></li>
                        	<li> <a href="dash-manage-jobs.html"><span class="admin-nav-text">Manage Jobs</span></a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="dash-candidates.html"><i class="fa fa-user-friends"></i><span class="admin-nav-text">Candidates</span></a>
                    </li>
                    <li>
                        <a href="dash-bookmark.html"><i class="fa fa-bookmark"></i><span class="admin-nav-text">Bookmark Resumes</span></a>
                    </li>

                    <li>
                        <a href="/admin/notice"><i class="fa fa-money-bill-alt"></i><span class="admin-nav-text">Packages</span></a>
                    </li>
                      
                    <li>
                    	<a href="javascript:;"><i class="fa fa-envelope"></i><span class="admin-nav-text">Messages <sup class="twm-msg-noti">5</sup></span></a>
                        <ul class="sub-menu">
                        	<li> <a href="dash-messages.html"><span class="admin-nav-text">MSG Style-1</span></a></li>
                        	<li> <a href="dash-messages_2.html"><span class="admin-nav-text">MSG Style-2</span></a></li>
                        </ul>
                    </li>

                    <li>
                        <a href="dash-resume-alert.html"><i class="fa fa-bell"></i><span class="admin-nav-text">Resume Alerts</span></a>
                    </li>  
                    
                    <li>
                        <a href="dash-my-profile.html"><i class="fa fa-user"></i><span class="admin-nav-text">My Profile</span></a>
                    </li>

                    <li>
                        <a href="dash-change-password.html"><i class="fa fa-fingerprint"></i><span class="admin-nav-text">Change Password</span></a>
                    </li>
                    
                    <li>
                        <a href="javascript:;" data-bs-toggle="modal" data-bs-target="#delete-dash-profile"><i class="fa fa-trash-alt"></i><span class="admin-nav-text">Delete Profile</span></a>
                    </li>  
                                       
                    <li>
                        <a href="javascript:;" data-bs-toggle="modal" data-bs-target="#logout-dash-profile"><i class="fa fa-share-square"></i><span class="admin-nav-text">Logout</span></a>
                    </li>                    
                    
                </ul>
            </div>   
        </nav>

        <!-- Page Content Holder -->
        <div id="content">

            <div class="content-admin-main">

                <div class="wt-admin-right-page-header clearfix">
                    <h2>Hello, Nikola Tesla</h2>
                    <div class="breadcrumbs"><a href="#">Home</a><span>Dasboard</span></div>
                </div>

                <div class="twm-dash-b-blocks mb-5">
                    <div class="row">
                        <div class="col-xl-3 col-lg-6 col-md-12 mb-3">
                            <div class="panel panel-default">
                                <div class="panel-body wt-panel-body gradi-1 dashboard-card ">
                                    <div class="wt-card-wrap">
                                        <div class="wt-card-icon"><i class="far fa-address-book"></i></div>
                                        <div class="wt-card-right wt-total-active-listing counter ">25</div>
                                        <div class="wt-card-bottom ">
                                            <h4 class="m-b0">Posted Jobs</h4>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-3 col-lg-6 col-md-12 mb-3">
                            <div class="panel panel-default">
                                <div class="panel-body wt-panel-body gradi-2 dashboard-card ">
                                    <div class="wt-card-wrap">
                                        <div class="wt-card-icon"><i class="far fa-file-alt"></i></div>
                                        <div class="wt-card-right  wt-total-listing-view counter ">435</div>
                                        <div class="wt-card-bottom">
                                            <h4 class="m-b0">Total Applications</h4> 
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-3 col-lg-6 col-md-12 mb-3">
                            <div class="panel panel-default">
                                <div class="panel-body wt-panel-body gradi-3 dashboard-card ">
                                    <div class="wt-card-wrap">
                                        <div class="wt-card-icon"><i class="far fa-envelope"></i></div>
                                        <div class="wt-card-right wt-total-listing-review counter ">28</div>
                                        <div class="wt-card-bottom">
                                            <h4 class="m-b0">Messages</h4>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-3 col-lg-6 col-md-12 mb-3">
                            <div class="panel panel-default">
                                <div class="panel-body wt-panel-body gradi-4 dashboard-card ">
                                    <div class="wt-card-wrap">
                                        <div class="wt-card-icon"><i class="far fa-bell"></i></div>
                                        <div class="wt-card-right wt-total-listing-bookmarked counter ">18</div>
                                        <div class="wt-card-bottom">
                                            <h4 class="m-b0">Notifications</h4>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>  
                </div>

                <div class="twm-pro-view-chart-wrap">
                    <div class="row">
                        <div class="col-xl-6 col-lg-12 col-md-12 mb-4">
                            <div class="panel panel-default site-bg-white">
                                <div class="panel-heading wt-panel-heading p-a20">
                                    <h4 class="panel-tittle m-a0"><i class="far fa-chart-bar"></i>Your Profile Views</h4>
                                </div>
                                <div class="panel-body wt-panel-body twm-pro-view-chart">
                                    <canvas id="profileViewChart"></canvas>
                                </div>
                            </div>
                        
                        </div>
                        

                        <div class="col-xl-6 col-lg-12 col-md-12 mb-4">
                            <div class="panel panel-default">
                                <div class="panel-heading wt-panel-heading p-a20">
                                    <h4 class="panel-tittle m-a0">Inbox</h4>
                                </div>
                                <div class="panel-body wt-panel-body bg-white">
                                    <div class="dashboard-messages-box-scroll scrollbar-macosx">
                                    
                                        <div class="dashboard-messages-box">
                                            <div class="dashboard-message-avtar"><img src="images/user-avtar/pic1.jpg" alt=""></div>
                                            <div class="dashboard-message-area">
                                                <h5>Lucy Smith<span>18 June 2023</span></h5>
                                                <p>Bring to the table win-win survival strategies to ensure proactive domination. at the end of the day, going forward, a new normal that has evolved from generation.</p>
                                            </div>
                                        </div>                    
                                
                                        <div class="dashboard-messages-box">
                                            <div class="dashboard-message-avtar"><img src="images/user-avtar/pic3.jpg" alt=""></div>
                                            <div class="dashboard-message-area">
                                                <h5>Richred paul<span>19 June 2023</span></h5>
                                                <p>Bring to the table win-win survival strategies to ensure proactive domination. at the end of the day, going forward, a new normal that has evolved from generation.</p>
                                            </div>
                                        </div>
                                        
                                        <div class="dashboard-messages-box">
                                            <div class="dashboard-message-avtar"><img src="images/user-avtar/pic4.jpg" alt=""></div>
                                            <div class="dashboard-message-area">
                                                <h5>Jon Doe<span>20 June 2023</span></h5>
                                                <p>Bring to the table win-win survival strategies to ensure proactive domination. at the end of the day, going forward, a new normal that has evolved from generation.</p>
                                            </div>
                                        </div>
                                        
                                        <div class="dashboard-messages-box">
                                            <div class="dashboard-message-avtar"><img src="images/user-avtar/pic1.jpg" alt=""></div>
                                            <div class="dashboard-message-area">
                                                <h5>Thomas Smith<span>22 June 2023</span></h5>
                                                <p>Bring to the table win-win survival strategies to ensure proactive domination. at the end of the day, going forward, a new normal that has evolved from generation. </p>
                                            </div>
                                        </div>
                                    </div>                        
                                                     
                                </div>
                            </div>

                        </div>

                        <div class="col-lg-12 col-md-12 mb-4">
                            <div class="panel panel-default site-bg-white m-t30">
                                <div class="panel-heading wt-panel-heading p-a20">
                                    <h4 class="panel-tittle m-a0"><i class="far fa-list-alt"></i>Recent Activities</h4>
                                </div>
                                <div class="panel-body wt-panel-body">
                                    
                                    <div class="dashboard-list-box list-box-with-icon">
                                        <ul>
                                            <li>
                                                <i class="fa fa-envelope text-success list-box-icon"></i>Nikol Tesla has sent you <a href="#" class="text-success">private message!</a>
                                                <a href="#" class="close-list-item color-lebel clr-red">
                                                    <i class="far fa-trash-alt"></i>
                                                </a>
                                            </li>
                                            <li>
                                                <i class="fa fa-suitcase text-primary list-box-icon"></i>Your job for  
                                                <a href="#" class="text-primary">Web Designer</a>
                                                has been approved!
                                                <a href="#" class="close-list-item color-lebel clr-red">
                                                    <i class="far fa-trash-alt"></i>
                                                </a>
                                            </li>
                                                
                                            <li>
                                                <i class="fa fa-bookmark text-warning list-box-icon"></i>
                                                Someone bookmarked your
                                                <a href="#" class="text-warning">SEO Expert</a> 
                                                Job listing! 
                                                <a href="#" class="close-list-item color-lebel clr-red">
                                                    <i class="far fa-trash-alt"></i>
                                                </a>
                                            </li>
                                            <li>
                                                <i class="fa fa-tasks text-info list-box-icon"></i>
                                                Your job listing Core
                                                <a href="#" class="text-info">PHP Developer</a> for Site Maintenance is expiring! 
                                                <a href="#" class="close-list-item color-lebel clr-red">
                                                    <i class="far fa-trash-alt"></i>
                                                </a>
                                            </li>
                                            <li>
                                                <i class="fa fa-paperclip text-success list-box-icon"></i>
                                                You have new application for
                                                <a href="#" class="text-success"> UI/UX Developer & Designer! </a>
                                                <a href="#" class="close-list-item color-lebel clr-red">
                                                    <i class="far fa-trash-alt"></i>
                                                </a>
                                            </li>
                                            <li>
                                                <i class="fa fa-suitcase text-danger list-box-icon"></i>
                                                Your Magento Developer job expire  
                                                <a href="#" class="text-danger">Renew</a>  now it.
                                                <a href="#" class="close-list-item color-lebel clr-red">
                                                    <i class="far fa-trash-alt"></i>
                                                </a>
                                            </li>
                                            <li>
                                                <i class="fa fa-star site-text-orange list-box-icon"></i> 
                                                David cope left a 
                                                <a href="#" class="site-text-orange"> review 4.5</a> for Real Estate Logo
                                                <a href="#" class="close-list-item color-lebel clr-red">
                                                    <i class="far fa-trash-alt"></i>
                                                </a>
                                            </li>
                                        </ul>
                                    
                                    </div>
                                                
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-12 col-md-12 mb-4">
                            <div class="panel panel-default">
                                <div class="panel-heading wt-panel-heading p-a20">
                                    <h4 class="panel-tittle m-a0">Recent Applicants</h4>
                                </div>
                                <div class="panel-body wt-panel-body bg-white">
                                    <div class="twm-dashboard-candidates-wrap">
                                        <div class="row">

                                            <div class="col-xl-6 col-lg-12 col-md-12">
                                                 <div class="twm-dash-candidates-list">
                                                     <div class="twm-media">
                                                         <div class="twm-media-pic">
                                                            <img src="images/candidates/pic1.jpg" alt="#">
                                                         </div>
                                                         
                                                     </div>
                                                     <div class="twm-mid-content">
                                                         <a href="#" class="twm-job-title">
                                                             <h4>Wanda Montgomery </h4>
                                                         </a>
                                                         <p>Charted Accountant</p>
                                                         
                                                         <div class="twm-fot-content">
                                                             <div class="twm-left-info">
                                                                <p class="twm-candidate-address"><i class="feather-map-pin"></i>New York</p>
                                                                <div class="twm-jobs-vacancies">$20<span>/ Day</span></div>
                                                             </div>
                                                             <div class="twm-right-btn">

                                                                <ul class="twm-controls-icon list-unstyled">
                                                                    <li>
                                                                        <button title="View profile" data-bs-toggle="tooltip" data-bs-placement="top">
                                                                            <span class="fa fa-eye"></span>
                                                                        </button>
                                                                    </li>
                                                                    <li>
                                                                        <button title="Send message" data-bs-toggle="tooltip" data-bs-placement="top">
                                                                            <span class="far fa-envelope-open"></span>
                                                                        </button>
                                                                    </li>
                                                                    <li>
                                                                        <button title="Delete" data-bs-toggle="tooltip" data-bs-placement="top">
                                                                            <span class="far fa-trash-alt"></span>
                                                                        </button>
                                                                    </li>
                                                                </ul>

                                                             </div>
                                                        </div>
                                                     </div>
                                                     
                                                 </div>
                                            </div>
        
                                            <div class="col-xl-6 col-lg-12 col-md-12">
                                                <div class="twm-dash-candidates-list">
                                                    <div class="twm-media">
                                                        <div class="twm-media-pic">
                                                           <img src="images/candidates/pic2.jpg" alt="#">
                                                        </div>
                                                        
                                                    </div>
                                                    <div class="twm-mid-content">
                                                        <a href="#" class="twm-job-title">
                                                            <h4>Peter Hawkins</h4>
                                                        </a>
                                                        <p>Medical Professed</p>
                                                        
                                                        <div class="twm-fot-content">
                                                            <div class="twm-left-info">
                                                               <p class="twm-candidate-address"><i class="feather-map-pin"></i>New York</p>
                                                               <div class="twm-jobs-vacancies">$7<span>/ Hour</span></div>
                                                            </div>
                                                            <div class="twm-right-btn">

                                                                <ul class="twm-controls-icon list-unstyled">
                                                                    <li>
                                                                        <button title="View profile" data-bs-toggle="tooltip" data-bs-placement="top">
                                                                            <span class="fa fa-eye"></span>
                                                                        </button>
                                                                    </li>
                                                                    <li>
                                                                        <button title="Send message" data-bs-toggle="tooltip" data-bs-placement="top">
                                                                            <span class="far fa-envelope-open"></span>
                                                                        </button>
                                                                    </li>
                                                                    <li>
                                                                        <button title="Delete" data-bs-toggle="tooltip" data-bs-placement="top">
                                                                            <span class="far fa-trash-alt"></span>
                                                                        </button>
                                                                    </li>
                                                                </ul>

                                                            </div>
                                                       </div>
                                                    </div>
                                                    
                                                </div>
                                            </div>
        
                                            <div class="col-xl-6 col-lg-12 col-md-12">
                                                <div class="twm-dash-candidates-list">
                                                    <div class="twm-media">
                                                        <div class="twm-media-pic">
                                                           <img src="images/candidates/pic3.jpg" alt="#">
                                                        </div>
                                                        
                                                    </div>
                                                    <div class="twm-mid-content">
                                                        <a href="#" class="twm-job-title">
                                                            <h4>Ralph Johnson  </h4>
                                                        </a>
                                                        <p>Bank Manger</p>
                                                        
                                                        <div class="twm-fot-content">
                                                            <div class="twm-left-info">
                                                               <p class="twm-candidate-address"><i class="feather-map-pin"></i>New York</p>
                                                               <div class="twm-jobs-vacancies">$180<span>/ Day</span></div>
                                                            </div>
                                                            <div class="twm-right-btn">
                                                                <ul class="twm-controls-icon list-unstyled">
                                                                    <li>
                                                                        <button title="View profile" data-bs-toggle="tooltip" data-bs-placement="top">
                                                                            <span class="fa fa-eye"></span>
                                                                        </button>
                                                                    </li>
                                                                    <li>
                                                                        <button title="Send message" data-bs-toggle="tooltip" data-bs-placement="top">
                                                                            <span class="far fa-envelope-open"></span>
                                                                        </button>
                                                                    </li>
                                                                    <li>
                                                                        <button title="Delete" data-bs-toggle="tooltip" data-bs-placement="top">
                                                                            <span class="far fa-trash-alt"></span>
                                                                        </button>
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                       </div>
                                                    </div>
                                                    
                                                </div>
                                            </div>
        
                                            <div class="col-xl-6 col-lg-12 col-md-12">
                                                <div class="twm-dash-candidates-list">
                                                    <div class="twm-media">
                                                        <div class="twm-media-pic">
                                                           <img src="images/candidates/pic4.jpg" alt="#">
                                                        </div>
                                                        
                                                    </div>
                                                    <div class="twm-mid-content">
                                                        <a href="#" class="twm-job-title">
                                                            <h4>Randall Henderson </h4>
                                                        </a>
                                                        <p>IT Contractor</p>
                                                        
                                                        <div class="twm-fot-content">
                                                            <div class="twm-left-info">
                                                               <p class="twm-candidate-address"><i class="feather-map-pin"></i>New York</p>
                                                               <div class="twm-jobs-vacancies">$90<span>/ Week</span></div>
                                                            </div>
                                                            <div class="twm-right-btn">
                                                                <ul class="twm-controls-icon list-unstyled">
                                                                    <li>
                                                                        <button title="View profile" data-bs-toggle="tooltip" data-bs-placement="top">
                                                                            <span class="fa fa-eye"></span>
                                                                        </button>
                                                                    </li>
                                                                    <li>
                                                                        <button title="Send message" data-bs-toggle="tooltip" data-bs-placement="top">
                                                                            <span class="far fa-envelope-open"></span>
                                                                        </button>
                                                                    </li>
                                                                    <li>
                                                                        <button title="Delete" data-bs-toggle="tooltip" data-bs-placement="top">
                                                                            <span class="far fa-trash-alt"></span>
                                                                        </button>
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                       </div>
                                                    </div>
                                                    
                                                </div>
                                            </div>
        
                                            <div class="col-xl-6 col-lg-12 col-md-12">
                                                <div class="twm-dash-candidates-list">
                                                    <div class="twm-media">
                                                        <div class="twm-media-pic">
                                                           <img src="images/candidates/pic6.jpg" alt="#">
                                                        </div>
                                                        
                                                    </div>
                                                    <div class="twm-mid-content">
                                                        <a href="#" class="twm-job-title">
                                                            <h4>Christina Fischer </h4>
                                                        </a>
                                                        <p>Charity &amp; Voluntary</p>
                                                        
                                                        <div class="twm-fot-content">
                                                            <div class="twm-left-info">
                                                               <p class="twm-candidate-address"><i class="feather-map-pin"></i>New York</p>
                                                               <div class="twm-jobs-vacancies">$19<span>/ Hour</span></div>
                                                            </div>
                                                            <div class="twm-right-btn">
                                                                <ul class="twm-controls-icon list-unstyled">
                                                                    <li>
                                                                        <button title="View profile" data-bs-toggle="tooltip" data-bs-placement="top">
                                                                            <span class="fa fa-eye"></span>
                                                                        </button>
                                                                    </li>
                                                                    <li>
                                                                        <button title="Send message" data-bs-toggle="tooltip" data-bs-placement="top">
                                                                            <span class="far fa-envelope-open"></span>
                                                                        </button>
                                                                    </li>
                                                                    <li>
                                                                        <button title="Delete" data-bs-toggle="tooltip" data-bs-placement="top">
                                                                            <span class="far fa-trash-alt"></span>
                                                                        </button>
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                       </div>
                                                    </div>
                                                    
                                                </div>
                                            </div>

                                           
                                        </div>
                                    </div>              
                                </div>
                            </div>

                        </div>

                    </div>
                </div>
                                                      
            </div>

    	</div>

        <!--Delete Profile Popup-->
        <div class="modal fade twm-model-popup" id="delete-dash-profile" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"  aria-hidden="true">
            <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <h4 class="modal-title">Do you want to delete your profile?</h4>
                </div>
                <div class="modal-footer">
                    <button type="button" class="site-button" data-bs-dismiss="modal">No</button>
                    <button type="button" class="site-button outline-primary">Yes</button>
                </div>
            </div>
            </div>
        </div>


        <!--Logout Profile Popup-->
        <div class="modal fade twm-model-popup" id="logout-dash-profile" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-hidden="true">
            <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <h4 class="modal-title">Do you want to Logout your profile?</h4>
                </div>
                <div class="modal-footer">
                    <button type="button" class="site-button" data-bs-dismiss="modal">No</button>
                    <button type="button" class="site-button outline-primary">Yes</button>
                </div>
            </div>
            </div>
        </div>
          

	</div>


<!-- JAVASCRIPT  FILES ========================================= --> 
<script  src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script><!-- JQUERY.MIN JS -->
<script  src="${pageContext.request.contextPath}/js/popper.min.js"></script><!-- POPPER.MIN JS -->
<script  src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script><!-- BOOTSTRAP.MIN JS -->
<script  src="${pageContext.request.contextPath}/js/magnific-popup.min.js"></script><!-- MAGNIFIC-POPUP JS -->
<script  src="${pageContext.request.contextPath}/js/waypoints.min.js"></script><!-- WAYPOINTS JS -->
<script  src="${pageContext.request.contextPath}/js/counterup.min.js"></script><!-- COUNTERUP JS -->
<script  src="${pageContext.request.contextPath}/js/waypoints-sticky.min.js"></script><!-- STICKY HEADER -->
<script  src="${pageContext.request.contextPath}/js/isotope.pkgd.min.js"></script><!-- MASONRY  -->
<script  src="${pageContext.request.contextPath}/js/imagesloaded.pkgd.min.js"></script><!-- MASONRY  -->
<script  src="${pageContext.request.contextPath}/js/owl.carousel.min.js"></script><!-- OWL  SLIDER  -->
<script  src="${pageContext.request.contextPath}/js/theia-sticky-sidebar.js"></script><!-- STICKY SIDEBAR  -->
<script  src="${pageContext.request.contextPath}/js/lc_lightbox.lite.js" ></script><!-- IMAGE POPUP -->
<script  src="${pageContext.request.contextPath}/js/bootstrap-select.min.js"></script><!-- Form js -->
<script  src="${pageContext.request.contextPath}/js/dropzone.js"></script><!-- IMAGE UPLOAD  -->
<script  src="${pageContext.request.contextPath}/js/jquery.scrollbar.js"></script><!-- scroller -->
<script  src="${pageContext.request.contextPath}/js/bootstrap-datepicker.js"></script><!-- scroller -->
<script  src="${pageContext.request.contextPath}/js/jquery.dataTables.min.js"></script><!-- Datatable -->
<script  src="${pageContext.request.contextPath}/js/dataTables.bootstrap5.min.js"></script><!-- Datatable -->
<script  src="${pageContext.request.contextPath}/js/chart.js"></script><!-- Chart -->
<script  src="${pageContext.request.contextPath}/js/bootstrap-slider.min.js"></script><!-- Price range slider -->
<script  src="${pageContext.request.contextPath}/js/swiper-bundle.min.js"></script><!-- Swiper JS -->
<script  src="${pageContext.request.contextPath}/js/custom.js"></script><!-- CUSTOM FUCTIONS  -->









</body>

</html>
    