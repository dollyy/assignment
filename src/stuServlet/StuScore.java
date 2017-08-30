package stuServlet;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import stuMsg.Grades;
import stuServlet.BinarySearchTree.TreeNode;

public class StuScore extends HttpServlet {
	public StuScore() {
		super();
	}
	
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("gbk");
		GradesDao dao = new GradesDao();
		List<Grades> list = null;
		String stuName = request.getParameter("stuName");
		String flag = request.getParameter("flag");
		String sql = " where 1=1 ";
		if (flag != null) {
			BinarySearchTree bst = new BinarySearchTree();
			list = dao.getGradesByWhere("");
			if (list != null) {
				for (int i = 0; i < list.size(); i++) {
					Grades gd = list.get(i);
					bst.insert(Integer.parseInt(gd.getGid()));
				}
			}
			HttpSession session = request.getSession();
			String userid = (String) session.getAttribute("userid");
			TreeNode node = bst.search(Integer.parseInt(userid));
			if (node != null) {
				sql = sql+ " and g_id='" + userid + "'";
			}
		} else {
			if (stuName != null && !"".equals(stuName)) {
				sql = sql + "and g_name='" + stuName + "' ";
			}
		}
		list = dao.getGradesByWhere(sql);
		request.setAttribute("list", list);
		request.getRequestDispatcher("stuScore.jsp").forward(request, response);
	}
}