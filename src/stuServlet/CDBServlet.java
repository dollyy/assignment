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
	
	
	//===============�ɷ�װ======================//
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
    //=====================�ɷ�װ======================//
	
	
	private boolean open = false;
	public boolean isopen(){
		return open;
	}
	
	public boolean reconn(){
		//�ٴ�����֮ǰҪ�ȹرմ򿪵����ݿ�ָ��
		close();
		return conn();
	}
	
	//��������
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
	
	//�ر����ݿ�
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
	
	//�����ļ������ֵ�ó�����ʼ��
	
	protected ServletConfig config = null;  //config���β�
	public void init(ServletConfig config) throws ServletException
	{
		//д�ļ�ʱsuper����ǰ�棬�ر�ʱsuper�������
		super.init(config);
		this.config = config;
		driver = config.getInitParameter("driver");  //getInitParameter��servlet�����
		url = config.getInitParameter("url");
		user = config.getInitParameter("user");
		password = config.getInitParameter("password");
		conn();
	}

	//�ر�servlet
	public void destroy()
	{
		//�ر�ʱ���ȹر������ģ�super�����
		close();
		super.destroy();
	}
}