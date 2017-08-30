package stuServlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import stuMsg.Cprob;

public class CSimilarServlet extends CDBServlet
{
	static String ask;
	String arr[] = new String[3];
	String b[] = new String[3];
	float similar;

	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException
	{
		req.setCharacterEncoding("gbk");
		resp.setCharacterEncoding("gbk");
		resp.setHeader("Content-Type", "text-html;charset=gbk");

		ask = req.getParameter("ask");
		
		List<Cprob> list = SearchProblums();
		
		arr[0] = list.get(0).getP_q1().split("&")[0];
		arr[1] = list.get(0).getP_q2().split("&")[0];
		arr[2] = list.get(0).getP_q3().split("&")[0];
		
		b[0] = list.get(0).getP_q1();
		b[1] = list.get(0).getP_q2();
		b[2] = list.get(0).getP_q3();
		
		for(int i = 0; i < arr.length; i ++){
			similar = levenshtein(ask,arr[i]);
			if(similar > 0.3){
				/*session.setAttribute("prob", b[i]);
				resp.setHeader("refresh", "2;url=hasproblums.jsp");*/
				req.setAttribute("prob", b[i]);
				RequestDispatcher dispatcher = req.getRequestDispatcher("hasproblums.jsp");
				dispatcher.forward(req, resp);
				return;
			}else{
				if(i == (arr.length-1)){
					resp.sendRedirect("notfound.jsp");
				}
			}
		}
	}

	public List<Cprob> SearchProblums(){
		String sql  = "select p_id, p_q1, p_q2, p_q3 from problums where p_id ='20130201'";
		List<Cprob> list = new ArrayList<Cprob>();
		try
		{
			if(isopen()){
				rs = stmt.executeQuery(sql);
				while(rs.next()){
					Cprob prob = new Cprob(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4));
					list.add(prob);
				}
				if(list.size() == 0){
					return null;
				}else{
					return list;
				}
			}else{
				//log��־
				System.out.println("���ݿ�δ����");
				return null;
			}
			
		} catch (SQLException e)
		{
			e.printStackTrace();
			return null;
		}
	}
	
    public static float levenshtein(String str1,String str2) {  
        //���������ַ����ĳ��ȡ�  
        int len1 = str1.length();  
        int len2 = str2.length();  
        //��������˵�����飬���ַ����ȴ�һ���ռ�  
        int[][] dif = new int[len1 + 1][len2 + 1];  
        //����ֵ������B��  
        for (int a = 0; a <= len1; a++) {  
            dif[a][0] = a;  
        }  
        for (int a = 0; a <= len2; a++) {  
            dif[0][a] = a;  
        }  
        //���������ַ��Ƿ�һ�����������ϵ�ֵ
        //charAT����ָ������λ�ô����ַ���

        int temp;  
        for (int i = 1; i <= len1; i++) {  
            for (int j = 1; j <= len2; j++) {  
                if (str1.charAt(i - 1) == str2.charAt(j - 1)) {  
                    temp = 0;  
                } else {  
                    temp = 1;  
                }  
                //ȡ����ֵ����С��  
                dif[i][j] = min(dif[i - 1][j - 1] + temp, dif[i][j - 1] + 1,  
                        dif[i - 1][j] + 1);  
            }  
        }  
        System.out.println("�ַ���\""+str1+"\"��\""+str2+"\"�ıȽ�");  
        //ȡ�������½ǵ�ֵ��ͬ����ͬλ�ô���ͬ�ַ����ıȽ�  
        System.out.println("���첽�裺"+dif[len1][len2]);  
        //�������ƶ�  
        float similarity =1 - (float) dif[len1][len2] / Math.max(str1.length(), str2.length());  
        System.out.println("���ƶȣ�"+similarity);
		return similarity;  
    }  
  
    //�õ���Сֵ  
    private static int min(int... is) {  
        int min = Integer.MAX_VALUE;  
        for (int i : is) {  
            if (min > i) {  
                min = i;  
            }  
        }  
        return min;  
    }
}