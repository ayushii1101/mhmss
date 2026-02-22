<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*, java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
Integer studentId = (Integer) session.getAttribute("studentId");
if(studentId == null){
    response.sendRedirect("StudentLogin.jsp");
    return;
}

// Use old-style ArrayList and HashMap
List appointments = new ArrayList(); // no <>
Connection con = null;
PreparedStatement ps = null;
ResultSet rs = null;

try {
    Class.forName("org.apache.derby.jdbc.ClientDriver");
    con = DriverManager.getConnection("jdbc:derby://localhost:1527/ManSparsh","bns","bns");

    String sql =
    "SELECT a.id, a.appointment_date, a.time_slot, a.preferred_mode, a.status, " +
    "c.name AS counselor_name " +
    "FROM APPOINTMENT a " +
    "LEFT JOIN COUNSELOR c ON a.counselor_id = c.counselor_id " +
    "WHERE a.student_id=? " +
    "AND a.status IN ('BOOKED') " +
    "ORDER BY a.created_at DESC";

    ps = con.prepareStatement(sql);
    ps.setInt(1, studentId);
    rs = ps.executeQuery();

    while(rs.next()){
        Map appt = new HashMap();
        appt.put("id", new Integer(rs.getInt("id")));
        appt.put("date", rs.getDate("appointment_date"));
        appt.put("time", rs.getString("time_slot"));
        appt.put("mode", rs.getString("preferred_mode"));
        appt.put("status", rs.getString("status"));
        appt.put("counselorName", rs.getString("counselor_name"));
        appointments.add(appt);
    }

} catch(Exception e) {
    out.println("<p style='color:red;'>DB Error: " + e.getMessage() + "</p>");
} finally {
    try { if(rs != null) rs.close(); } catch(Exception e){}
    try { if(ps != null) ps.close(); } catch(Exception e){}
    try { if(con != null) con.close(); } catch(Exception e){}
}

pageContext.setAttribute("appointments", appointments);
%>


<html>
<head>
    <title>My Appointments</title>
    <style>
        body{ font-family: Arial, sans-serif; background:#f4f6fb; margin:0; padding:0; }
        .container { max-width:1200px; margin: 50px auto; padding: 20px; background:white; border-radius:12px; box-shadow:0 12px 30px rgba(0,0,0,0.1); }
        h1{ text-align:center; color:#4a5568; margin-bottom:30px; }
        table{ width:100%; border-collapse:collapse; }
        th, td{ padding:16px; text-align:left; border-bottom:1px solid #f1f5f9; }
        th{ background: linear-gradient(135deg, #6f63ff, #8b7eff); color:white; position:sticky; top:0; }
        tr:hover{ background:#f8fafc; transform: scale(1.01); transition: all 0.2s; }
        .status{ padding:6px 12px; border-radius:20px; font-weight:600; font-size:13px; display:inline-block; }
        .pending{ background:#dbeafe; color:#1e40af; }
        .accepted{ background:#dcfce7; color:#166534; }
        .completed{ background:#f3f4f6; color:#64748b; }
        .time-proposed{ background:#fef3c7; color:#92400e; }
        a.button{ padding:6px 12px; border-radius:12px; text-decoration:none; font-weight:600; margin-right:6px; }
        a.accept{ background:#16a34a; color:white; }
        a.reject{ background:#ef4444; color:white; }
    </style>
</head>
<body>
    <div class="container">
        <h1> My Appointments</h1>
        <table>
            <thead>
                <tr>
                    <th>Counselor</th>
                    <th>Date</th>
                    <th>Time</th>
                    <th>Mode</th>
                    <th>Status</th>
                </tr>
            </thead>
            <tbody>
<c:forEach var="a" items="${appointments}">
    <tr>
        <!-- Counselor -->
        <td>${a.counselorName != null ? a.counselorName : '-'}</td>

        <!-- Date -->
        <td>${a.date}</td>

        <!-- Time -->
        <td>${a.time}</td>

        <!-- Mode -->
        <td>${a.mode}</td>

        <!-- Status -->
        <td>
            <c:choose>
                <c:when test="${a.status == 'BOOKED'}">
                    <span class="status pending">Booked</span>
                </c:when>
                <c:when test="${a.status == 'ACCEPTED'}">
                    <span class="status accepted">Accepted</span>
                </c:when>
                <c:when test="${a.status == 'COMPLETED'}">
                    <span class="status completed">Completed</span>
                </c:when>
                <c:otherwise>
                    ${a.status}
                </c:otherwise>
            </c:choose>
        </td>
    </tr>
</c:forEach>
</tbody>

        </table>
    </div>
</body>
</html>