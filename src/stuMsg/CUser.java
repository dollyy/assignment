package stuMsg;

public class CUser
{
	//�޲͹��캯���������ʱ��Ҫ��====����Ҫ��
	public CUser(){
		
	}
	
    //ʹ���ֶ������Ѕ����캯��
	public CUser(String s_class, String s_name, String s_id, String s_pwd)
	{
		super();
		this.s_class = s_class;
		this.s_name = s_name;
		this.s_id = s_id;
		this.s_pwd = s_pwd;
	}

	//�༶
	private String s_class;
	private String s_name;
	private String s_id;
	private String s_pwd;
	public String getS_class()
	{
		return s_class;
	}

	public void setS_class(String s_class)
	{
		this.s_class = s_class;
	}

	public String getS_name()
	{
		return s_name;
	}

	public void setS_name(String s_name)
	{
		this.s_name = s_name;
	}

	public String getS_id()
	{
		return s_id;
	}

	public void setS_id(String s_id)
	{
		this.s_id = s_id;
	}

	public String getS_pwd()
	{
		return s_pwd;
	}

	public void setS_pwd(String s_pwd)
	{
		this.s_pwd = s_pwd;
	}
}