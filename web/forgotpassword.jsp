<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.Session"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="java.util.Properties"%>
<%@page import="java.sql.*" contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="javax.mail.Message.RecipientType"%>

<!DOCTYPE html>
<%
    //int bid=Integer.parseInt(request.getParameter("bid"));
    String bid="S1";
//    int rid=Integer.parseInt(request.getParameter("rid"));
    Class.forName("org.apache.derby.jdbc.ClientDriver");
//    Connection conn=DriverManager.getConnection("jdbc:derby://localhost:1527/BloodDrive");
//    Statement stmt=conn.createStatement();
//    ResultSet rs=stmt.executeQuery("select email from requester where req_id="+rid+" ");
    String emailto="";
//    if(rs.next())
//        emailto=rs.getString(1);
//    rs=stmt.executeQuery("select email,password from bloodbank where bloodbank_id="+bid+" ");
    String emailfrom="arogyabv@gmail.com";
    String pass1="arogyamandir2021";
    String pass="";
    Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/hcare");
    String query = "select S_EMAIL,password from STUDENT_INFORMATION,authentication where S_ID=id and S_ID IN (select id from authentication where id like '" + bid + "')";
    PreparedStatement pst = conn.prepareStatement(query); 
    ResultSet rst = pst.executeQuery();
    if(rst.next())
    {
        emailto=rst.getString(1);
        pass=rst.getString(2);
    }
     Properties props = new Properties();
     props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", 25);
        props.put("mail.smtp.user", emailfrom);
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.debug", "true");
        props.put("mail.smtp.socketFactory.port", 25);
        props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        props.put("mail.smtp.socketFactory.fallback", "false"); 
                   
                Session session1 = Session.getDefaultInstance(props, null);
                session1.setDebug(true);
                MimeMessage message = new MimeMessage(session1);
                message.setText("Your forgot password request has been accepted. Password  : "+pass );
                message.setSubject("Password Recovery ");
                message.setFrom(new InternetAddress( emailfrom));
                message.addRecipient( RecipientType.TO, new InternetAddress( emailto));
                message.saveChanges();
                Transport transport = session1.getTransport("smtp");
                transport.connect("smtp.gmail.com", emailfrom, pass1);
                transport.sendMessage(message, message.getAllRecipients());
                transport.close();
                out.println("alert('Your password mailed to you');");  
                
    
%>