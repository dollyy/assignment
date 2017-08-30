package stuServlet;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DButil
{
	//1、注册驱动/加载驱动类
	static{
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e)
		{
			e.printStackTrace();
		}
	}
	
	//2、获取数据库连接
	public static  Connection getConnection() throws SQLException{
		//url指数据库的URL，和HTTP里面的组成方式一样
		//jdbc:mysql://主机地址（mysql所在的主机地址）：端口号（3306）/数据库名？useUnicode=true&CharSet=utf8
		//jdbc:oracle:thin
		String url = "jdbc:mysql://127.0.0.1:3308/stu?useUnicode=true&characterEncoding=gbk";
		String user = "root";
		String pwd = "yc201409";
		Connection con = DriverManager.getConnection(url, user, pwd);//驱动管理者
		return con;	
	}
	
	//3、关闭
	public static void close(Connection con, PreparedStatement pstmt, ResultSet rs) throws SQLException{
		if(rs != null){
			rs.close();
			if(pstmt != null){
				pstmt.close();
				if(con != null){
					con.close();
				}
			}
		}
	}
}