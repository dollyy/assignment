package stuServlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



public class HwlistServlet extends HttpServlet{
	
	@Override
		protected void doGet(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException {
		    //System.out.print("qwe123qwe");
			Connection con = null;
			Statement st = null;
			ResultSet rs = null;
			try{
				Class.forName("com.mysql.jdbc.Driver");
			}catch(ClassNotFoundException e){
				e.printStackTrace();
				//System.out.print("驱动程序加载错误");
			}
			try{
				con = DriverManager.getConnection("jdbc:mysql://localhost:3308/stu", "root", "yc201409");
				st = con.createStatement();
				String sql = "select * from homework";
				
				rs = st.executeQuery(sql);
				response.setContentType("text/html;charset=gbk");
				PrintWriter out = response.getWriter();
				out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
				out.println("<HTML>");
				out.println("<HEAD></HEAD>");
				out.println("<BODY style=\"background-image: url(imgs/s4.jpg); background-size: 100%;\">");
				
				out.println("<center><h4>作业列表</h4></center>");
				out.println("<center><table border=\"0\"");
				out.println("<tr>");
				out.println("<td>班级</td>");
				out.println("<td>语文</td>");
				out.println("<td>数学</td>");
				out.println("<td>英语</td>");
				out.println("<td>科学</td>");
				out.println("<td>美术</td>");
				out.println("</tr>");
				while(rs.next()){
					String cl = rs.getString("h_class");
					String ch = rs.getString("h_chi");
					String ma = rs.getString("h_math");
					String en = rs.getString("h_eng");
					String sc = rs.getString("h_sci");
					String ar = rs.getString("h_art");
					out.println("<tr>");
					out.println("<td>"+cl+"          "+"</td>");
					out.println("<td>"+ch+"          "+"</td>");
					out.println("<td>"+ma+"          "+"</td>");
					out.println("<td>"+en+"          "+"</td>");
					out.println("<td>"+sc+"          "+"</td>");
					out.println("<td>"+ar+"          "+"</td>");
					out.println("</tr>");
				}
				out.println("</table></center>");
				
				out.println("</BODY>");
				out.println("</HTML>");
				out.flush();
				out.close();
			}catch(SQLException e){
				e.printStackTrace();
			}finally{
				try{
					rs.close();
					st.close();
					con.close();
				}catch(SQLException e){
					e.printStackTrace();
				}
			}
	    }
}
