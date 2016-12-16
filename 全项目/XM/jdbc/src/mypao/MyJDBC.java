package mypao;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
import java.sql.DriverManager;
import java.sql.SQLException;

//注意CLASSPATH的设定要包含mysqljdbc jar,在TOMCAT下要放到对应的LIB文件夹中
/*
F:\JDBC>set classpath=%classpath%;./mysql-connector-java-5.1.40-bin.jar

*/
class Student {
	private String Id;
	private String Name;
	private String Sex;
	private int Age;

	Student(String Name, String Sex, int Age) {
		this.Id = null; // default
		this.Name = Name;
		this.Sex = Sex;
		this.Age = Age;
	}

	public String getId() {
		return Id;
	}

	public void setId(String Id) {
		this.Id = Id;
	}

	public String getName() {
		return Name;
	}

	public void setName(String Name) {
		this.Name = Name;
	}

	public String getSex() {
		return Sex;
	}

	public void setSex(String Sex) {
		this.Sex = Sex;
	}

	public int getAge() {
		return Age;
	}

	public void setage(int Age) {
		this.Age = Age;
	}
}

public class MyJDBC {
	private static Connection getConn() {
		String driver = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/dav";
		String username = "root";
		String password = "root";
		Connection conn = null;
		try {
			Class.forName(driver); // classLoader,加载对应驱动
			System.out.println("--------ok1------------");
			conn = (Connection) DriverManager.getConnection(url, username, password);

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}

	private static int insert(Student student) {
		Connection conn = getConn();
		int i = 0;
		String sql = "insert into students (Name,Sex,Age) values(?,?,?)";
		PreparedStatement pstmt;
		try {
			pstmt = (PreparedStatement) conn.prepareStatement(sql);
			pstmt.setString(1, student.getName());
			pstmt.setString(2, student.getSex());
			pstmt.setInt(3, student.getAge());
			i = pstmt.executeUpdate();
			pstmt.close();// �ر�˳���Ǵ���˳�����˳���ȴ����ĺ�رա�
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return i;
	}

	public void start() {

		Student myStudent = new Student("name1", "sex1", 25);
		insert(myStudent);

	}

}