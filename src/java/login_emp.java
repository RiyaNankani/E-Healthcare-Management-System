import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class login_emp extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        try {
            String id = request.getParameter("id1");
            String password = request.getParameter("psw");
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/hcare");
            PreparedStatement pst = conn.prepareStatement("select * from authentication where id=? and password=? ");
            pst.setString(1, id);
            pst.setString(2, password);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) 
            {
                HttpSession session = request.getSession();
                session.setAttribute("id1", id);
                session.setAttribute("psw", password);
                response.sendRedirect("patient_portal.jsp?id="+id+"");
            } 
            else 
            {
                out.println("<script>alert('Wrong Id or password');</script>");
            }
            
//            if (rs.next()) {
//                HttpSession session = request.getSession();
//                session.setAttribute("empid", id);
//                session.setAttribute("psw", password);
//                response.sendRedirect("patient_portal.jsp?id="+id+"");
//            } else {
//                out.println("Login Failed! Wrong Id or Password");
//            }

        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }


}
