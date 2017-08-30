package stuServlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CBusiServlet extends CDBServlet
{
	//get
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException
	{
		//再这里可以改变driver，url等值 //setDriver("");
		req.setCharacterEncoding("gbk");
		resp.setCharacterEncoding("gbk");
		resp.setHeader("Content-Type", "text-html;charset=gbk");//???
	
		String remove = req.getParameter("option");
		String ques = req.getParameter("ques");
		if(remove != null){
			System.out.println(remove+":"+ques);
			int a = remove(ques);
			if(a == 0){
				resp.sendRedirect("Problums.jsp");
			}else{
				resp.sendRedirect("notfound.jsp");
			}
		}
	}
	
	//post
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException
	{
		req.setCharacterEncoding("gbk");
		resp.setCharacterEncoding("gbk");
		resp.setHeader("Content-Type", "text-html;charset=gbk");
	
		String prob1 = req.getParameter("question1");
		String answer1 = req.getParameter("answer1");
		
		String probansw = prob1 +"&"+answer1;
		
		String qa = SearchProblums();
		if(qa != null && answer1 != null){
			if(qa.equals("暂无其他问题")){
				int a = InsertProblum(probansw);
				if(a == 0){
					resp.setHeader("refresh", "0;url=Problums.jsp");
				}
				if(a == -1){
					resp.setHeader("refresh", "0;url=chat.jsp");
				}
			}else{
				probansw = qa + "&" +answer1;
				if(probansw != null){
					int a = InsertProblum(probansw);
					if(a == 0){
						resp.setHeader("refresh", "0;url=Problums.jsp");
					}
					if(a == -1){
						resp.setHeader("refresh", "0;url=chat.jsp");
					}
				}
			}
		}
	}
	
	//查找问题
	public String  SearchProblums(){
		String p_q3 = null;
		String sql = "select p_q3 from problums where p_id = '20130201'";
		try
		{
			if(isopen()){
				rs = stmt.executeQuery(sql);
				while(rs.next()){
					p_q3 = rs.getString(1);
				}
				return p_q3;
			}
			else{
				return null ;
			}
			
		} catch (SQLException e)
		{
			e.printStackTrace();
			return null ;
		}
		
	}
	
	//插入问题
	public int InsertProblum(String probansw){
		int flag = -1;
		String sql = " update problums set p_q3 = ' " + probansw + " ' where p_id = '20130201'";
		try
		{
			if(isopen()){
				int rs = stmt.executeUpdate(sql);
				if(rs <= 0){
					flag = -1;
				}else{
					flag = 0;
				}
			}
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
		return flag;
	}
	
	//删除学生
	public int remove(String ques){
		int flag = -1;
		String sql = "update problums set p_q3 = '暂无其他问题' where p_id = '20130201'";
		try
		{
			if(isopen()){
				int rs = stmt.executeUpdate(sql);
				if(rs <= 0){
					flag = -1;
				}else{
					flag = 0;
				}
			}
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
		return flag;
	}
}