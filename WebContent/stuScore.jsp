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
<title>学生端首页</title>
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
	<div class="logo">学校logo</div>
	<div class="center">交流中心</div>
	<div class="pic">
		<a href="person.jsp">个人中心</a>
	</div>
	<div class="stuscore">

		<p>&nbsp;</p>
		<p>&nbsp;</p>
		<p>&nbsp;</p>
		<p>&nbsp;</p>
		<p>&nbsp;</p>
		<p>&nbsp;</p>
		<p align="center" >&nbsp;&nbsp;<form action="stuScore" name="form1" method="post">
		学生姓名：<input type="text" name="stuName"  >&nbsp;&nbsp;&nbsp;&nbsp;及格率：
		<select name="courseName">
	  <option value="">---请选择---</option>
		
		<option value="chi">语文</option>
	    <option value="math">数学</option>
	    <option value="eng">英语</option>
	    <option value="sci">科学</option>
		<option value="art">艺术</option>
		
		</select> &nbsp;&nbsp;<input type="submit" name="submit1" value="查询" >
		</form>
		</p>
        
		<p>&nbsp;</p>
		<table width="650" border="1" align="center" cellpadding="0"
			cellspacing="0">
			<tr>
				<th width="25%" height="29" scope="col">&nbsp;</th>
				<th width="15%" scope="col"><span class="STYLE1">语文</span></th>
				<th width="15%" scope="col"><span class="STYLE1">数学</span></th>
				<th width="15%" scope="col"><span class="STYLE1">英语</span></th>
				<th width="15%" scope="col"><span class="STYLE1">科学</span></th>
				<th width="15%" scope="col"><span class="STYLE1">美术</span></th>
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

    //创建主题样式
      StandardChartTheme standardChartTheme = new StandardChartTheme("CN");
      //设置标题字体
      standardChartTheme.setExtraLargeFont(new Font("隶书", Font.BOLD, 20));
      //设置图例的字体
      standardChartTheme.setRegularFont(new Font("宋书", Font.PLAIN, 15));
      //设置轴向的字体
      standardChartTheme.setLargeFont(new Font("宋书", Font.PLAIN, 15));
      //应用主题样式
      ChartFactory.setChartTheme(standardChartTheme);
      if(map!=null){
    	  DefaultPieDataset data = new DefaultPieDataset(); 
          //数据初始化
          float passRate = (Float)map.get("passRate");
          float nopassRate = 100-(Float)map.get("passRate");
          data.setValue("及格"+passRate+"%",passRate); 
          data.setValue("不及格"+nopassRate+"%",nopassRate); 
          
          //HttpSession session = request.getSession();

          PiePlot3D plot = new PiePlot3D(data);//生成一个3D饼图 
          //plot.setURLGenerator(new StandardPieURLGenerator("DegreedView.jsp"));//设定图片链接 
          chart = new JFreeChart("",JFreeChart.DEFAULT_TITLE_FONT, plot, true); 
          chart.setBackgroundPaint(java.awt.Color.white);//可选，设置图片背景色 
          chart.setTitle(map.get("courseName")+"通过率");//可选，设置图片标题 
          plot.setToolTipGenerator(new StandardPieToolTipGenerator()); 
         
      }else{
      
      
      DefaultCategoryDataset dataset = new DefaultCategoryDataset();
      //数据初始化
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

    
      //plot.setURLGenerator(new StandardPieURLGenerator("DegreedView.jsp"));//设定图片链接 
    chart = ChartFactory.createBarChart3D("学生成绩统计表","学生名","分数",dataset,PlotOrientation.VERTICAL,true,false,false);
    chart.setBackgroundPaint(Color.WHITE);
    CategoryPlot plot = chart.getCategoryPlot();

    CategoryAxis domainAxis = plot.getDomainAxis();
    //domainAxis.setVerticalCategoryLabels(false);
    plot.setDomainAxis(domainAxis);

    BarRenderer3D renderer = new BarRenderer3D();
    renderer.setBaseOutlinePaint(Color.BLACK);

    //设置每个地区所包含的平行柱的之间距离
    renderer.setItemMargin(0.1);
    //显示每个柱的数值，并修改该数值的字体属性
    renderer.setItemLabelGenerator(new StandardCategoryItemLabelGenerator());
    renderer.setItemLabelsVisible(true);
    plot.setRenderer(renderer);

    // 设置柱的透明度
    plot.setForegroundAlpha(0.8f);
    }

      PrintWriter w = new PrintWriter(out);//输出MAP信息 
      //500是图片长度，300是图片高度
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