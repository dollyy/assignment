package stuServlet;

import java.util.ArrayList;
import java.util.List;

public class BinarySearchTree {
	 // ���ĸ����  
    private TreeNode root = null;  
  
    // ��������б�  
    private List<TreeNode> nodelist = new ArrayList<TreeNode>();  
  
    class TreeNode {  
  
        private int key;  
        private TreeNode leftChild;  
        private TreeNode rightChild;  
        private TreeNode parent;  
  
        public TreeNode(int key, TreeNode leftChild, TreeNode rightChild,  
                TreeNode parent) {  
            this.key = key;  
            this.leftChild = leftChild;  
            this.rightChild = rightChild;  
            this.parent = parent;  
        }  
  
        public int getKey() {  
            return key;  
        }  
  
        public String toString() {  
            String leftkey = (leftChild == null ? "" : String  
                    .valueOf(leftChild.key));  
            String rightkey = (rightChild == null ? "" : String  
                    .valueOf(rightChild.key));  
            return "(" + leftkey + " , " + key + " , " + rightkey + ")";  
        }  
  
    }  
  
    /** 
     * isEmpty: �ж϶���������Ƿ�Ϊ�գ���Ϊ�գ����� true �����򷵻� false . 
     *  
     */  
    public boolean isEmpty() {  
        if (root == null) {  
            return true;  
        } else {  
            return false;  
        }  
    }  
  
    /** 
     * TreeEmpty: ����ĳЩ�������������(����ɾ���ؼ���)��˵������Ϊ�գ����׳��쳣�� 
     */  
    public void TreeEmpty() throws Exception {  
        if (isEmpty()) {  
            throw new Exception("��Ϊ��!");  
        }  
    }  
  
    /** 
     * search: �ڶ���������в�ѯ�����ؼ��� 
     *  
     * @param key 
     *            �����ؼ��� 
     * @return ƥ������ؼ��ֵ������ 
     */  
    public TreeNode search(int key) {  
        TreeNode pNode = root;  
        while (pNode != null && pNode.key != key) {  
            if (key < pNode.key) {  
                pNode = pNode.leftChild;  
            } else {  
                pNode = pNode.rightChild;  
            }  
        }  
        return pNode;  
    }  
  
    /** 
     * minElemNode: ��ȡ����������е���С�ؼ��ֽ�� 
     *  
     * @return �������������С�ؼ��ֽ�� 
     * @throws Exception 
     *             ����Ϊ�գ����׳��쳣 
     */  
    public TreeNode minElemNode(TreeNode node) throws Exception {  
        if (node == null) {  
            throw new Exception("��Ϊ�գ�");  
        }  
        TreeNode pNode = node;  
        while (pNode.leftChild != null) {  
            pNode = pNode.leftChild;  
        }  
        return pNode;  
    }  
  
    /** 
     * maxElemNode: ��ȡ����������е����ؼ��ֽ�� 
     *  
     * @return ��������������ؼ��ֽ�� 
     * @throws Exception 
     *             ����Ϊ�գ����׳��쳣 
     */  
    public TreeNode maxElemNode(TreeNode node) throws Exception {  
        if (node == null) {  
            throw new Exception("��Ϊ�գ�");  
        }  
        TreeNode pNode = node;  
        while (pNode.rightChild != null) {  
            pNode = pNode.rightChild;  
        }  
        return pNode;  
    }  
  
    /** 
     * successor: ��ȡ����������������˳���µĺ�̽�� 
     *  
     * @param node 
     *            �������еĽ�� 
     * @return ���ý������������˳���µĺ�̽�㣬�򷵻����̽�㣻���򷵻� null 
     * @throws Exception 
     */  
    public TreeNode successor(TreeNode node) throws Exception {  
        if (node == null) {  
            return null;  
        }  
  
        // ���ý�����������Ϊ�գ������̽������������е���С�ؼ��ֽ��  
        if (node.rightChild != null) {  
            return minElemNode(node.rightChild);  
        }  
        // ���ý��������Ϊ��  
        TreeNode parentNode = node.parent;  
        while (parentNode != null && node == parentNode.rightChild) {  
            node = parentNode;  
            parentNode = parentNode.parent;  
        }  
        return parentNode;  
    }  
  
    /** 
     * precessor: ��ȡ����������������˳���µ�ǰ����� 
     *  
     * @param node 
     *            �������еĽ�� 
     * @return ���ý������������˳���µ�ǰ����㣬�򷵻���ǰ����㣻���򷵻� null 
     * @throws Exception 
     */  
    public TreeNode precessor(TreeNode node) throws Exception {  
        if (node == null) {  
            return null;  
        }  
  
        // ���ý�����������Ϊ�գ�����ǰ���������������е����ؼ��ֽ��  
        if (node.leftChild != null) {  
            return maxElemNode(node.leftChild);  
        }  
        // ���ý��������Ϊ��  
        TreeNode parentNode = node.parent;  
        while (parentNode != null && node == parentNode.leftChild) {  
            node = parentNode;  
            parentNode = parentNode.parent;  
        }  
        return parentNode;  
    }  
  
    /** 
     * insert: �������ؼ��ֲ��뵽����������� 
     *  
     * @param key 
     *            �����ؼ��� 
     */  
    public void insert(int key) {  
        TreeNode parentNode = null;  
        TreeNode newNode = new TreeNode(key, null, null, null);  
        TreeNode pNode = root;  
        if (root == null) {  
            root = newNode;  
            return;  
        }  
        while (pNode != null) {  
            parentNode = pNode;  
            if (key < pNode.key) {  
                pNode = pNode.leftChild;  
            } else if (key > pNode.key) {  
                pNode = pNode.rightChild;  
            } else {  
                // �����Ѵ���ƥ������ؼ��ֵĽ�㣬��ʲô������ֱ�ӷ���  
                return;  
            }  
        }  
        if (key < parentNode.key) {  
            parentNode.leftChild = newNode;  
            newNode.parent = parentNode;  
        } else {  
            parentNode.rightChild = newNode;  
            newNode.parent = parentNode;  
        }  
  
    }  
  
    /** 
     * insert: �Ӷ����������ɾ��ƥ������ؼ�����Ӧ������� 
     *  
     * @param key 
     *            �����ؼ��� 
     */  
    public void delete(int key) throws Exception {  
        TreeNode pNode = search(key);  
        if (pNode == null) {  
            throw new Exception("���в�����Ҫɾ���Ĺؼ���!");  
        }  
        delete(pNode);  
    }  
  
    /** 
     * delete: �Ӷ����������ɾ�������Ľ��. 
     *  
     * @param pNode 
     *            Ҫɾ���Ľ�� 
     *  
     *            ǰ�������� ��������ڶ�����������Ѿ����� 
     * @throws Exception 
     */  
    private void delete(TreeNode pNode) throws Exception {  
        if (pNode == null) {  
            return;  
        }  
        if (pNode.leftChild == null && pNode.rightChild == null) { // �ý��������ӽ�㣬Ҳ���Һ��ӽ��  
            TreeNode parentNode = pNode.parent;  
            if (pNode == parentNode.leftChild) {  
                parentNode.leftChild = null;  
            } else {  
                parentNode.rightChild = null;  
            }  
            return;  
        }  
        if (pNode.leftChild == null && pNode.rightChild != null) { // �ý�����ӽ��Ϊ�գ��Һ��ӽ��ǿ�  
            TreeNode parentNode = pNode.parent;  
            if (pNode == parentNode.leftChild) {  
                parentNode.leftChild = pNode.rightChild;  
                pNode.rightChild.parent = parentNode;  
            } else {  
                parentNode.rightChild = pNode.rightChild;  
                pNode.rightChild.parent = parentNode;  
            }  
            return;  
        }  
        if (pNode.leftChild != null && pNode.rightChild == null) { // �ý�����ӽ��ǿգ��Һ��ӽ��Ϊ��  
            TreeNode parentNode = pNode.parent;  
            if (pNode == parentNode.leftChild) {  
                parentNode.leftChild = pNode.leftChild;  
                pNode.rightChild.parent = parentNode;  
            } else {  
                parentNode.rightChild = pNode.leftChild;  
                pNode.rightChild.parent = parentNode;  
            }  
            return;  
        }  
        // �ý�����Һ��ӽ����ǿգ���ɾ���ý��ĺ�̽�㣬���øú�̽��ȡ���ý��  
        TreeNode successorNode = successor(pNode);  
        delete(successorNode);  
        pNode.key = successorNode.key;  
    }  
  
    /** 
     * inOrderTraverseList: ��ö���������������������б� 
     *  
     * @return ����������������������б� 
     */  
    public List<TreeNode> inOrderTraverseList() {  
        if (nodelist != null) {  
            nodelist.clear();  
        }  
        inOrderTraverse(root);  
        return nodelist;  
    }  
  
    /** 
     * inOrderTraverse: �Ը����������������������� 
     *  
     * @param root 
     *            ��������������ĸ���� 
     */  
    private void inOrderTraverse(TreeNode root) {  
        if (root != null) {  
            inOrderTraverse(root.leftChild);  
            nodelist.add(root);  
            inOrderTraverse(root.rightChild);  
        }  
    }  
  
    /** 
     * toStringOfOrderList: ��ȡ����������йؼ��ֵ������б� 
     *  
     * @return ����������йؼ��ֵ������б� 
     */  
    public String toStringOfOrderList() {  
        StringBuilder sbBuilder = new StringBuilder(" [ ");  
        for (TreeNode p : inOrderTraverseList()) {  
            sbBuilder.append(p.key);  
            sbBuilder.append(" ");  
        }  
        sbBuilder.append("]");  
        return sbBuilder.toString();  
    }  
  
    /** 
     * ��ȡ�ö�����������ַ�����ʾ 
     */  
    public String toString() {  
        StringBuilder sbBuilder = new StringBuilder(" [ ");  
        for (TreeNode p : inOrderTraverseList()) {  
            sbBuilder.append(p);  
            sbBuilder.append(" ");  
        }  
        sbBuilder.append("]");  
        return sbBuilder.toString();  
    }  
  
    public TreeNode getRoot() {  
        return root;  
    }  
  
    public static void testNode(BinarySearchTree bst, TreeNode pNode)  
            throws Exception {  
        System.out.println("�����: " + pNode);  
        System.out.println("ǰ�����: " + bst.precessor(pNode));  
        System.out.println("��̽��: " + bst.successor(pNode));  
    }  
  
    public static void testTraverse(BinarySearchTree bst) {  
        System.out.println("������������" + bst);  
        System.out.println("���������ת��Ϊ�����б�: " + bst.toStringOfOrderList());  
    }  
  
    
  

}
