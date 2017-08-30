package stuServlet;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

public class DB extends HttpServlet{
	
	protected Connection con;	
	protected Statement st;
	
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
	}
	
	public void init() throws ServletException {
		super.init();
		if(!getCon()){
			return;
		}
	}
	
	public boolean getCon(){
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3308/stu?useUnicode=true&characterEncoding=gbk","root","yc201409");
			st=con.createStatement();
			return true;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			return false;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}
	
	public void destroy() {
		System.out.println("destroy");
		try {
			if((con != null) && !(con.isClosed())){
				con.close();
			}
			if((st != null) && !(st.isClosed())){
				st.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		super.destroy();
	}
}