package stuServlet;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DButil
{
	//1��ע������/����������
	static{
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e)
		{
			e.printStackTrace();
		}
	}
	
	//2����ȡ���ݿ�����
	public static  Connection getConnection() throws SQLException{
		//urlָ���ݿ��URL����HTTP�������ɷ�ʽһ��
		//jdbc:mysql://������ַ��mysql���ڵ�������ַ�����˿ںţ�3306��/���ݿ�����useUnicode=true&CharSet=utf8
		//jdbc:oracle:thin
		String url = "jdbc:mysql://127.0.0.1:3308/stu?useUnicode=true&characterEncoding=gbk";
		String user = "root";
		String pwd = "yc201409";
		Connection con = DriverManager.getConnection(url, user, pwd);//����������
		return con;	
	}
	
	//3���ر�
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