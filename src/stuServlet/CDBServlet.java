package stuServlet;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

public class CDBServlet extends HttpServlet
{
	protected Connection conn = null;
	protected Statement  stmt = null;
	protected ResultSet  rs   = null;
	
	
	//===============可封装======================//
	private String driver;
	private String url;
	private String user;
	private String password;
	
	public String getDriver()
	{
		return driver;
	}
	public void setDriver(String driver)
	{
		this.driver = driver;
	}
	public String getUrl()
	{
		return url;
	}
	public void setUrl(String url)
	{
		this.url = url;
	}
	public String getUser()
	{
		return user;
	}
	public void setUser(String user)
	{
		this.user = user;
	}
	public String getPassword()
	{
		return password;
	}
	public void setPassword(String password)
	{
		this.password = password;
	}
    //=====================可封装======================//
	
	
	private boolean open = false;
	public boolean isopen(){
		return open;
	}
	
	public boolean reconn(){
		//再次连接之前要先关闭打开的数据库指令
		close();
		return conn();
	}
	
	//尝试连接
	protected boolean conn(){
		try
		{
			Class.forName(driver);
			conn = DriverManager.getConnection(url,user,password);
			stmt = conn.createStatement();
			open = true;
		} catch (ClassNotFoundException e)
		{
			e.printStackTrace();
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
		return open;
	}
	
	//关闭数据库
	protected boolean close(){
		try
		{
			if(rs != null && !rs.isClosed()){
				rs.close();
			}
			if(stmt != null && !stmt.isClosed()){
				stmt.close();
			}
			if(conn != null && !conn.isClosed()){
				conn.close();
			}
			
			open = false;
			
			return true;
			
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
		return false;
		
	}
	
	public void init() throws ServletException
	{
		super.init();
		
	}
	
	//配置文件里面的值拿出来初始化
	
	protected ServletConfig config = null;  //config是形参
	public void init(ServletConfig config) throws ServletException
	{
		//写文件时super放在前面，关闭时super放在最后
		super.init(config);
		this.config = config;
		driver = config.getInitParameter("driver");  //getInitParameter是servlet里面的
		url = config.getInitParameter("url");
		user = config.getInitParameter("user");
		password = config.getInitParameter("password");
		conn();
	}

	//关闭servlet
	public void destroy()
	{
		//关闭时，先关闭最后定义的，super放最后
		close();
		super.destroy();
	}
}