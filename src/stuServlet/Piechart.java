package stuServlet;

import java.awt.Color;
import java.awt.Font;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DecimalFormat;
import java.text.NumberFormat;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartUtilities;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.labels.StandardPieSectionLabelGenerator;
import org.jfree.chart.plot.PiePlot;
import org.jfree.chart.title.TextTitle;
import org.jfree.data.general.DefaultPieDataset;
import org.jfree.data.general.PieDataset;

public class Piechart extends HttpServlet{
	DefaultPieDataset dataset=new DefaultPieDataset();
	Connection conn=null;
	Statement stmt=null;
	ResultSet rs=null;
//	ResultSet rs1=null;
	//连接数据库
	public Connection getConnection(){
		try {
			String url="jdbc:mysql://127.0.0.1:3308/stu?useUnicode=true&characterEncoding=gbk";
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
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	private PieDataset gradeMath(){
		conn=getConnection();
		
		String sql="select count(*) from grades where grades.g_math<90";
		try {
			rs=stmt.executeQuery(sql);			
			while(rs.next()){
				System.out.println(rs.getInt(1));
				dataset.setValue("Pass", new Double(30-rs.getInt(1)));
				dataset.setValue("Fail", new Double(rs.getInt(1)));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		close();
		return dataset;
	}
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doPost(req, resp);
	}
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("gbk");
		resp.setCharacterEncoding("gbk");
		resp.setHeader("Content-Type","text/html; charset=gbk");
		PrintWriter out = resp.getWriter();
		//System.out.println("所以我说就让他去");
		//String g_id=req.getParameter("g_id");
		String subj=req.getParameter("subject");
		if(subj.equals("g_math")){
			PieDataset dataset = gradeMath();  
	        JFreeChart chart = ChartFactory.createPieChart("数学合格率", dataset, true, true, false);
	        processChart(chart);
	        resp.reset();
	        ChartUtilities.writeChartAsJPEG(
	        		resp.getOutputStream(), 
	        		0.99f, chart, 1000, 503);
		}
	}
	private void processChart(JFreeChart chart){
        TextTitle title = new TextTitle("数学合格率", new Font("宋体", Font.BOLD, 20));  
        // 解决曲线图片标题中文乱码问题  
        chart.setTitle(title);  
        //通过JFreeChart 对象获得 plot：PiePlot！！  
        PiePlot pieplot = (PiePlot)chart.getPlot();  
        //设置前面每个模块的颜色  
        pieplot.setSectionPaint("Pass", Color.CYAN);  
        pieplot.setSectionPaint("Fail", Color.BLUE);   
        // 没有数据的时候显示的内容  
        pieplot.setNoDataMessage("No data available");   
        // 设置无数据时的信息显示颜色  
        pieplot.setNoDataMessagePaint(Color.red);  
        //把Lable 为”Two” 的那一块”挖”出来10%  
        pieplot.setExplodePercent("Two", 0.3D);  
        //设置背景透明度  
        pieplot.setBackgroundAlpha(0.9f);  
        //设置前景透明度  
        pieplot.setForegroundAlpha(0.6f);  
        // 指定饼图轮廓线的颜色  
        pieplot.setBaseSectionOutlinePaint(Color.white);  
        pieplot.setBaseSectionPaint(Color.BLACK);  
        // 指定显示的饼图上圆形(true)还椭圆形(false)  
        pieplot.setCircular(true);  
        //("{0}: ({1}，{2})")是生成的格式，  
        //{0}表示数据名，{1}表示数据的值，{2}表示百分比。可以自定义。  
        //而new DecimalFormat("0.00%")表示小数点后保留两位。  
        pieplot.setLabelGenerator(new StandardPieSectionLabelGenerator(   
                ("{0}({1}):{2}"), NumberFormat.getNumberInstance(),   
                new DecimalFormat("0.0%")));   
    }
}