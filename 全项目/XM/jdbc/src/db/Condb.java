package db;
import java.sql.DriverManager;
import java.sql.SQLException;
import com.mysql.jdbc.Connection;

public class Condb {
	private final String	db_url	= "jdbc:mysql://localhost:3306/info";	// 连接数据库字符串
	private final String	db_user	= "root";								// 数据库用户名
	private final String	db_paw	= "root";								// 数据库密码
	private Connection		conn;
	
	public static void main(String[] args) {
		// 这里是测试内容
	}

	public Condb() throws ClassNotFoundException, SQLException {
	}

	public boolean initialize() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = (Connection) DriverManager.getConnection(db_url, db_user, db_paw);
			conn.setAutoCommit(false);
			return true;
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return false;
		}
	}
}
