package stuServlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HwaddServlet extends HttpServlet{
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("gbk");
		String cl = request.getParameter("cl");
		String ch = request.getParameter("ch");
		String ma = request.getParameter("ma");
		String en = request.getParameter("en");
		String sc = request.getParameter("sc");
		String ar = request.getParameter("ar");
		String sql = "insert into homework(h_class,h_chi,h_math,h_eng,h_sci,h_art)"+
		             "values('"+cl+"','"+ch+"','"+ma+"','"+en+"','"+sc+"','"+ar+"')";
		Connection con = null;
		Statement st = null;
		int result = 0;
		if (!cl.equals("null")){
			try {
					Class.forName("com.mysql.jdbc.Driver");
					con = DriverManager.getConnection("jdbc:mysql://localhost:3308/stu", "root", "yc201409");
					st = con.createStatement();
					result = st.executeUpdate(sql);
					response.setContentType("text/html;charset=gbk");
					PrintWriter out = response.getWriter();
					out.print("作业布置成功");
					out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
					out.println("<HTML>");
					out.println("<HEAD></HEAD>");
					out.println("<BODY>");
					out.println("");
					out.println("<a href=\"Tlist\">返回作业列表</a>");
					out.println("</BODY>");
					out.println("</HTML>");
		            out.flush();
		            out.close();
			    }catch(SQLException e){
			    	e.printStackTrace();
			    }catch(ClassNotFoundException e){
			    	e.printStackTrace();
			    }finally{
			    	try{
			    		st.close();
			    		con.close();
			    	}catch(SQLException e){
			    		e.printStackTrace();
			    	}
			    }
		}else{
			PrintWriter out = response.getWriter();
			out.print("作业布置失败");
		}
	}
}