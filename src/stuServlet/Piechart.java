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
	//�������ݿ�
	public Connection getConnection(){
		try {
			String url="jdbc:mysql://127.0.0.1:3308/stu?useUnicode=true&characterEncoding=gbk";
			String user="root";
			String password="yc201409";
			Class.forName("com.mysql.jdbc.Driver");
			conn=DriverManager.getConnection(url, user, password);
			stmt=conn.createStatement();
			System.out.println("���ݿ����ӳɹ�");
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
		//System.out.println("������˵������ȥ");
		//String g_id=req.getParameter("g_id");
		String subj=req.getParameter("subject");
		if(subj.equals("g_math")){
			PieDataset dataset = gradeMath();  
	        JFreeChart chart = ChartFactory.createPieChart("��ѧ�ϸ���", dataset, true, true, false);
	        processChart(chart);
	        resp.reset();
	        ChartUtilities.writeChartAsJPEG(
	        		resp.getOutputStream(), 
	        		0.99f, chart, 1000, 503);
		}
	}
	private void processChart(JFreeChart chart){
        TextTitle title = new TextTitle("��ѧ�ϸ���", new Font("����", Font.BOLD, 20));  
        // �������ͼƬ����������������  
        chart.setTitle(title);  
        //ͨ��JFreeChart ������ plot��PiePlot����  
        PiePlot pieplot = (PiePlot)chart.getPlot();  
        //����ǰ��ÿ��ģ�����ɫ  
        pieplot.setSectionPaint("Pass", Color.CYAN);  
        pieplot.setSectionPaint("Fail", Color.BLUE);   
        // û�����ݵ�ʱ����ʾ������  
        pieplot.setNoDataMessage("No data available");   
        // ����������ʱ����Ϣ��ʾ��ɫ  
        pieplot.setNoDataMessagePaint(Color.red);  
        //��Lable Ϊ��Two�� ����һ�顱�ڡ�����10%  
        pieplot.setExplodePercent("Two", 0.3D);  
        //���ñ���͸����  
        pieplot.setBackgroundAlpha(0.9f);  
        //����ǰ��͸����  
        pieplot.setForegroundAlpha(0.6f);  
        // ָ����ͼ�����ߵ���ɫ  
        pieplot.setBaseSectionOutlinePaint(Color.white);  
        pieplot.setBaseSectionPaint(Color.BLACK);  
        // ָ����ʾ�ı�ͼ��Բ��(true)����Բ��(false)  
        pieplot.setCircular(true);  
        //("{0}: ({1}��{2})")�����ɵĸ�ʽ��  
        //{0}��ʾ��������{1}��ʾ���ݵ�ֵ��{2}��ʾ�ٷֱȡ������Զ��塣  
        //��new DecimalFormat("0.00%")��ʾС���������λ��  
        pieplot.setLabelGenerator(new StandardPieSectionLabelGenerator(   
                ("{0}({1}):{2}"), NumberFormat.getNumberInstance(),   
                new DecimalFormat("0.0%")));   
    }
}