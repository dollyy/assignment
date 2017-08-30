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
<title>学生及格率</title>
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
  <div class="logo"><a href="index.jsp">南京晓庄学院附属小学</a></div>
  <div class="link_person"><a href="person">个人中心</a></div>
	<div class="passrate">

		<p>&nbsp;</p>
		<p>&nbsp;</p>
		<p>&nbsp;</p>
		<p>&nbsp;</p>
		<p>&nbsp;</p>
		<p>&nbsp;</p>
		<p align="center" >&nbsp;&nbsp;
		<form action="PassrateServlet" name="form1" method="post">
		及格率：<select name="courseName">
	  <option value="">---请选择---</option>
		
		<option value="chi">语文</option>
	    <option value="math">数学</option>
	    <option value="eng">英语</option>
	    <option value="sci">科学</option>
		<option value="art">艺术</option>
		
		</select> &nbsp;&nbsp;<input type="submit" name="submit1" value="查询" >
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
      String graphURL = "";
      if(map!=null){
    	  DefaultPieDataset data = new DefaultPieDataset(); 
          //数据初始化
          
          double passRate = Math.rint((Float)map.get("passRate"));
          double nopassRate = 100-passRate;
          data.setValue("及格"+passRate+"%",passRate); 
          data.setValue("不及格"+nopassRate+"%",nopassRate); 
          
          //HttpSession session = request.getSession();

          PiePlot3D plot = new PiePlot3D(data);//生成一个3D饼图 
          //plot.setURLGenerator(new StandardPieURLGenerator("DegreedView.jsp"));//设定图片链接 
          chart = new JFreeChart("",JFreeChart.DEFAULT_TITLE_FONT, plot, true); 
          chart.setBackgroundPaint(java.awt.Color.white);//可选，设置图片背景色 
          chart.setTitle(map.get("courseName")+"通过率");//可选，设置图片标题 
          plot.setToolTipGenerator(new StandardPieToolTipGenerator()); 
          PrintWriter w = new PrintWriter(out);//输出MAP信息 
          //500是图片长度，300是图片高度
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
    		<a>意见反馈</a>
    		<a>联系我们</a>
    	</div>
    	<div class="f2">
    		Copyright&nbsp;&copy;2016&nbsp;&nbsp;学生作业系统
    	</div>
	</div>
</body>
</html>