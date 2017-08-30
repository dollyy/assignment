package stuServlet;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import stuMsg.Grades;


/**
 * Servlet implementation class PassrateServlet
 */
public class PassrateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PassrateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("gbk");
		GradesDao dao = new GradesDao();
		List<Grades> list = null;
		String courseName = request.getParameter("courseName");
		String sql = " where 1=1 ";		
		list = dao.getGradesByWhere(sql);
		Map<String,Object> map = new HashMap<String,Object>();
		if(courseName!=null && !"".equals(courseName)){
			if(list!=null){
			float[] passrate = getPassRate(list);
			if(courseName.equals("chi")){
				map.put("passRate", passrate[0]);
				map.put("courseName", "语文");
				
			}
			if(courseName.equals("math")){
				map.put("passRate", passrate[1]);
				map.put("courseName", "数学");
				
			}
			if(courseName.equals("eng")){
				map.put("passRate", passrate[2]);
				map.put("courseName", "英语");
				
			}
			if(courseName.equals("sci")){
				map.put("passRate", passrate[3]);
				map.put("courseName", "科学");
				
			}
			if(courseName.equals("art")){
				map.put("passRate", passrate[4]);
				map.put("courseName", "艺术");
				
			}
			request.setAttribute("map", map);

			}
		}
		request.getRequestDispatcher("passRate.jsp").forward(request, response);
	}
	public float[] getPassRate(List<Grades> list){
		float chiNum = 0;
		float mathNum = 0;
		float engNum = 0;
		float sciNum = 0;
		float artNum = 0;
		float[] passRate=new float[5];
		for(int i=0;i<list.size();i++){
			Grades gd = list.get(i);
			if(gd.getGchi()>=60){
				chiNum++;
			}
			if(gd.getGmath()>=60){
				mathNum++;
			}
			if(gd.getGeng()>=60){
				engNum++;
			}
			if(gd.getGsci()>=60){
				sciNum++;
			}
			if(gd.getGart()>=60){
				artNum++;
			}
		}
		passRate[0]=(chiNum/list.size())*100;
		
		passRate[1]=(mathNum/list.size())*100;
		passRate[2]=(engNum/list.size())*100;
		passRate[3]=(sciNum/list.size())*100;
		passRate[4]=(artNum/list.size())*100;
       System.out.println("及格率="+passRate[0]);
		return passRate;
	}
}
