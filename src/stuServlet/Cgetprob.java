package stuServlet;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import stuMsg.Cprob;

public class Cgetprob
{
	//连接数据库
	static Connection con = null;
	//对数据库发出指令
	static PreparedStatement pstmt = null;
	//输出结果集
	static ResultSet rs = null;
	
	public Cprob searchProblums(){
		try
		{
			con = DButil.getConnection();
			String sql = "select p_id, p_q1, p_q2, p_q3 from problums where p_id ='20130201'";
			
			//预编译
			pstmt = con.prepareStatement(sql);
			
			//查询到的结果
			rs = pstmt.executeQuery();
			
			List<Cprob> list = new ArrayList<Cprob>();
			
			while(rs.next()){
				//将查询到的结果给对象，封装到集合里面
				Cprob prob = new Cprob(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4));
				list.add(prob);
			}
			
			//如果不存在
			if(list.size()==0){
				return null;
			}else{
				return list.get(0);
			}
			
		} catch (SQLException e)
		{
			e.printStackTrace();
			return null;
		}		
	}
}