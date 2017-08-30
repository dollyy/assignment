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
        sco1=tree.search(snum);        //查询结点
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
    
    private void insertNode(Node node) {    //插入结点
        Node next=this.root;    
        Node cur=null;    //用来保存当前结点
        while(next!=null){    //当到达叶子结点时，确认位置！
            cur=next;
            if(node.key>=cur.key){
                next=next.rightChild;
            }else{
                next=next.leftChild;
            }
        }
        node.parent=cur;    //插入该结点！
        if(cur==null){
            this.root=node;  //该树为空树，所以这个是根节点
        }else if(node.key>=cur.key){
            cur.rightChild=node;
        }else{
            cur.leftChild=node;
        }
    }
	
    //搜索结点
    public List<String> search(int data){
        if((searchNode(new Node(data))) == null){
            System.out.println("查无此人");
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
    
    private Node searchNode(Node node){    //private供内部调用，搜索结点
        if(node==null){
            System.out.println("输入为空，查找失败！");
        }else{
            if(root==null){
                System.out.println("该树为空树！");
            }else{                        //开始查找
                boolean isFound=false;    
                Node x=root;
                Node y=null;
                while(!isFound&&x!=null){    //当查到或者到了叶子节点还没查到时，终结！
                    y=x;
                    if(node.key==x.key){    
                        isFound=true;
                    }else{                    //通过比较大小往下面查找
                        if(node.key>x.key){    
                            x=x.rightChild;
                        }else{
                            x=x.leftChild;
                        }
                    }
                }
                if(isFound){    //没找到的话，在最后返回null
                    return y;
                }
            }
        }
        return null;
    }
  }  