<%@page import="stu.*"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="org.jfree.chart.*"%>
<%@page import="org.jfree.chart.plot.*"%>
<%@page import="org.jfree.chart.servlet.ServletUtilities"%>
<%@page import="org.jfree.chart.labels.StandardPieToolTipGenerator"%>
<%@page import="org.jfree.chart.urls.StandardPieURLGenerator"%>
<%@page import="org.jfree.chart.entity.StandardEntityCollection"%>
<%@page import="java.io.*"%>
<%@page import="org.jfree.data.general.DefaultPieDataset"%>
<%@page import="org.jfree.chart.*"%>
<%@page import="org.jfree.chart.entity.StandardEntityCollection"%>
<%@page import="java.io.*"%>
<%@page import="org.jfree.chart.plot.PlotOrientation"%>
<%@page import="org.jfree.data.category.*"%>
<%@page import="java.awt.*,org.jfree.chart.JFreeChart,org.jfree.chart.servlet.*"%>
<%@page import="org.jfree.chart.renderer.category.BarRenderer3D"%>
<%@page import="org.jfree.chart.labels.StandardCategoryItemLabelGenerator"%>
<%@page import="org.jfree.chart.axis.CategoryAxis"%>
<%@page import="org.jfree.chart.plot.CategoryPlot"%>
<%@page language="java" contentType="text/html; charset=gbk" pageEncoding="gbk"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="css/passrate.css">
<script src="js/jquery-1.7.2.min.js"></script>
<script src="js/index.js"></script>
<title>ѧ��������</title>
<style type="text/css">
<!--
.STYLE1 {
	font-size: 14px
}
-->
</style>
</head>
<body>

	<div class="bg"></div>
  <div class="logo"><a href="index.jsp">�Ͼ���ׯѧԺ����Сѧ</a></div>
  <div class="link_person"><a href="person">��������</a></div>
	<div class="passrate">

		<p>&nbsp;</p>
		<p>&nbsp;</p>
		<p>&nbsp;</p>
		<p>&nbsp;</p>
		<p>&nbsp;</p>
		<p>&nbsp;</p>
		<p align="center" >&nbsp;&nbsp;
		<form action="PassrateServlet" name="form1" method="post">
		�����ʣ�<select name="courseName">
	  <option value="">---��ѡ��---</option>
		
		<option value="chi">����</option>
	    <option value="math">��ѧ</option>
	    <option value="eng">Ӣ��</option>
	    <option value="sci">��ѧ</option>
		<option value="art">����</option>
		
		</select> &nbsp;&nbsp;<input type="submit" name="submit1" value="��ѯ" >
		</form>
        
		<p>&nbsp;</p>


	</div>
	<div class="safety">
		<div class="left"></div>
		<div class="right">
			<%
			Map<String,Object> map = (Map<String,Object>)request.getAttribute("map");
		    response.setContentType("text/html;charset=GBK");
		    JFreeChart chart ;

    //����������ʽ
      StandardChartTheme standardChartTheme = new StandardChartTheme("CN");
      //���ñ�������
      standardChartTheme.setExtraLargeFont(new Font("����", Font.BOLD, 20));
      //����ͼ��������
      standardChartTheme.setRegularFont(new Font("����", Font.PLAIN, 15));
      //�������������
      standardChartTheme.setLargeFont(new Font("����", Font.PLAIN, 15));
      //Ӧ��������ʽ
      ChartFactory.setChartTheme(standardChartTheme);
      String graphURL = "";
      if(map!=null){
    	  DefaultPieDataset data = new DefaultPieDataset(); 
          //���ݳ�ʼ��
          
          double passRate = Math.rint((Float)map.get("passRate"));
          double nopassRate = 100-passRate;
          data.setValue("����"+passRate+"%",passRate); 
          data.setValue("������"+nopassRate+"%",nopassRate); 
          
          //HttpSession session = request.getSession();

          PiePlot3D plot = new PiePlot3D(data);//����һ��3D��ͼ 
          //plot.setURLGenerator(new StandardPieURLGenerator("DegreedView.jsp"));//�趨ͼƬ���� 
          chart = new JFreeChart("",JFreeChart.DEFAULT_TITLE_FONT, plot, true); 
          chart.setBackgroundPaint(java.awt.Color.white);//��ѡ������ͼƬ����ɫ 
          chart.setTitle(map.get("courseName")+"ͨ����");//��ѡ������ͼƬ���� 
          plot.setToolTipGenerator(new StandardPieToolTipGenerator()); 
          PrintWriter w = new PrintWriter(out);//���MAP��Ϣ 
          //500��ͼƬ���ȣ�300��ͼƬ�߶�
          //String filename = ServletUtilities.saveChartAsPNG(chart,500,300,info,session); 
          StandardEntityCollection sec = new StandardEntityCollection(); 
          ChartRenderingInfo info = new ChartRenderingInfo(sec);
          String filename = ServletUtilities.saveChartAsJPEG(chart,500,300,info,session); 
          ChartUtilities.writeImageMap(w,"map0",info,false); 

          graphURL = request.getContextPath() + "/DisplayChart?filename=" + filename;
         
      }

     
%>
			<img src="<%= graphURL %>" width="600" height="400">

		</div>
	</div>

	<div class="footer">
		<div class="back">
    		<a href="#top"><img src="imgs/top.png"></a>
    	</div>
    	<div class="f1">
    		<a>�������</a>
    		<a>��ϵ����</a>
    	</div>
    	<div class="f2">
    		Copyright&nbsp;&copy;2016&nbsp;&nbsp;ѧ����ҵϵͳ
    	</div>
	</div>
</body>
</html>