<%@page import="stuMsg.Grades"%>
<%@page import="stu.*"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@ page import="org.jfree.chart.*"%>
<%@ page import="org.jfree.chart.plot.*"%>
<%@ page import="org.jfree.chart.servlet.ServletUtilities"%>
<%@ page import="org.jfree.chart.labels.StandardPieToolTipGenerator"%>
<%@ page import="org.jfree.chart.urls.StandardPieURLGenerator"%>
<%@ page import="org.jfree.chart.entity.StandardEntityCollection"%>
<%@page import="java.io.*"%>
<%@ page import="org.jfree.data.general.DefaultPieDataset"%>
<%@ page import="org.jfree.chart.*"%>
<%@ page import="org.jfree.chart.entity.StandardEntityCollection"%>
<%@ page import="java.io.*"%>
<%@page import="org.jfree.chart.plot.PlotOrientation"%>
<%@page import="org.jfree.data.category.*"%>
<%@page
	import="java.awt.*,org.jfree.chart.JFreeChart,org.jfree.chart.servlet.*"%>
<%@page import="org.jfree.chart.renderer.category.BarRenderer3D"%>
<%@page
	import="org.jfree.chart.labels.StandardCategoryItemLabelGenerator"%>
<%@page import="org.jfree.chart.axis.CategoryAxis"%>
<%@page import="org.jfree.chart.plot.CategoryPlot"%>
<%@ page language="java" contentType="text/html; charset=gbk"
	pageEncoding="gbk"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="css/index.css">
<script src="js/jquery-1.7.2.min.js"></script>
<script src="js/index.js"></script>
<title>ѧ������ҳ</title>
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
	<div class="logo">ѧУlogo</div>
	<div class="center">��������</div>
	<div class="pic">
		<a href="person.jsp">��������</a>
	</div>
	<div class="stuscore">

		<p>&nbsp;</p>
		<p>&nbsp;</p>
		<p>&nbsp;</p>
		<p>&nbsp;</p>
		<p>&nbsp;</p>
		<p>&nbsp;</p>
		<p align="center" >&nbsp;&nbsp;<form action="stuScore" name="form1" method="post">
		ѧ��������<input type="text" name="stuName"  >&nbsp;&nbsp;&nbsp;&nbsp;�����ʣ�
		<select name="courseName">
	  <option value="">---��ѡ��---</option>
		
		<option value="chi">����</option>
	    <option value="math">��ѧ</option>
	    <option value="eng">Ӣ��</option>
	    <option value="sci">��ѧ</option>
		<option value="art">����</option>
		
		</select> &nbsp;&nbsp;<input type="submit" name="submit1" value="��ѯ" >
		</form>
		</p>
        
		<p>&nbsp;</p>
		<table width="650" border="1" align="center" cellpadding="0"
			cellspacing="0">
			<tr>
				<th width="25%" height="29" scope="col">&nbsp;</th>
				<th width="15%" scope="col"><span class="STYLE1">����</span></th>
				<th width="15%" scope="col"><span class="STYLE1">��ѧ</span></th>
				<th width="15%" scope="col"><span class="STYLE1">Ӣ��</span></th>
				<th width="15%" scope="col"><span class="STYLE1">��ѧ</span></th>
				<th width="15%" scope="col"><span class="STYLE1">����</span></th>
				<%
	List<Grades> list = (List<Grades>)request.getAttribute("list");
    if(list!=null&&list.size()>0){
    	for(int i=0;i<list.size();i++){
    		Grades gd = list.get(i);
%>
			
			<tr>
				<th scope="row">&nbsp;<%=gd.getGname() %></th>
				<td>&nbsp;<%=gd.getGchi() %></td>
				<td>&nbsp;<%=gd.getGmath() %></td>
				<td>&nbsp;<%=gd.getGeng() %></td>
				<td>&nbsp;<%=gd.getGsci() %></td>
				<td>&nbsp;<%=gd.getGart() %></td>
			</tr>
			<%
	}
    }
%>
		</table>
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
      if(map!=null){
    	  DefaultPieDataset data = new DefaultPieDataset(); 
          //���ݳ�ʼ��
          float passRate = (Float)map.get("passRate");
          float nopassRate = 100-(Float)map.get("passRate");
          data.setValue("����"+passRate+"%",passRate); 
          data.setValue("������"+nopassRate+"%",nopassRate); 
          
          //HttpSession session = request.getSession();

          PiePlot3D plot = new PiePlot3D(data);//����һ��3D��ͼ 
          //plot.setURLGenerator(new StandardPieURLGenerator("DegreedView.jsp"));//�趨ͼƬ���� 
          chart = new JFreeChart("",JFreeChart.DEFAULT_TITLE_FONT, plot, true); 
          chart.setBackgroundPaint(java.awt.Color.white);//��ѡ������ͼƬ����ɫ 
          chart.setTitle(map.get("courseName")+"ͨ����");//��ѡ������ͼƬ���� 
          plot.setToolTipGenerator(new StandardPieToolTipGenerator()); 
         
      }else{
      
      
      DefaultCategoryDataset dataset = new DefaultCategoryDataset();
      //���ݳ�ʼ��
    if(list!=null&&list.size()>0){
    	for(int i=0;i<list.size();i++){
    		Grades gd = list.get(i);   
            dataset.addValue(gd.getGchi(), gd.getGname(), gd.getChiName());
            dataset.addValue(gd.getGmath(), gd.getGname(), gd.getMathName());
            dataset.addValue(gd.getGeng(), gd.getGname(), gd.getEngName());
            dataset.addValue(gd.getGsci(), gd.getGname(), gd.getSciName());
            dataset.addValue(gd.getGart(), gd.getGname(), gd.getArtName());
    	}
    }
      
      //HttpSession session = request.getSession();

    
      //plot.setURLGenerator(new StandardPieURLGenerator("DegreedView.jsp"));//�趨ͼƬ���� 
    chart = ChartFactory.createBarChart3D("ѧ���ɼ�ͳ�Ʊ�","ѧ����","����",dataset,PlotOrientation.VERTICAL,true,false,false);
    chart.setBackgroundPaint(Color.WHITE);
    CategoryPlot plot = chart.getCategoryPlot();

    CategoryAxis domainAxis = plot.getDomainAxis();
    //domainAxis.setVerticalCategoryLabels(false);
    plot.setDomainAxis(domainAxis);

    BarRenderer3D renderer = new BarRenderer3D();
    renderer.setBaseOutlinePaint(Color.BLACK);

    //����ÿ��������������ƽ������֮�����
    renderer.setItemMargin(0.1);
    //��ʾÿ��������ֵ�����޸ĸ���ֵ����������
    renderer.setItemLabelGenerator(new StandardCategoryItemLabelGenerator());
    renderer.setItemLabelsVisible(true);
    plot.setRenderer(renderer);

    // ��������͸����
    plot.setForegroundAlpha(0.8f);
    }

      PrintWriter w = new PrintWriter(out);//���MAP��Ϣ 
      //500��ͼƬ���ȣ�300��ͼƬ�߶�
      //String filename = ServletUtilities.saveChartAsPNG(chart,500,300,info,session); 
      StandardEntityCollection sec = new StandardEntityCollection(); 
      ChartRenderingInfo info = new ChartRenderingInfo(sec);
      String filename = ServletUtilities.saveChartAsJPEG(chart,500,300,info,session); 
      ChartUtilities.writeImageMap(w,"map0",info,false); 

      String graphURL = request.getContextPath() + "/DisplayChart?filename=" + filename;
%>
			<img src="<%= graphURL %>" width="600" height="400">


		</div>
	</div>

	<div class="footer"></div>
</body>
</html>