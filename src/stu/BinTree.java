package stu;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class BinTree{
    Node root=null;
    private class Node{
        Node parent=null;
        Node leftChild=null;
        Node rightChild=null;
        int key;
        public Node(int data) {
            this.key=data;
        }
    }

	static Connection con;
	static Statement st;
	static ResultSet rs;
	List<String> sco1;
	int snum;
	
	public List<String> getMsg(int num){
		sco1=new ArrayList<String>();
		snum=num;
		getBinCon();
		return sco1;
	}
	
	public void getBinCon(){
		int datas[]=new int[30];
		try {
			int num=0;
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3308/stu?useUnicode=true&characterEncoding=gbk","root","yc201409");
			st=con.createStatement();
			rs=st.executeQuery("select m_id from msg");
			while(rs.next()){
				datas[num++]=Integer.valueOf(rs.getString(1));
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
        BinTree tree=new BinTree(datas);
        sco1=tree.search(snum);        //��ѯ���
	}
	
	public BinTree(){
		
	}
	
    public BinTree(int[] datas) {
        buildTree(datas);
    }
    
    private void buildTree(int[] datas) {
        for (int i = 0; i < datas.length; i++) {
            Node node=new Node(datas[i]);
            insertNode(node);
        }
    }
    
    private void insertNode(Node node) {    //������
        Node next=this.root;    
        Node cur=null;    //�������浱ǰ���
        while(next!=null){    //������Ҷ�ӽ��ʱ��ȷ��λ�ã�
            cur=next;
            if(node.key>=cur.key){
                next=next.rightChild;
            }else{
                next=next.leftChild;
            }
        }
        node.parent=cur;    //����ý�㣡
        if(cur==null){
            this.root=node;  //����Ϊ��������������Ǹ��ڵ�
        }else if(node.key>=cur.key){
            cur.rightChild=node;
        }else{
            cur.leftChild=node;
        }
    }
	
    //�������
    public List<String> search(int data){
        if((searchNode(new Node(data))) == null){
            System.out.println("���޴���");
        }else{
        	try {
				List<String> sco=new ArrayList<String>();
				rs=st.executeQuery("select g_chi,g_math,g_eng,g_sci,g_art from grades where g_id='"+data+"'");
				while(rs.next()){
					sco.add(rs.getString(1));
					sco.add(rs.getString(2));
					sco.add(rs.getString(3));
					sco.add(rs.getString(4));
					sco.add(rs.getString(5));
					int sum=Integer.parseInt(rs.getString(1))+Integer.parseInt(rs.getString(2))+Integer.parseInt(rs.getString(3))+Integer.parseInt(rs.getString(4))+Integer.parseInt(rs.getString(5));
					sco.add(String.valueOf(sum));
				}
				return sco;
			} catch (SQLException e) {
				e.printStackTrace();
			}
        }
		return null;
    }
    
    private Node searchNode(Node node){    //private���ڲ����ã��������
        if(node==null){
            System.out.println("����Ϊ�գ�����ʧ�ܣ�");
        }else{
            if(root==null){
                System.out.println("����Ϊ������");
            }else{                        //��ʼ����
                boolean isFound=false;    
                Node x=root;
                Node y=null;
                while(!isFound&&x!=null){    //���鵽���ߵ���Ҷ�ӽڵ㻹û�鵽ʱ���սᣡ
                    y=x;
                    if(node.key==x.key){    
                        isFound=true;
                    }else{                    //ͨ���Ƚϴ�С���������
                        if(node.key>x.key){    
                            x=x.rightChild;
                        }else{
                            x=x.leftChild;
                        }
                    }
                }
                if(isFound){    //û�ҵ��Ļ�������󷵻�null
                    return y;
                }
            }
        }
        return null;
    }
  }  