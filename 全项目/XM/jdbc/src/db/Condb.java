package db;

import java.security.MessageDigest;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

public class Condb {
	private final String db_url = "jdbc:mysql://localhost:3306/info"; // 连接数据库字符串
	private final String db_user = "root"; // 数据库用户名
	private final String db_paw = "root"; // 数据库密码
	private Connection conn;
	private PreparedStatement pstmt;

	public static void main(String[] args) {
		// 这里是测试内容
		Condb name = new Condb();
		name.initialize();
		// System.out.println(name.login(1143910315, "1143910315", 0));
		// name.finish();
	}

	public boolean initialize() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = (Connection) DriverManager.getConnection(db_url, db_user, db_paw);
			conn.setAutoCommit(false);
			pstmt = (PreparedStatement) conn.prepareStatement("");
			return true;
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return false;
		}
	}

	public boolean finish() {
		try {
			conn.commit();
			return false;
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			return false;
		} finally {
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
				return false;
			}
		}
	}

	public String inquery() {
		String result = null;
		try {
		} catch (Exception e) {
		}
		return result;
	}

	public String login(int user, String password, int id) {
		String result = null;
		try {
			ArrayList<String> arrayList = new ArrayList<String>();
			if (Query("select id from tb_user where user=" + user + " and password=\"" + password + "\"", arrayList)
					&& arrayList.size() == 1 && Integer.valueOf(arrayList.get(0)) == id) {
				result = makecookie(user);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return result;
	}

	private String makecookie(int user) {
		String md5 = null;
		try {
			String temp = null;
			boolean success = false;
			ArrayList<String> arrayList = new ArrayList<String>();
			long time = new Date().getTime();
			short i = 0;
			do {
				if (i++ == 7) {
					break;
				}
				time++;
				temp = enMD5(String.valueOf(time + user));
				success = Query("select user from tb_cookie where cookie=\"" + temp + "\"", arrayList);
			} while (success == false || arrayList.size() != 0);
			if (temp != null) {
				if (Query("select count(*) from tb_cookie where user=" + user, arrayList) && arrayList.size() == 1) {
					int count = Integer.valueOf(arrayList.get(0));
					if (count == 0) {
						if (Query("insert into tb_cookie (user, cookie,time) values (" + user + ",\"" + temp + "\","
								+ time + ")") == 1) {
							md5 = temp;
						}
					} else {
						if (Query("update tb_cookie set cookie =\"" + temp + "\", time = " + time + " where user ="
								+ user) == 1) {
							md5 = temp;
						}
					}
				}
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return md5;
	}

	private int Query(String sql) {
		int change = -1;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			change = pstmt.executeUpdate(sql);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return change;
	}

	private boolean Query(String sql, ArrayList<String> list) {
		try {
			list.clear();
			ResultSet eq = pstmt.executeQuery(sql);
			ResultSetMetaData metaData = eq.getMetaData();
			int j = metaData.getColumnCount();
			while (eq.next()) {
				for (int i = 1; i <= j; i++) {
					String aString = "";
					try {
						aString = eq.getString(i);
					} catch (Exception e) {
					}
					list.add(aString);
				}
			}
			eq.close();
			return true;
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return false;
		}
	}

	private String enMD5(String s) {
		char hexDigits[] = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F' };
		try {
			byte[] btInput = s.getBytes();
			// 获得MD5摘要算法的 MessageDigest 对象
			MessageDigest mdInst = MessageDigest.getInstance("MD5");
			// 使用指定的字节更新摘要
			mdInst.update(btInput);
			// 获得密文
			byte[] md = mdInst.digest();
			// 把密文转换成十六进制的字符串形式
			int j = md.length;
			char str[] = new char[j * 2];
			int k = 0;
			for (int i = 0; i < j; i++) {
				byte byte0 = md[i];
				str[k++] = hexDigits[byte0 >>> 4 & 0xf];
				str[k++] = hexDigits[byte0 & 0xf];
			}
			return new String(str);
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return "";
		}
	}
}
