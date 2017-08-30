package stuServlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import stuMsg.Login;

public class TLoginServlet extends DB{
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("dopost");
		request.setCharacterEncoding("gbk");
		response.setCharacterEncoding("gbk");
		response.setHeader("Content-Type", "text/html; charset=gbk");
		PrintWriter out=response.getWriter();

		String num=request.getParameter("num");
		String pwd=request.getParameter("pwd");
		List<Login> stuLog=new ArrayList<Login>();
		boolean flag=true;
		try {
			ResultSet rs=st.executeQuery("select ma_id,ma_pwd from manager");
			while(rs.next()){
				Login stu=new Login();
				stu.setId(rs.getString(1));
				stu.setPwd(rs.getString(2));
				stuLog.add(stu);
			}
			for(int i=0;i<stuLog.size();i++){
				Login s=(Login)stuLog.get(i);
				if(s.getId().equals(num)){
					flag=false;
					if(s.getPwd().equals(pwd)){
						out.write("0");
						return;
					}else{
						out.write("-1");
						return;
					}
				}
			}
			if(flag){
				System.out.println("not exists");
				out.write("-2");
				return;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}