<%@ page import="java.sql.*, java.security.MessageDigest" %>

<%
/* ---------- Session check ---------- */
Integer studentId = (Integer) session.getAttribute("studentId");
String sessionEmail = (String) session.getAttribute("studentEmail");

if (studentId == null) {
    response.sendRedirect("StudentLogin.jsp");
    return;
}

/* ---------- Get form data ---------- */
String name = request.getParameter("name");
String currentPassword = request.getParameter("currentPassword");
String newPassword = request.getParameter("newPassword");
String confirmPassword = request.getParameter("confirmPassword");

/* ---------- Password hashing method ---------- */
String hash(String password) throws Exception {
    MessageDigest md = MessageDigest.getInstance("SHA-256");
    byte[] bytes = md.digest(password.getBytes("UTF-8"));
    StringBuilder sb = new StringBuilder();
    for (byte b : bytes) {
        sb.append(String.format("%02x", b));
    }
    return sb.toString();
}

Connection con = null;

try {
    Class.forName("org.apache.derby.jdbc.ClientDriver");
    con = DriverManager.getConnection(
        "jdbc:derby://localhost:1527/ManSparsh", "bns", "bns"
    );

    /* ---------- Update NAME ---------- */
    PreparedStatement ps1 = con.prepareStatement(
        "UPDATE STUDENT SET name=? WHERE student_id=?"
    );
    ps1.setString(1, name);
    ps1.setInt(2, studentId);
    ps1.executeUpdate();

    session.setAttribute("studentName", name);

    /* ---------- Change PASSWORD (only if filled) ---------- */
    if (
        currentPassword != null && !currentPassword.isEmpty() &&
        newPassword != null && !newPassword.isEmpty() &&
        confirmPassword != null && !confirmPassword.isEmpty()
    ) {

        if (!newPassword.equals(confirmPassword)) {
            response.sendRedirect("StudentEditProfile.jsp?error=nomatch");
            return;
        }

        PreparedStatement ps2 = con.prepareStatement(
            "SELECT password FROM STUDENT WHERE student_id=?"
        );
        ps2.setInt(1, studentId);
        ResultSet rs = ps2.executeQuery();

        if (rs.next()) {
            String dbPassword = rs.getString("password");

            if (!dbPassword.equals(hash(currentPassword))) {
                response.sendRedirect("StudentEditProfile.jsp?error=wrongpass");
                return;
            }

            PreparedStatement ps3 = con.prepareStatement(
                "UPDATE STUDENT SET password=? WHERE student_id=?"
            );
            ps3.setString(1, hash(newPassword));
            ps3.setInt(2, studentId);
            ps3.executeUpdate();
        }
    }

    response.sendRedirect("StudentEditProfile.jsp?save=success");

} catch (Exception e) {
    e.printStackTrace();
    response.sendRedirect("StudentEditProfile.jsp?error=server");
} finally {
    if (con != null) con.close();
}
%>
