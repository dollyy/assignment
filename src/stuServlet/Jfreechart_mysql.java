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
	//�������ݿ�
	public Connection getConnection(){
		try {
			String url="jdbc:mysql://127.0.0.1:3308/stu";
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
			e.printStackTrace();
		}
	}
	//��ѧ
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
            dataset.addValue(arr[0],"", "һ�꼶(��)");
            dataset.addValue(arr[1],"", "һ�꼶(��)");
            dataset.addValue(arr[2],"", "���꼶(��)");
            dataset.addValue(arr[3],"", "���꼶(��)");
            dataset.addValue(arr[4],"", "���꼶(��)");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		close();
		return dataset;
	}
    //����
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
            dataset.addValue(arr[0],"", "һ�꼶(��)");
            dataset.addValue(arr[1],"", "һ�꼶(��)");
            dataset.addValue(arr[2],"", "���꼶(��)");
            dataset.addValue(arr[3],"", "���꼶(��)");
            dataset.addValue(arr[4],"", "���꼶(��)");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		close();
		return dataset;
	}
    //Ӣ��
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
            dataset.addValue(arr[0],"", "һ�꼶(��)");
            dataset.addValue(arr[1],"", "һ�꼶(��)");
            dataset.addValue(arr[2],"", "���꼶(��)");
            dataset.addValue(arr[3],"", "���꼶(��)");
            dataset.addValue(arr[4],"", "���꼶(��)");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		close();
		return dataset;
	}
    //��ѧ
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
            dataset.addValue(arr[0],"", "һ�꼶(��)");
            dataset.addValue(arr[1],"", "һ�꼶(��)");
            dataset.addValue(arr[2],"", "���꼶(��)");
            dataset.addValue(arr[3],"", "���꼶(��)");
            dataset.addValue(arr[4],"", "���꼶(��)");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		close();
		return dataset;
	}
    //����
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
            dataset.addValue(arr[0],"", "һ�꼶(��)");
            dataset.addValue(arr[1],"", "һ�꼶(��)");
            dataset.addValue(arr[2],"", "���꼶(��)");
            dataset.addValue(arr[3],"", "���꼶(��)");
            dataset.addValue(arr[4],"", "���꼶(��)");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		close();
		return dataset;
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		**********************************************ͼ***************************************
		response.setContentType("image");
		String subj=request.getParameter("subject");
		if(subj.equals("g_chi")){
			CategoryDataset dataset = gradeChi();  
	        JFreeChart chart = ChartFactory.createLineChart(  
	           "���ĳɼ�����ͼ", // ͼ�����  
	           null, // Ŀ¼�����ʾ��ǩ  
	           "���Գɼ�", // ��ֵ�����ʾ��ǩ  
	           dataset, // ���ݼ�  
	           PlotOrientation.VERTICAL, // ͼ����ˮƽ����ֱ  
	           true,         // �Ƿ���ʾͼ��(���ڼ򵥵���״ͼ������false)  
	           false,         // �Ƿ����ɹ���  
	           false         // �Ƿ�����URL����  
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
	        "��ѧ�ɼ�����ͼ", // ͼ�����
	        null, // Ŀ¼�����ʾ��ǩ  
	        "���Գɼ�", // ��ֵ�����ʾ��ǩ  
	        dataset, // ���ݼ�  
	        PlotOrientation.VERTICAL, // ͼ����ˮƽ����ֱ  
	        true,         // �Ƿ���ʾͼ��(���ڼ򵥵���״ͼ������false)  
	        false,         // �Ƿ����ɹ���  
	        false         // �Ƿ�����URL����  
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
	        "Ӣ��ɼ�����ͼ", // ͼ�����
	        null, // Ŀ¼�����ʾ��ǩ  
	        "���Գɼ�", // ��ֵ�����ʾ��ǩ  
	        dataset, // ���ݼ�  
	        PlotOrientation.VERTICAL, // ͼ����ˮƽ����ֱ  
	        true,         // �Ƿ���ʾͼ��(���ڼ򵥵���״ͼ������false)  
	        false,         // �Ƿ����ɹ���  
	        false         // �Ƿ�����URL����  
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
	        "��ѧ�ɼ�����ͼ", // ͼ�����
	        null, // Ŀ¼�����ʾ��ǩ  
	        "���Գɼ�", // ��ֵ�����ʾ��ǩ  
	        dataset, // ���ݼ�  
	        PlotOrientation.VERTICAL, // ͼ����ˮƽ����ֱ  
	        true,         // �Ƿ���ʾͼ��(���ڼ򵥵���״ͼ������false)  
	        false,         // �Ƿ����ɹ���  
	        false         // �Ƿ�����URL����  
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
	        "�����ɼ�����ͼ", // ͼ�����
	        null, // Ŀ¼�����ʾ��ǩ  
	        "���Գɼ�", // ��ֵ�����ʾ��ǩ  
	        dataset, // ���ݼ�  
	        PlotOrientation.VERTICAL, // ͼ����ˮƽ����ֱ  
	        true,         // �Ƿ���ʾͼ��(���ڼ򵥵���״ͼ������false)  
	        false,         // �Ƿ����ɹ���  
	        false         // �Ƿ�����URL����  
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
	    plot.setNoDataMessage("�����ݿɹ���ʾ��");
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