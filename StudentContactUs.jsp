<%@ page contentType="text/html; charset=UTF-8" %>
<%
String studentName = (String) session.getAttribute("studentName");
if(studentName == null){
    response.sendRedirect("StudentLogin.jsp");
    return;
}
%>

<!DOCTYPE html>
<html>
<head>
<title>Contact Us – ManSparsh</title>
<style>
/* Reset & body */
body {
    margin: 0;
    font-family: Arial, sans-serif;
    background-color: #f5f5f5; /* simple light background */
    color: #000; /* default text black */
    
    min-height: 100vh;          /* full screen height */
    display: flex;
    flex-direction: column;
}

/* NAVBAR */
.navbar {
    background-color: #6f63ff;
    height: 60px;
    width: 100%;
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 0 40px;
    box-sizing: border-box;
    box-shadow: 0 2px 6px rgba(0,0,0,0.2);
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
.nav-links a:hover {
    text-decoration: underline;
}
.nav-right{display:flex;align-items:center;gap:20px;}
.student-mini{display:flex;align-items:center;gap:8px;background:rgba(255,255,255,0.2);padding:5px 12px;border-radius:20px;cursor:pointer;position:relative;}
.student-mini span{ color: white; font-weight: 500; }
.student-mini img{width:30px;height:30px;border-radius:50%;}
.profile-dropdown{display:none;position:absolute;top:45px;right:0;background:white;min-width:180px;border-radius:12px;box-shadow:0 12px 25px rgba(0,0,0,0.25);overflow:hidden;z-index:999;}
.profile-dropdown a{display:block;padding:12px 16px;text-decoration:none;color:#333;font-size:14px;}
.profile-dropdown a:hover{background:#f1f5f9;}

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
.footer-desc {
    margin-top: auto;
    width: 100%;
    text-align: center;
    background: #6f63ff;
    color: white;

    font-size: 16px;        /* smaller text */
    line-height: 0.9;      /* thinner vertical height */
    padding: 8px 0;        /* less padding = thinner bar */
}
</style>

<!-- Font Awesome CDN for icons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />

</head>
<body>

<div class="navbar">
  <div class="logo">ManSparsh</div>
    <div class="nav-right">
    <div class="nav-links">
      <a href="StudentDashboard.jsp">Home</a>
      <a href="StudentAboutUs.jsp">About Us</a>
      <a href="StudentFeatures.jsp">Features</a>
      <a href="StudentContactUs.jsp">Contact Us</a>
    </div>

    <div class="student-mini" onclick="toggleProfile()">
      <img src="https://cdn-icons-png.flaticon.com/512/3135/3135715.png">
      <span><%= studentName %></span>
      <div class="profile-dropdown" id="profileDropdown">
        <a href="edit.jsp">Edit</a>
        <a href="help.jsp">Help</a>
        <a href="feedback.jsp">Send Feedback</a>
        <a href="logout.jsp">Logout</a>
      </div>
    </div>
  </div>
</div>

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
<footer class="footer-desc">
             © 2026 ManSparsh Online Counseling &amp; Therapy. All rights reserved.
         </footer>
<script>
function toggleProfile(){
  const d=document.getElementById("profileDropdown");
  d.style.display=(d.style.display==="block")?"none":"block";
}
document.addEventListener("click",function(e){
  const p=document.querySelector(".student-mini");
  const d=document.getElementById("profileDropdown");
  if(!p.contains(e.target)){ d.style.display="none"; }
});
function sendMsg(){
  var i=document.getElementById("msg"), c=document.getElementById("chatBox");
  if(i.value.trim()=="") return;
  c.innerHTML+="<p><b>You:</b> "+i.value+"</p><p><b>Saathi:</b> I’m listening.</p>";
  i.value=""; c.scrollTop=c.scrollHeight;
}
</script>
</body>
</html>