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

import stuMsg.Modify;

public class ModifyServlet extends DB{
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("gbk");
		response.setCharacterEncoding("gbk");
		response.setHeader("Content-Type", "text/html; charset=gbk");
		PrintWriter out=response.getWriter();
		List<Modify> msg=new ArrayList<Modify>();
		boolean flag=true;
		
		String name=request.getParameter("name");
		String num=request.getParameter("num");
		String pwd=request.getParameter("pwd");
		String pwd2=request.getParameter("pwd2");
		name=java.net.URLDecoder.decode(name,"utf-8"); 
		
		try {
			ResultSet rs=st.executeQuery("select m_name,m_id from msg");
			while(rs.next()){
				Modify m=new Modify();
				m.setName(rs.getString(1));
				m.setId(rs.getString(2));
				msg.add(m);
			}
			for(int i=0;i<msg.size();i++){
				Modify m=(Modify)msg.get(i);
				if(m.getName().equals(name)){
					flag=false;
					if(m.getId().equals(num)){
						if(pwd.equals(pwd2)){
							st.execute("update msg set m_pwd='"+pwd+"' where m_id='"+num+"'");
							out.write("0");		//修改成功
							return;
						}else{
							out.write("-1");	//两次密码不一致
							return;
						}
					}else{
						out.write("-2");	//学号与姓名不符
						return;
					}
				}
			}
			if(flag){
				out.write("-2");
				return;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}