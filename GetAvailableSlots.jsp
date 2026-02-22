<%@ page import="java.sql.*, java.util.*" %>

<%
String dateStr = request.getParameter("date");
if(dateStr == null){
    return;
}

java.sql.Date sqlDate = java.sql.Date.valueOf(dateStr);

Calendar cal = Calendar.getInstance();
cal.setTime(sqlDate);

String[] days = {
    "Sunday","Monday","Tuesday","Wednesday",
    "Thursday","Friday","Saturday"
};

String day = days[cal.get(Calendar.DAY_OF_WEEK) - 1];

Connection con = null;
PreparedStatement ps = null;
ResultSet rs = null;

try{
    Class.forName("org.apache.derby.jdbc.ClientDriver");
    con = DriverManager.getConnection(
        "jdbc:derby://localhost:1527/ManSparsh","bns","bns"
    );

    ps = con.prepareStatement(
        "SELECT counselor_id, time_slot " +
        "FROM counselor_timetable " +
        "WHERE day=? " +
        "AND time_slot NOT IN ( " +
        "   SELECT time_slot FROM appointment WHERE appointment_date=? " +
        ")"
    );

    ps.setString(1, day);
    ps.setDate(2, sqlDate);

    rs = ps.executeQuery();

    out.print("<option value=''>Select Time Slot</option>");

    boolean found = false;
    while(rs.next()){
        found = true;
        out.print(
            "<option value='"+rs.getString("time_slot")+
            "' data-counselor='"+rs.getInt("counselor_id")+"'>"+
            rs.getString("time_slot")+
            "</option>"
        );
    }

    if(!found){
        out.print("<option>No slots available</option>");
    }

}catch(Exception e){
    out.print("<option>Error loading slots</option>");
}finally{
    if(rs!=null) rs.close();
    if(ps!=null) ps.close();
    if(con!=null) con.close();
}
%>
