package stuServlet;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import stuMsg.Course;
import stuMsg.Msg;

public class Person extends DB{
	
	ResultSet rs;
	
	public void init() throws ServletException {
		super.init();
		getCou();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ServletContext application=request.getServletContext();
		Object obj=application.getAttribute("num");
		if(obj == null){
			return;
		}
		String num=(String)obj;
		List<Msg> stus=new ArrayList<Msg>();
		try {
			rs=st.executeQuery("select m_class,m_name,m_id from msg where m_id="+num);
			while(rs.next()){
				Msg m=new Msg();
				m.setSclass(rs.getString(1));
				m.setSname(rs.getString(2));
				m.setSnum(rs.getString(3));
				stus.add(m);
			}
			request.setAttribute("msg", stus);
			request.getRequestDispatcher("person.jsp").forward(request, response);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public List<Course> getCou(){
		try {
			List<Course> co=new ArrayList<Course>();
			if(getCon()){
				rs=st.executeQuery("select c_mon,c_tue,c_wed,c_thu,c_fri from course where c_class='三年级二班'");
				while(rs.next()){
					Course c=new Course();
					c.setMon(rs.getString(1));
					c.setTue(rs.getString(2));
					c.setWed(rs.getString(3));
					c.setThu(rs.getString(4));
					c.setFri(rs.getString(5));
					co.add(c);
				}
				return co;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public List<String> getHis(int data){
		try {
			List<String> his=new ArrayList<String>();
			if(getCon()){
				rs=st.executeQuery("select h_chi,h_math,h_eng,h_sci,h_art from history where h_id='"+data+"'");
				while(rs.next()){
					his.add(rs.getString(1));
					his.add(rs.getString(2));
					his.add(rs.getString(3));
					his.add(rs.getString(4));
					his.add(rs.getString(5));
				}
				return his;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
}