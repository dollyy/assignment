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
	//�������ݿ�
	static Connection con = null;
	//�����ݿⷢ��ָ��
	static PreparedStatement pstmt = null;
	//��������
	static ResultSet rs = null;
	
	public Cprob searchProblums(){
		try
		{
			con = DButil.getConnection();
			String sql = "select p_id, p_q1, p_q2, p_q3 from problums where p_id ='20130201'";
			
			//Ԥ����
			pstmt = con.prepareStatement(sql);
			
			//��ѯ���Ľ��
			rs = pstmt.executeQuery();
			
			List<Cprob> list = new ArrayList<Cprob>();
			
			while(rs.next()){
				//����ѯ���Ľ�������󣬷�װ����������
				Cprob prob = new Cprob(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4));
				list.add(prob);
			}
			
			//���������
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