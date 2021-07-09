<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Online Appointments</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="style6.css" type="text/css" rel="stylesheet">
    </head>
    <body>
       <div class="menu">
            <div class="lm">
                    <img src="images\logo.jpeg" alt="">
                </div>
                <div class="leftmenu">
                    <h2>Admin Portal</h2>
                </div>
                <div class="rightmenu">
                    <ul class="rm">
                        <li class="rmi"><a href="HomePage.jsp"> Home </a></li>
                        <li class="rmi"><a href="admin_portal.jsp"> Back </a></li>  
                        <li class="rmi"><a href=""> Logout </a></li>
                           
                    </ul>
                </div>
            </div>
        <%
    try {
        if (request.getParameter("btnView") != null) {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/hcare");
            Statement stmt = conn.createStatement();  
           
            String dt = request.getParameter("appointment");
            ResultSet rs = stmt.executeQuery("select p_id,S_FIRSTNAME,S_LASTNAME, S_AGE from appointment join STUDENT_INFORMATION on p_id = S_ID "
                    + "where date = '" + dt + "' AND mode='online'");    
            out.print("</br>");
            out.print("</br>");

            out.print("<html><body><center>");
            out.print("<table bgcolor='black' width='60%' border='1'>");
            out.print("<thead>");
            out.print("<tr>");
                out.print("<th>"+ "Patient_ID" + "</th><th>" + "First_Name" + "</th><th>" + "Last_Name"
                        + "</th><th>" + "Age" + "</th>");
                out.print("</tr>");
            out.print("</thead>");
            out.print("<tbody bgcolor='blue'>");  
            out.print("<tr>");
            out.print("<th colspan='4'>" + "Students" + "</th>");
            out.print("</tr>");
            while (rs.next()) {

                out.print("<tr>");
                out.print("<td>" + rs.getString(1) + "</td><td>" + rs.getString(2) + "</td><td>" + rs.getString(3) 
                        + "</td><td>" + rs.getInt(4) + "</td>");
                out.print("</tr>");

            }
            out.print("</tbody>");
            Statement stm = conn.createStatement();  
        ResultSet rse = stm.executeQuery("select p_id, E_FIRSTNAME, E_LASTNAME, E_AGE from appointment join EMPLOYEE_INFORMATION on p_id = E_ID "
                    + "where date = '" + dt + "' AND mode='online'");    
            
            out.print("<tbody bgcolor='green'>");
            out.print("<tr>");
            out.print("<th colspan='4'>" + "Employees" + "</th>");
            out.print("</tr>");
            while (rse.next()) {

                out.print("<tr>");
                out.print("<td>" + rse.getString(1) + "</td><td>" + rse.getString(2) + "</td><td>" + rse.getString(3) 
                        + "</td><td>" + rse.getInt(4) + "</td>");
                out.print("</tr>");

            }
            out.print("</tbody>");
           
            
            out.print("</table");
            out.print("</center></body></html>");
            }
    }
    catch (Exception ex) {
        ex.printStackTrace();
    }
%>
    </body>
</html>
