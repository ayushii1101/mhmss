<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>Counselor Contact Us</title>
<style>

        body{
            margin:0;
            font-family:Arial, sans-serif;
            background:#ffffff;

            display:flex;
            flex-direction:column;
            min-height:100vh;   /* full screen height */
        }

        .navbar{
            background:#6f63ff; height:60px; display:flex;
            align-items:center; justify-content:space-between;
            padding:0 40px; color:white; position:relative;
        }

        .logo{ font-size:26px; font-weight:bold; }
        .nav-right{ display:flex; align-items:center; gap:20px; }

        .nav-links a{
            color:white; text-decoration:none; margin:0 12px; font-size:16px;
        }

        .student-mini{
            display:flex; align-items:center; gap:8px;
            background:rgba(255,255,255,0.2); padding:5px 12px;
            border-radius:20px; cursor:pointer; position:relative;
        }

        .student-mini img{ width:30px; height:30px; border-radius:50%; }

        .profile-dropdown{
            display:none; position:absolute; top:45px; right:0;
            background:white; min-width:200px; border-radius:12px;
            box-shadow:0 12px 30px rgba(0,0,0,0.25); overflow:hidden; z-index:1000;
        }

        .profile-dropdown a{
            display:block; padding:12px 18px; text-decoration:none;
            color:#333; font-size:15px;
        }

        .profile-dropdown a:hover{ background:#f1f5f9; }
        /* PURE CSS DROPDOWN - No JavaScript */
        .profile-section {
            position: relative;
            cursor: pointer;
        }

        .faculty-mini {
            display: flex;
            align-items: center;
            gap: 10px;
            background: rgba(255,255,255,0.2);
            padding: 8px 16px;
            border-radius: 25px;
            transition: all 0.3s;
        }

        .faculty-mini:hover {
            background: rgba(255,255,255,0.3);
        }

        /* CSS-ONLY CHECKBOX HACK */
        .profile-dropdown {
            display: none;
            position: absolute;
            top: 100%; right: 0;
            margin-top: 8px;
            min-width: 220px;
            background: white;
            border-radius: 16px;
            box-shadow: 0 16px 40px rgba(0,0,0,0.2);
            border: 1px solid #f1f5f9;
            overflow: hidden;
            z-index: 1000;
            opacity: 0;
            transform: translateY(-8px);
            transition: all 0.25s ease-out;
        }

        /* SHOW ON HOVER */


        /* HOVER OUT DELAY (Smooth) */
        .profile-section {
            --close-delay: 0.2s;
        }

        .profile-dropdown a {
            display: block;
            padding: 16px 20px;
            color: #475569;
            text-decoration: none;
            font-weight: 500;
            font-size: 15px;
            border-bottom: 1px solid #f8fafc;
            transition: all 0.2s;
        }

        .profile-dropdown a:last-child { border-bottom: none; }

        .profile-dropdown a:hover {
            background: linear-gradient(90deg, #f8fafc, #f1f5f9);
            color: #6f63ff;
            padding-left: 28px;
        }
        /* MAGIC: SHOW WHEN CHECKBOX CHECKED */
        .profile-section #profileToggle:checked ~ .profile-dropdown {
            display: block;
            opacity: 1;
            transform: translateY(0);
        }
        .toggle-checkbox {
            position: absolute;
            opacity: 0;
            width: 0;
            height: 0;
        }

        /* RESPONSIVE */
        @media (max-width: 768px) {
            .profile-dropdown {
                right: auto;
                left: 0;
                min-width: 200px;
            }
        }

/* Contact Header */
.contact-header {
    text-align: center;
    padding: 60px 20px 20px 20px;
}
.contact-header h1 {
    font-size: 42px;
    margin-bottom: 15px;
}
.contact-header h2 {
    font-size: 22px;
    font-weight: bold;
    margin-bottom: 20px;
}
.contact-header p {
    max-width: 700px;
    margin: 10px auto;
    font-size: 18px;
    line-height: 1.6;
    color: #000; /* plain black text */
}

/* Contact Card */
.contact-container {
    background: #000; /* black card for contact details */
    color: #fff;
    max-width: 800px;
    margin: 40px auto;
    padding: 30px 40px;
    border-radius: 15px;
    box-shadow: 0 8px 20px rgba(0,0,0,0.3);
}

/* Contact Items */
.contact-item {
    display: flex;
    align-items: center;
    margin-bottom: 18px;
    font-size: 18px;
}
.contact-item span {
    font-weight: bold;
    color: #6f63ff;
    margin-left: 10px;
}

/* Privacy Line */
.privacy-line {
    text-align: center;
    margin-top: 25px;
    font-size: 16px;
    font-style: italic;
    color: #ddd;
}

/* Icons */
.icon {
    font-size: 22px;
    width: 30px;
}

/* Responsive */
@media(max-width:600px){
    .contact-header h1 { font-size: 32px; }
    .contact-header h2 { font-size: 18px; }
    .contact-header p { font-size: 16px; }
    .contact-container { margin: 20px; padding: 20px; }
    .contact-item { font-size: 16px; }
}
.page-content{
    flex:1;
}


.footer-desc{
    width: 100%;
    background: #6f63ff;
    color: white;
    text-align: center;
    padding: 6px 0;   /* was 16px → now thin */
    font-size: 14px; /* slightly smaller text */
    line-height: 1.4;
}


</style>

<!-- Font Awesome CDN for icons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />

</head>
<body>

<!-- NAVBAR -->
<div class="navbar">
    <div class="logo">ManSparsh</div>

    <div class="nav-right">
        <div class="nav-links">
            <a href="CounselorDashboard.jsp">Home</a>
            <a href="CounselorAboutUs.jsp">About Us</a>
            <a href="CounselorFeatures.jsp#">Features</a>
            <a href="CounselorContactUs.jsp">Contact</a>
        </div>

    <div class="profile-section">
        <input type="checkbox" id="profileToggle" class="toggle-checkbox">
        <label for="profileToggle" class="student-mini">
            <img src="https://cdn-icons-png.flaticon.com/512/3135/3135715.png" alt="Profile">
            <span><%= session.getAttribute("counselorName") != null ? session.getAttribute("counselorName") : "Peer Counselor" %></span>
        </label>
        <div class="profile-dropdown" id="profileDropdown">
            <a href="<%= request.getContextPath() %>/editProfile.jsp">Edit Profile</a>
            <a href="<%= request.getContextPath() %>/help.jsp">Help</a>
            <a href="<%= request.getContextPath() %>/feedback.jsp">Send Feedback</a>
            <a href="<%= request.getContextPath() %>/homepage.jsp">Logout</a>
        </div>
    </div>


    </div>
</div>
        
<div class="page-content">
    <!-- CONTACT HEADER -->
    <div class="contact-header">
        <h1>Contact Us</h1>
        <h2>We’re here to help - reach out to ManSparsh anytime.</h2>

        <div class="intro-text">
            <p>Whether you have a question, need guidance, or want to know more about our support services, we’re just one message away.</p>
        </div>
    </div>

    <!-- CONTACT DETAILS -->
    <div class="contact-container">
        <div class="contact-item">
            <i class="fas fa-phone icon"></i>
            <span>Call Us:</span>
            <a href="tel:+919XXXXXXXXX" style="color:#fff; text-decoration:none;">+91 9696276585</a>
        </div>
        <div class="contact-item">
            <i class="fas fa-envelope icon"></i>
            <span>Email Us:</span>
            <a href="https://mail.google.com/mail/?view=cm&fs=1&to=mansparshotp@gmail.com"
       target="_blank"
       style="color:#fff; text-decoration:none;">mansparshhelp@gmail.com</a>
        </div>

        <div class="privacy-line">
            Your privacy matters. All conversations and queries are kept strictly confidential.
        </div>
    </div>
</div>   <!-- END page-content -->

<footer class="footer-desc">
             © 2026 ManSparsh Online Counseling &amp; Therapy. All rights reserved.
         </footer>
</body>
</html>