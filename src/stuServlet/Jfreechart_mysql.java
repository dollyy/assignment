package stuServlet;

import java.awt.Color;
import java.awt.Font;
import java.awt.RenderingHints;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartUtilities;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.axis.CategoryAxis;
import org.jfree.chart.axis.ValueAxis;
import org.jfree.chart.plot.CategoryPlot;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.chart.title.TextTitle;
import org.jfree.data.category.CategoryDataset;
import org.jfree.data.category.DefaultCategoryDataset;

/**
 * Servlet implementation class Jfreechart_mysql
 */
@WebServlet("/Jfreechart_mysql")
public class Jfreechart_mysql extends HttpServlet {
	private static final long serialVersionUID = 1L;
	DefaultCategoryDataset dataset = new DefaultCategoryDataset();  
	Connection conn=null;
	Statement stmt=null;
	ResultSet rs=null;   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Jfreechart_mysql() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	//连接数据库
	public Connection getConnection(){
		try {
			String url="jdbc:mysql://127.0.0.1:3308/stu";
			String user="root";
			String password="yc201409";
			Class.forName("com.mysql.jdbc.Driver");
			conn=DriverManager.getConnection(url, user, password);
			stmt=conn.createStatement();
			System.out.println("数据库连接成功");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}
	public void close(){
		try {
			conn.close();
			stmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	//数学
	private CategoryDataset gradeMath(){
		conn=getConnection();
		String sql="select h_math from history where h_id='20130201'";
		try {
			rs = stmt.executeQuery(sql);
			String[] s = null;
            while (rs.next()) {
                s=rs.getString(1).split(",");                    
            } 
            int arr[] = new int[s.length];
            for(int i=0;i<s.length;i++){
            	arr[i]=Integer.valueOf(s[i]);
            	System.out.println(arr[i]);
            }
            dataset.addValue(arr[0],"", "一年级(上)");
            dataset.addValue(arr[1],"", "一年级(下)");
            dataset.addValue(arr[2],"", "二年级(上)");
            dataset.addValue(arr[3],"", "二年级(下)");
            dataset.addValue(arr[4],"", "三年级(上)");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		close();
		return dataset;
	}
    //语文
	private CategoryDataset gradeChi(){
		conn=getConnection();
		String sql="select h_chi from history where h_id='20130201'";
		try {
			rs = stmt.executeQuery(sql);
			String[] s = null;
            while (rs.next()) {
                s=rs.getString(1).split(",");                    
            } 
            int arr[] = new int[s.length];
            for(int i=0;i<s.length;i++){
            	arr[i]=Integer.valueOf(s[i]);
            	System.out.println(arr[i]);
            }
            dataset.addValue(arr[0],"", "一年级(上)");
            dataset.addValue(arr[1],"", "一年级(下)");
            dataset.addValue(arr[2],"", "二年级(上)");
            dataset.addValue(arr[3],"", "二年级(下)");
            dataset.addValue(arr[4],"", "三年级(上)");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		close();
		return dataset;
	}
    //英语
	private CategoryDataset gradeEng(){
		conn=getConnection();
		String sql="select h_eng from history where h_id='20130201'";
		try {
			rs = stmt.executeQuery(sql);
			String[] s = null;
            while (rs.next()) {
                s=rs.getString(1).split(",");                    
            } 
            int arr[] = new int[s.length];
            for(int i=0;i<s.length;i++){
            	arr[i]=Integer.valueOf(s[i]);
            	System.out.println(arr[i]);
            }
            dataset.addValue(arr[0],"", "一年级(上)");
            dataset.addValue(arr[1],"", "一年级(下)");
            dataset.addValue(arr[2],"", "二年级(上)");
            dataset.addValue(arr[3],"", "二年级(下)");
            dataset.addValue(arr[4],"", "三年级(上)");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		close();
		return dataset;
	}
    //科学
	private CategoryDataset gradeSci(){
		conn=getConnection();
		String sql="select h_sci from history where h_id='20130201'";
		try {
			rs = stmt.executeQuery(sql);
			String[] s = null;
            while (rs.next()) {
                s=rs.getString(1).split(",");                    
            } 
            int arr[] = new int[s.length];
            for(int i=0;i<s.length;i++){
            	arr[i]=Integer.valueOf(s[i]);
            	System.out.println(arr[i]);
            }
            dataset.addValue(arr[0],"", "一年级(上)");
            dataset.addValue(arr[1],"", "一年级(下)");
            dataset.addValue(arr[2],"", "二年级(上)");
            dataset.addValue(arr[3],"", "二年级(下)");
            dataset.addValue(arr[4],"", "三年级(上)");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		close();
		return dataset;
	}
    //美术
	private CategoryDataset gradeArt(){
		conn=getConnection();
		String sql="select h_art from history where h_id='20130201'";
		try {
			rs = stmt.executeQuery(sql);
			String[] s = null;
            while (rs.next()) {
                s=rs.getString(1).split(",");                    
            } 
            int arr[] = new int[s.length];
            for(int i=0;i<s.length;i++){
            	arr[i]=Integer.valueOf(s[i]);
            	System.out.println(arr[i]);
            }
            dataset.addValue(arr[0],"", "一年级(上)");
            dataset.addValue(arr[1],"", "一年级(下)");
            dataset.addValue(arr[2],"", "二年级(上)");
            dataset.addValue(arr[3],"", "二年级(下)");
            dataset.addValue(arr[4],"", "三年级(上)");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		close();
		return dataset;
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		**********************************************图***************************************
		response.setContentType("image");
		String subj=request.getParameter("subject");
		if(subj.equals("g_chi")){
			CategoryDataset dataset = gradeChi();  
	        JFreeChart chart = ChartFactory.createLineChart(  
	           "语文成绩趋势图", // 图表标题  
	           null, // 目录轴的显示标签  
	           "考试成绩", // 数值轴的显示标签  
	           dataset, // 数据集  
	           PlotOrientation.VERTICAL, // 图表方向：水平、垂直  
	           true,         // 是否显示图例(对于简单的柱状图必须是false)  
	           false,         // 是否生成工具  
	           false         // 是否生成URL链接  
	        ); 
	        processChart(chart);
	        response.reset();
	        ChartUtilities.writeChartAsJPEG(
	        		response.getOutputStream(), 
	        		0.99f, chart, 800, 503);
//	        String filename=ServletUtilities.saveChartAsPNG(chart, 800, 503, session);	    
		}

		if(subj.equals("g_math")){
			CategoryDataset dataset = gradeMath();  
	        JFreeChart chart = ChartFactory.createLineChart(  
	        "数学成绩趋势图", // 图表标题
	        null, // 目录轴的显示标签  
	        "考试成绩", // 数值轴的显示标签  
	        dataset, // 数据集  
	        PlotOrientation.VERTICAL, // 图表方向：水平、垂直  
	        true,         // 是否显示图例(对于简单的柱状图必须是false)  
	        false,         // 是否生成工具  
	        false         // 是否生成URL链接  
	        ); 
	        processChart(chart);
	        response.reset();
	        ChartUtilities.writeChartAsJPEG(
	        		response.getOutputStream(), 
	        		0.99f, chart, 800, 503);
		}
		if(subj.equals("g_eng")){
			CategoryDataset dataset = gradeEng();  
	        JFreeChart chart = ChartFactory.createLineChart(  
	        "英语成绩趋势图", // 图表标题
	        null, // 目录轴的显示标签  
	        "考试成绩", // 数值轴的显示标签  
	        dataset, // 数据集  
	        PlotOrientation.VERTICAL, // 图表方向：水平、垂直  
	        true,         // 是否显示图例(对于简单的柱状图必须是false)  
	        false,         // 是否生成工具  
	        false         // 是否生成URL链接  
	        ); 
	        processChart(chart);
	        response.reset();
	        ChartUtilities.writeChartAsJPEG(
	        		response.getOutputStream(), 
	        		0.99f, chart, 800, 503);
		}
		if(subj.equals("g_sci")){
			CategoryDataset dataset = gradeSci();  
	        JFreeChart chart = ChartFactory.createLineChart(  
	        "科学成绩趋势图", // 图表标题
	        null, // 目录轴的显示标签  
	        "考试成绩", // 数值轴的显示标签  
	        dataset, // 数据集  
	        PlotOrientation.VERTICAL, // 图表方向：水平、垂直  
	        true,         // 是否显示图例(对于简单的柱状图必须是false)  
	        false,         // 是否生成工具  
	        false         // 是否生成URL链接  
	        ); 
	        processChart(chart);
	        response.reset();
	        ChartUtilities.writeChartAsJPEG(
	        		response.getOutputStream(), 
	        		0.99f, chart, 800, 503);
		}

		if(subj.equals("g_art")){
			CategoryDataset dataset = gradeArt();  
	        JFreeChart chart = ChartFactory.createLineChart(  
	        "美术成绩趋势图", // 图表标题
	        null, // 目录轴的显示标签  
	        "考试成绩", // 数值轴的显示标签  
	        dataset, // 数据集  
	        PlotOrientation.VERTICAL, // 图表方向：水平、垂直  
	        true,         // 是否显示图例(对于简单的柱状图必须是false)  
	        false,         // 是否生成工具  
	        false         // 是否生成URL链接  
	        ); 
	        processChart(chart);
	        response.reset();
	        ChartUtilities.writeChartAsJPEG(
	        		response.getOutputStream(), 
	        		0.99f, chart, 800, 503);
		}
	}
	private void processChart(JFreeChart chart) {
		CategoryPlot plot = chart.getCategoryPlot();  
	    CategoryAxis domainAxis = plot.getDomainAxis();  
	    ValueAxis rAxis = plot.getRangeAxis();  
	    chart.getRenderingHints().put(RenderingHints.KEY_TEXT_ANTIALIASING,  
	            RenderingHints.VALUE_TEXT_ANTIALIAS_OFF); 
	    plot.setNoDataMessage("无数据可供显示！");
	    TextTitle textTitle = chart.getTitle();  
	    plot.setBackgroundPaint(Color.white);
	    textTitle.setFont(new Font("Microsoft Yahei", Font.PLAIN, 20));  
	    domainAxis.setTickLabelFont(new Font("Microsoft Yahei", Font.PLAIN, 11));  
	    domainAxis.setLabelFont(new Font("Microsoft Yahei", Font.PLAIN, 12));  
	    rAxis.setTickLabelFont(new Font("Microsoft Yahei", Font.PLAIN, 12));  
	    rAxis.setLabelFont(new Font("Microsoft Yahei", Font.PLAIN, 12));  
	    chart.getLegend().setItemFont(new Font("Microsoft Yahei", Font.PLAIN, 12));  
	}
}