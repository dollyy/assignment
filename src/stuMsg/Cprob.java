package stuMsg;

public class Cprob
{
	public Cprob()
	{ 
		//无参构造方法
	}
	public Cprob(String p_id, String p_q1, String p_q2, String p_q3)
	{
		super();
		this.p_id = p_id;
		this.p_q1 = p_q1;
		this.p_q2 = p_q2;
		this.p_q3 = p_q3;
	}
	private String p_id;
	private String p_q1;
	private String p_q2;
	private String p_q3;
	public String getP_id()
	{
		return p_id;
	}
	public void setP_id(String p_id)
	{
		this.p_id = p_id;
	}
	public String getP_q1()
	{
		return p_q1;
	}
	public void setP_q1(String p_q1)
	{
		this.p_q1 = p_q1;
	}
	public String getP_q2()
	{
		return p_q2;
	}
	public void setP_q2(String p_q2)
	{
		this.p_q2 = p_q2;
	}
	public String getP_q3()
	{
		return p_q3;
	}
	public void setP_q3(String p_q3)
	{
		this.p_q3 = p_q3;
	}
	
}
