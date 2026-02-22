<%@ page import="java.io.*" %>
<%
    if (session.getAttribute("studentId") == null) {
        response.sendRedirect("Login.jsp");
        return;
    }
%>

<html>
   
<head>
<title>Home Page</title>
<style>
body {
    margin: 0;
    font-family: Arial, sans-serif;
}

/* NAVBAR */
.navbar {
    background-color: #6f63ff;   /* purple */
    height: 60px;
    width: 100%;
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 0 40px;
    box-sizing: border-box;
    position: relative;
    z-index: 2000;
}

/* LOGO */
.logo {
    color: white;
    font-size: 26px;
    font-weight: bold;
}

/* LINKS */
.nav-links a {
    color: white;
    text-decoration: none;
    margin: 0 15px;
    font-size: 16px;
}

/* LOGIN DROPDOWN */
.dropdown {
    position: relative;
    display: inline-block;
}

.dropdown > a {
    cursor: pointer;
}

/* Hidden menu */
.dropdown-content {
    display: none;
    position: absolute;
    background-color: white;
    min-width: 180px;
    top: 100%;       /* instead of 45px */
    right: 0;
    border-radius: 6px;
    box-shadow: 0 8px 20px rgba(0,0,0,0.15);
    z-index: 9999;
}


/* Links inside dropdown */
.dropdown-content a {
    color: #333;
    padding: 12px 16px;
    display: block;
    text-decoration: none;
    font-size: 14px;
}

.dropdown-content a:hover {
    background-color: #f1f1f1;
}

/* Show dropdown on hover */
.dropdown:hover .dropdown-content {
    display: block;
}
.dropdown > a {
    cursor: pointer;
    padding: 20px 15px;   /* hover area bada ho jayega */
    display: inline-block;
}


/* CENTER CONTENT */
.main {
    height: calc(100vh - 60px);
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    background-image: url("images/bg.png");
    background-size: cover;
    background-position: center;
    background-repeat: no-repeat;
    text-align: center;
}

.main h1 {
    font-size: 48px;
    color: white;
    margin-bottom: 15px;
}

.main p {
    font-size: 18px;
    margin: 15px 0 30px;
    color: white;
}

/* BUTTON */
.btn {
    background-color: yellow;
    color: black;
    padding: 12px 30px;
    text-decoration: none;
    border-radius: 30px;
    font-size: 18px;
    margin-top: 15px;
}

/* NEW SAATHI SECTION
.saathi-section {
    margin-top: 50px;
    text-align: center;
    color: white;
}

.saathi-section h2 {
    font-size: 36px;
    margin-bottom: 15px;
}

.saathi-section p {
    font-size: 20px;
    margin-bottom: 25px;
}

.saathi-section .saathi-btn {
    background-color: #ffcc00;
    color: black;
    padding: 14px 35px;
    font-size: 18px;
    border-radius: 30px;
    text-decoration: none;
    font-weight: bold;
    transition: 0.3s;
}

.saathi-section .saathi-btn:hover {
    background-color: #e6b800;
} */
.dashboard-bg {
    min-height: 100vh;
    background:
       
       url("https://images.unsplash.com/photo-1758273241078-8eec353836be?q=80&w=1331&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D");
    background-size: cover;
    background-position: center;
}
/* Testimonials Section */

.testimonial-subtitle {
    color: #0d6efd;   /* strong blue */
    font-weight: 600;
    letter-spacing: 1.5px;
    font-size: 14px;
}

.testimonial-title {
    color: #1f2937;   /* dark gray */
    font-size: 36px;
    font-weight: 700;
    margin: 10px 0;
}

.testimonial-desc {
    color: #4b5563;   /* readable gray */
    max-width: 750px;
    margin: 0 auto;
    font-size: 16px;
    line-height: 1.7;
    text-align: center;
}

.testimonial-line {
    width: 80px;
    height: 3px;
    background: #0d6efd;
    margin: 25px auto 0;
}
.testimonials-section {
    width: 100%;
    padding: 50px 20px;
    text-align: center;

    /* VISIBILITY FIX */
   
    backdrop-filter: blur(4px);
    background: rgba(255, 255, 255, 0.88);
    border-top: 1px solid #e0e0e0;
}
.footer-desc{
    max-width: 100vw;
    margin: 0 auto;
    font-size: 16px;
    line-height: 1.7;
    text-align: center;
    background: #6f63ff;
    color: white;
    display: flex;
    justify-content: center;   /* Horizontal centering of flex items */
}

</style>
</head>

<body>
<!-- NAVBAR -->
<div class="navbar">
    <div class="logo">ManSparsh</div>

    <div class="nav-links">
        <a href="Home Page.jsp">Home</a>
        <a href="AboutUs.jsp">About Us</a>
        <a href="Features.jsp">Features</a>
        <div class="dropdown">
        <a>Login</a>
        <div class="dropdown-content">
            <a href="StudentLogin.jsp">Student</a>
            <a href="CounselorLogin.jsp">Counselor</a>
            <a href="FacultyLogin.jsp">Faculty</a>
        </div>
        </div>
        <a href="ContactUs.jsp">Contact Us</a>
    </div>
</div>
<div class="dashboard-bg">
<!-- MAIN CONTENT -->
<div class="main">
    <h1>Welcome to ManSparsh</h1>
    <p>A safe space to talk, heal, and feel understood.<br> Because your mental health matters- every single day.</p>

    <!-- NEW SAATHI SECTION
    <div class="saathi-section">
        <h2>Meet Saathi: Your AI Therapist</h2>
        <p>Available 24/7 to support you</p>
        <a href="index.jsp" class="saathi-btn">START CHAT WITH SAATHI</a>
    </div> -->
</div>
</div>
               <!-- TESTIMONIALS SECTION -->
<div class="testimonials-section">
    <p class="testimonial-subtitle">EMPOWERING COMMUNITY</p>
 <p class="testimonial-desc">
            "It's when we start working together that the real healing takes place."
        </p>
         <div class="testimonial-line"></div>
</div>
<footer class="footer-desc">
             © 2026 ManSparsh Online Counseling &amp; Therapy. All rights reserved.
         </footer>

</body>
</html>