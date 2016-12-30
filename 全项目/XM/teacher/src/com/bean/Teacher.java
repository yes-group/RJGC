package com.bean;


import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;


public class Teacher {
/*
 * 建立连接数据库
 * return conn；
 * */
	public static Connection getConn() {
    String driver = "com.mysql.jdbc.Driver";
    String url = "jdbc:mysql://localhost:3306/info";
    String username = "root";
    String password = "root";
    Connection conn = null;
    try {
        Class.forName(driver);
        conn = (Connection) DriverManager.getConnection(url, username, password);
		
    } catch (ClassNotFoundException e) {
    	System.out.println(e.getMessage());
    } catch (Exception e) {
    	System.out.println(e.getMessage());
    }
    return conn;
}
/*插入教师信息
 * ZZ 指插入的信息
 * return true/false
 * 
 * */
public  boolean insert(String zz) {
	 try {
    Connection conn = getConn();
    String sql = "insert into tb_teacher (tno) values(?)";
    PreparedStatement pstmt = (PreparedStatement) conn.prepareStatement(sql); 
    pstmt.setString(1, zz);
    pstmt.executeUpdate();
        pstmt.close();
        conn.close();
    } catch (Exception e) {
    	System.out.println(e.getMessage());
    	return false;
    }
	  return true;
}
/*
删除教师信息
根据参数  d
return true/false
*/
public boolean delete(String d) {
    Connection conn = getConn();
    String sql = "delete from tb_teacher where tno='" + d + "'";
    PreparedStatement pstmt;
    try {
        pstmt = (PreparedStatement) conn.prepareStatement(sql);
        pstmt.executeUpdate();
        pstmt.close();
        conn.close();
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return true;
}
/*修改教师信息
 * return true/false
 * q：输入的信息
 * h：工号
 * l：第几个字段 
 * */
public  boolean update(String q,String h,int l) {
	   try {
    Connection conn = getConn();
    String account="";
    switch(l){
     case 0:
        account="id";
     break;
     case 1:
        account="tno";
     break;
     case 2:
        account="tname";
     break;
     case 3:
         account="sex";
      break;
     case 4:
        account="birthday";
     break;
     case 5:
        account="workday";
     break;
     case 6:
        account="pface";
     break;
     case 7:
        account="origin";
     break;
    }
    String sql = "update tb_teacher set "+account+"='" + q + "' where id='" + h + "'";
    PreparedStatement pstmt;
 
        pstmt = (PreparedStatement) conn.prepareStatement(sql);
        pstmt.executeUpdate();
        pstmt.close();
        conn.close();
    } catch (Exception e) {
    	System.out.println(e.getMessage());
    }

    return true;
}


//查询教师信息   return string（信息）；
public String getAll() {
	String a="";
    try {
    Connection conn = getConn();
    String sql = "select * from tb_teacher";
    PreparedStatement pstmt;
        pstmt = (PreparedStatement)conn.prepareStatement(sql);
        ResultSet rs = pstmt.executeQuery();
        int col = rs.getMetaData().getColumnCount();   	
        while (rs.next()) {  
        	a+="<tr>";
        	 for (int i = 1; i <= col; i++) {
        		 if(i==1){
        			 a+="<td id='td1'><input class='lll' value='"+rs.getString(i)+"'></input></td>"; 
        		 }else{
        		 a+="<td class='td2'><input class='lll' value='"+rs.getString(i)+"'></input></td>";
        		 }                         
              }       		 
        	 a+="</tr>";
        	 System.out.println("");
        }           
    } catch (Exception e) {
    	System.out.println(e.getMessage());
    }
    return a;
}


public static void main(String[] args){
  new Teacher().delete("211");
}

}