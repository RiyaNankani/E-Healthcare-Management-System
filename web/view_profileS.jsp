<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> View Profile </title>
        <link rel="stylesheet" href="cssstu.css" >
    </head>
    <body>
        <div class="menu">
            <div class="lm">
                    <img src="images\logo.jpeg" alt="">
                </div>
                <div class="leftmenu">
                    <h2>Patient Portal</h2>
                </div>
                <div class="rightmenu">
                    <ul class="rm">
                        <li class="rmi"><a href="HomePage.jsp"> Home </a></li>
                        <li class="rmi"><a href="patient_portal.jsp"> Back </a></li>  
                        <li class="rmi"><a href="logout.jsp"> Logout </a></li>
                           
                    </ul>
                </div>
            </div>
        <%
            try {
                if (request.getParameter("view") != null) {

                    Class.forName("org.apache.derby.jdbc.ClientDriver");
                    Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/hcare");
                    Statement stmt = conn.createStatement();
                    String sid = request.getParameter("studid");
                    ResultSet rs = stmt.executeQuery("select * from student_information where s_id like ('" + sid + "%')");
                    out.print("<html><head><h1><center>DETAILS</center></h1></head><body bgcolor='beige'><center>");
                    out.print("<table bgcolor='deepskyblue' width='60%' border=''>");
                    while (rs.next()) {

                        out.print("<tr>");
                        out.print("<tr><td bgcolor='white'>ID</td><td>" + rs.getString(1) + "</td></tr><td bgcolor='white' >FIRST NAME</td><td>" + rs.getString(2) + 
                                "</td></tr><td bgcolor='white'>MIDDLE NAME</td><td>" + rs.getString(3) + "</td></tr><td bgcolor='white'>LAST NAME</td><td>" + rs.getString(4)
                                + "</td></tr><td bgcolor='white'>AGE</td><td>" + rs.getInt(5) + "</td></tr><td bgcolor='white'>EMAIL</td><td>" + rs.getString(6) + 
                                "</td></tr><td bgcolor='white'> FATHER'S FIRST NAME</td><td>" + rs.getString(7) + "</td></tr><td bgcolor='white'>FATHER'S MIDDLE NAME</td><td>" + rs.getString(8) + 
                                "</td></tr><td bgcolor='white'>FATHER'S LAST NAME</td><td>" + rs.getString(9) + "</td></tr><td bgcolor='white'>HOSTEL NAME</td><td>" + rs.getString(10) + 
                                "</td></tr><td bgcolor='white'>ROOM NO.</td><td>" + rs.getInt(11) + "</td></tr><td bgcolor='white'>COURSE</td><td>" + rs.getString(12) + "</td></tr><td bgcolor='white'>CURRENT YEAR</td><td>" + 
                                rs.getInt(13) + "</td></tr><td bgcolor='white'>HOUSE NO.</td><td>" + rs.getString(14) + "</td></tr><td bgcolor='white'>AREA</td><td>" + rs.getString(15) + "</td></tr><td bgcolor='white'>DISTRICT</td><td>" + 
                                rs.getString(16) + "</td></tr><td bgcolor='white'>CITY</td><td>" + rs.getString(17) + "</td></tr><td bgcolor='white'>STATE</td><td>" + rs.getString(18) + "</td></tr><td bgcolor='white'>ZIPCODE</td><td>" + rs.getString(19) 
                                + "</td></tr><td bgcolor='white'>PHONE NO.</td><td>" + rs.getString(20)
                                + "<tr><td bgcolor='white'>PARENT PHONE NO.</td><td>" + rs.getString(21) + "</td>");
                        out.print("</tr>");

                    }
                    out.print("</table");
                    out.print("</center></body></html>");
                }
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        %>
    </body>
</html>
