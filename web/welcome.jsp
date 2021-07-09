<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome Page</title>
    </head>
    <body>
         <%
             response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
             response.setHeader("Progma", "no-cache");
             response.setHeader("Expires", "0");
             if(session.getAttribute("doctorid")==null)
                 response.sendRedirect("doctorlogin.jsp");
            %>
        <h1> Login Successful Welcome </h1>
        <a href="doctor_portal.jsp"> Go to Doctor Portal </a>
    </body>
</html>
