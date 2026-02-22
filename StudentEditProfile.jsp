<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String studentName = (String) session.getAttribute("studentName");
String studentEmail = (String) session.getAttribute("studentEmail");

if(studentName == null){
    response.sendRedirect("StudentLogin.jsp");
    return;
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Profile</title>


<style>
body{
    margin:0;
    font-family:Arial, sans-serif;
    background:#f4f6fb;
}

.container{
    max-width:450px;
    margin:80px auto;
    background:white;
    padding:35px;
    border-radius:16px;
    box-shadow:0 10px 25px rgba(0,0,0,0.15);
}

h2{
    text-align:center;
    margin-bottom:25px;
    color:#4f46e5;
}

label{
    font-weight:600;
    display:block;
    margin-bottom:5px;
}

input, select{
    width:100%;
    padding:10px;
    margin-bottom:15px;
    border-radius:8px;
    border:1px solid #ccc;
}

button{
    width:100%;
    padding:12px;
    background:#4f46e5;
    color:white;
    border:none;
    border-radius:20px;
    font-size:16px;
    cursor:pointer;
}

button:hover{ background:#4338ca; }

.success{
    text-align:center;
    color:green;
    margin-bottom:15px;
}
</style>
</head>

<body>

<div class="container">
    <h2>Edit Profile</h2>

    <% if(request.getParameter("save") != null){ %>
        <p class="success">Profile updated successfully!</p>
    <% } %>

    <form method="post" action="StudentEditProfileProcess.jsp" autocomplete="new-password">
        <!-- browser ko fake credentials do -->
<input type="text"
       name="username"
       autocomplete="username"
       style="display:none">

<input type="password"
       name="password"
       autocomplete="current-password"
       style="display:none">
        <label>Full Name</label>
        <input type="text" name="name" value="<%= studentName %>" required>
        <label>Email</label>
        <input type="email" value="<%= studentEmail %>" readonly>
        <hr style="margin:20px 0">

        <h3 style="text-align:center;color:#333;">Change Password</h3>
       
        <label>Current Password</label>
        <input type="password"
                name="currentPassword"
                autocomplete="off">
        
        <label>New Password</label>
        <input type="password"
               name="newPassword"
               autocomplete="new-password">
        <label>Confirm New Password</label>
        <input type="password"
               name="confirmPassword"
               autocomplete="new-password">

        <button type="submit" name="save">Save Changes</button>
    </form>
</div>
<script>
window.addEventListener("DOMContentLoaded", () => {
    document.querySelectorAll("input[type=password]").forEach(p => {
        p.value = "";
    });
});
</script>

</body>
</html>
