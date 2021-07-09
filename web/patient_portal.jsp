<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title> Patient Portal</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="style2.css" type="text/css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body>
        <div class="menu">
            <div class="left-menu"> 
                <h1> Patient Portal </h1>
            </div>
            <div class="right-menu">
            <ul>
		<li> <a href="HomePage.jsp"> <i class="fa fa-home" aria-hidden="true"></i> Home </a> </li>
                <li> <a href=#> Appointment </a>
                    <div class="sub-menu-1">
                        <ul> 
                            <%
                            String eid=request.getParameter("id");
                            out.print("<li> <a href='online_appoint.jsp?id=" + eid + "'> Online </a></li>");
                            out.print("<li> <a href='offline_appoint.jsp?id=" + eid + "'> Offline </a></li>");
                      %>
<!--                            <li> <a href="online_appoint.jsp"> Online </a></li>-->
<!--                            <li> <a href="offline_appoint.jsp"> Offline </a></li>-->
                        </ul>
                    </div>
                </li>
<!--                <li> <a href="lab_appoint.jsp"> Test </a></li>-->
                <%out.print("<li> <a href='lab_appoint.jsp?id=" + eid + "'> Test </a></li>");%>
		<li> <a href=#> View </a>
                    <div class="sub-menu-1">
                        <ul> 
                            <%
//                              String eid=request.getParameter("id");
                         out.print("<li> <a href='view_patientMRecord.jsp?id=" + eid + "'> Medical Record </a></li>");
                         out.print(" <li> <a href='view_patientPres.jsp?id=" + eid + "'> Prescription </a></li>");
                      %>
<!--                        <li> <a href="view_patientMRecord.jsp"> Medical Record </a></li>
                            <li> <a href="view_patientPres.jsp"> Prescription </a></li>-->
                            <li> <a href=#> Profile </a>
                                <div class="sub-sub-menu-1">
                                        <ul>
                                            <%
                                          out.print("  <li><a href='view_empProfile.jsp?id=" + eid + "'>Employee</a></li>");
//                                                   response.sendRedirect("view_empProfile.jsp?id="+eid+"");
                                   %>
                                            <%
                                          out.print("  <li><a href='view_studprofile.jsp?id=" + eid + "'>Student</a></li>");
//                                                   response.sendRedirect("view_empProfile.jsp?id="+eid+"");
                                   %>
<!--                                        <li><a href="view_empProfile.jsp">Employee</a></li>-->
<!--                                        <li><a href="view_studprofile.jsp">Student</a></li>-->
                                        </ul>
                                </div>
                            </li>
                            
                        </ul>
                    </div>
                </li>
		
<!--                <li> <a href="complaint.jsp"> Complaint </a></li>-->
                <%
                out.print("<li> <a href='complaint.jsp?id=" + eid + "'> Complaint </a></li>");
            %>
		<li> <a href="logout.jsp"> Logout </a></li>
            </ul>
        </div>
    </div>
        <%
//            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate, max-age=0");
//            response.setHeader("Pragma", "no-cache");
//           response.setHeader("Expires", "0");
//            if (session.getAttribute("stuid") == null) 
//            {
//                response.sendRedirect("student_login.jsp");
//            }
//            //else {
//              //response.sendRedirect("emp_login.jsp");
//            //}
//(session.getAttribute("empid") == null)
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate, max-age=0");
            response.setHeader("Pragma", "no-cache");
            response.setHeader("Expires", "0");
            if (session.getAttribute("id1") == null) {
                response.sendRedirect("login_stud_emp.jsp");
            }
            
        %>
    </body>
</html>