package stuServlet;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import stuMsg.Homework;

public class Index extends DB{
	
	HttpServletRequest request;
	HttpServletResponse response;
	ResultSet rs;
	
	public void init() throws ServletException {
		super.init();
		getHW();
		
	}
	
	public List<Homework> getHW(){
		try {
			List<Homework> home=new ArrayList<Homework>();
			if(getCon()){
				rs=st.executeQuery("select h_chi,h_math,h_eng,h_sci,h_art from homework where h_class='三年级二班'");
				while(rs.next()){
					Homework hw=new Homework();
					hw.setChi(rs.getString(1));
					hw.setMath(rs.getString(2));
					hw.setEng(rs.getString(3));
					hw.setSci(rs.getString(4));
					hw.setArt(rs.getString(5));
					home.add(hw);
					return home;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
}