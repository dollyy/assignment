package stuServlet;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.ArrayList;

import stuMsg.Grades;

public class GradesDao {
	public List<Grades> getGradesByWhere(String where) {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		List<Grades> gradesList = new ArrayList<Grades>();
		try {
			conn = DButil.getConnection();
			stmt = conn
					.prepareStatement("select g_id,g_year,g_name,g_chi,g_math,g_eng,g_sci,g_art from grades "
							+ where);
			System.out.println("select g_id,g_year,g_name,g_chi,g_math,g_eng,g_sci,g_art from grades "
					+ where);
			rs = stmt.executeQuery();

			while (rs.next()) {
				Grades gd = new Grades();
				gd.setGid(rs.getString("g_id"));
				gd.setGyear(rs.getString("g_year"));
				gd.setGname(rs.getString("g_name"));
				gd.setChiName("语文");
				gd.setGchi(rs.getInt("g_chi"));
				gd.setMathName("数学");
				gd.setGmath(rs.getInt("g_math"));
				gd.setEngName("英语");
				gd.setGeng(rs.getInt("g_eng"));
				gd.setSciName("科学");
				gd.setGsci(rs.getInt("g_sci"));
				gd.setArtName("艺术");
				gd.setGart(rs.getInt("g_art"));
				gradesList.add(gd);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				DButil.close(conn, stmt, rs);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return gradesList;
	}
}