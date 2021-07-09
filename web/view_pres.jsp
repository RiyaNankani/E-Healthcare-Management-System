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
        <title> Prescription </title>
         <link rel="stylesheet" href="cssp.css" >
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
    </body>
</html>
<%
    try {
        if (request.getParameter("view") != null) {

            Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/hcare");
            Statement stmt = conn.createStatement();
            String pid = request.getParameter("ptid");
            ResultSet rs = stmt.executeQuery("select * from prescription where p_id like ('" + pid + "%')");
            out.print("</br>");
            out.print("</br>");

            out.print("<html><body><center><font size=4>");
            out.print("<table bgcolor='red' width='80%' border='1'>");
            out.print("<thead>");
            out.print("<tr>");
            out.print("<th colspan='11' bgcolor='green'>" + "Prescription" + "</th>");
            out.print("</tr>");
            out.print("<tr>");
                out.print("<th>"+ "Patient_ID" + "</th><th>" + "Doctor_ID" + "</th><th>" + "Date" + "</th><th>" + "Weight" + "</th><th>" + "Height" + "</th><th>" + "Temperature" + "</th><th>" + 
                        "Blood Pressure" + "</th><th>" + "Description" + "</th><th>" + "Age" + "</th><th>" + "Test"+ "</th><th>" + "Bed"+ "</th>");
                out.print("</tr>");
            out.print("</thead>");
            out.print("<tbody bgcolor='deepskyblue'>");
            while (rs.next()) {

                out.print("<tr>");
                out.print("<td>" + rs.getString(1) + "</td><td>" + rs.getString(2) + "</td><td>" + rs.getDate(3) + "</td><td>" + rs.getInt(4) + "</td><td>" + rs.getInt(5) + "</td><td>" + rs.getFloat(6) + "</td><td>" + rs.getFloat(7) + 
                        "</td><td>" + rs.getString(8) + "</td><td>" + rs.getInt(9) + "</td><td>" + rs.getString(10) + "</td><td>" + rs.getInt(11)
                        + "</td>");
                out.print("</tr>");

            }
            out.print("</tbody>");
            out.print("</table");
            out.print("</center></body></html>");
        }
    } catch (Exception ex) {
        ex.printStackTrace();
    }
%>