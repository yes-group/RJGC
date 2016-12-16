package jdbc;
import java.security.MessageDigest;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.util.ArrayList;
import java.util.Date;
import org.json.JSONArray;
import org.json.JSONObject;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

public class Jdbc {
	private final String	db_url	= "jdbc:mysql://localhost:3306/info";
	private final String	db_user	= "root";
	private final String	db_paw	= "root";
	
	public static void main(String[] args) {
		//System.out.println(new Jdbc().select("tno as `0`,tname as `1`,sex as `2`,birthday as `3`,workday as `4`,position as `5`,pface as `6`,origin as `7`", "tb_teacher", "1=1"));
		// System.out.println(new Jdbc().makecookie(1143910315));
		// System.out.println(new Jdbc().cheakcookie("8CBCE57D5988C0FD54A62DE99C2471CC", 0));
		System.out.println(new Jdbc().update("tb_teacher", "tname", "死大神", "tno=52336"));
	}
	
	public int login(int user, String password, int id) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String sql = "select id from tb_user where user=? and password=?";
			Connection conn = (Connection) DriverManager.getConnection(db_url, db_user, db_paw);
			PreparedStatement pstmt = (PreparedStatement) conn.prepareStatement(sql);
			pstmt.setInt(1, user);
			pstmt.setString(2, password);
			ResultSet eq = pstmt.executeQuery();
			if (eq.next()) {
				int i = eq.getInt(1);
				pstmt.close();
				conn.close();
				if (i == id) {
					return 0;
				} else {
					return 1;
				}
			}
			pstmt.close();
			conn.close();
			return -1;
		} catch (Exception e) {
			return -2;
		}
	}
	
	public String getcookieuser(String cookie) {
		try {
			ArrayList<Object> list = new ArrayList<Object>();
			String sql = "select user from tb_cookie where cookie=\"" + cookie + "\"";
			if (cheakislive(sql, list, 1, 1)) {
				return "管理员：" + (int) list.get(0) + "，欢迎您";
			} else {
				return "欢迎您";
			}
		} catch (Exception e) {
			return "欢迎您";
		}
	}
	
	public boolean cheakcookie(String cookie, int power) {
		try {
			ArrayList<Object> list = new ArrayList<Object>();
			String sql = "select cookie,user from tb_cookie where cookie=\"" + cookie + "\"";
			if (cheakislive(sql, list, 2, 2)) {
				if (list.get(0).equals(cookie)) {
					int user = (int) list.get(1);
					sql = "select id from tb_user where user=" + user;
					if (cheakislive(sql, list, 1, 1)) {
						if ((int) list.get(0) <= power) {
							return true;
						}
					}
				}
			}
			return false;
		} catch (Exception e) {
			return false;
		}
	}
	public boolean cheakcookie(String cookie, int power,int no) {
		try {
			ArrayList<Object> list = new ArrayList<Object>();
			String sql = "select cookie,user from tb_cookie where cookie=\"" + cookie + "\"";
			if (cheakislive(sql, list, 2, 2)) {
				if (list.get(0).equals(cookie)) {
					int user = (int) list.get(1);
					if (user==no) {
						return true;
					} else {
						sql = "select id from tb_user where user=" + user;
						if (cheakislive(sql, list, 1, 1)) {
							if ((int) list.get(0) <= power) {
								return true;
							}
						}
					}
				}
			}
			return false;
		} catch (Exception e) {
			return false;
		}
	}
	private boolean cheakislive(String sql, ArrayList<Object> list, int safemin, int safemax) {
		try {
			list.clear();
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = (Connection) DriverManager.getConnection(db_url, db_user, db_paw);
			PreparedStatement pstmt = (PreparedStatement) conn.prepareStatement(sql);
			ResultSet eq = pstmt.executeQuery();
			ResultSetMetaData metaData = eq.getMetaData();
			int j = metaData.getColumnCount();
			while (eq.next()) {
				for (int i = 1; i <= j; i++) {
					list.add(eq.getObject(i));
				}
			}
			pstmt.close();
			conn.close();
			if ((safemin <= list.size() || safemin == -1) && (list.size() <= safemax || safemax == -1)) {
				return true;
			}
			list.clear();
			return false;
		} catch (Exception e) {
			return false;
		}
	}
	
	public String makecookie(int user) {
		try {
			String md5;
			long time = new Date().getTime();
			short i = 0;
			do {
				if (i == 7) {
					return "";
				}
				i++;
				time++;
				md5 = enMD5(String.valueOf(time + user));
			} while (Repeat(md5));
			if (update(user, md5, time)) {
				return md5;
			} else {
				return "";
			}
		} catch (Exception e) {
			return "";
		}
	}
	
	private boolean update(int user, String md5, long time) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String sql = "select count(*) from tb_cookie where user=?";
			Connection conn = (Connection) DriverManager.getConnection(db_url, db_user, db_paw);
			conn.setAutoCommit(false);
			PreparedStatement pstmt = (PreparedStatement) conn.prepareStatement(sql);
			pstmt.setInt(1, user);
			ResultSet eq = pstmt.executeQuery();
			if (eq.next()) {
				int i = eq.getInt(1);
				if (i == 0) {
					sql = "insert into tb_cookie (user, cookie,time) values (" + user + ",\"" + md5 + "\"," + time + ")";
					int change = pstmt.executeUpdate(sql);
					if (change == 1) {
						conn.commit();
						pstmt.close();
						conn.close();
						return true;
					} else {
						conn.rollback();
						pstmt.close();
						conn.close();
						return false;
					}
				} else {
					sql = "update tb_cookie set cookie =\"" + md5 + "\", time = " + time + " where user =" + user;
					int change = pstmt.executeUpdate(sql);
					if (change == 1) {
						conn.commit();
						pstmt.close();
						conn.close();
						return true;
					} else {
						conn.rollback();
						pstmt.close();
						conn.close();
						return false;
					}
				}
			}
			pstmt.close();
			conn.close();
			return false;
		} catch (Exception e) {
			return false;
		}
	}

	private boolean Repeat(String md5) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String sql = "select count(*) from tb_cookie where cookie=?";
			Connection conn = (Connection) DriverManager.getConnection(db_url, db_user, db_paw);
			PreparedStatement pstmt = (PreparedStatement) conn.prepareStatement(sql);
			pstmt.setString(1, md5);
			ResultSet eq = pstmt.executeQuery();
			if (eq.next()) {
				int i = eq.getInt(1);
				if (i == 0) {
					pstmt.close();
					conn.close();
					return false;
				}
			}
			pstmt.close();
			conn.close();
			return true;
		} catch (Exception e) {
			return true;
		}
	}
	
	public String enMD5(String s) {
		char hexDigits[] = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F' };
		try {
			byte[] btInput = s.getBytes();
			// 鑾峰緱MD5鎽樿绠楁硶鐨� MessageDigest 瀵硅薄
			MessageDigest mdInst = MessageDigest.getInstance("MD5");
			// 浣跨敤鎸囧畾鐨勫瓧鑺傛洿鏂版憳瑕�
			mdInst.update(btInput);
			// 鑾峰緱瀵嗘枃
			byte[] md = mdInst.digest();
			// 鎶婂瘑鏂囪浆鎹㈡垚鍗佸叚杩涘埗鐨勫瓧绗︿覆褰㈠紡
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
			e.printStackTrace();
			return "";
		}
	}
	
	public String select(String lie, String table, String where) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String sql = "select " + lie + " from " + table + " where " + where;
			Connection conn = (Connection) DriverManager.getConnection(db_url, db_user, db_paw);
			PreparedStatement pstmt = (PreparedStatement) conn.prepareStatement(sql);
			ResultSet eq = pstmt.executeQuery();
			ResultSetMetaData metaData = eq.getMetaData();
			int cCount = metaData.getColumnCount();
			String[] name = new String[cCount + 1];
			JSONObject json = new JSONObject();
			json.put("code", "0");
			for (int i = 1; i <= cCount; i++) {
				name[i] = metaData.getColumnLabel(i);
			}
			JSONArray jsonMembers = new JSONArray();
			while (eq.next()) {
				JSONObject member1 = new JSONObject();
				for (int i = 1; i <= cCount; i++) {
					String a = eq.getString(i);
					if (a == null) {
						member1.put(name[i], "");
					} else {
						member1.put(name[i], a);
					}
				}
				jsonMembers.put(member1);
			}
			json.put("data", jsonMembers);
			pstmt.close();
			conn.close();
			return json.toString();
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return "";
		}
	}
	public boolean update(String table,String lie,String val,String where) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String sql = "update "+table+" set "+lie+"=\""+val+"\" where "+where;
			Connection conn = (Connection) DriverManager.getConnection(db_url, db_user, db_paw);
			PreparedStatement pstmt = (PreparedStatement) conn.prepareStatement(sql);
			if(pstmt.executeUpdate()!=0){
				pstmt.close();
				conn.close();
				return true;
			}
			pstmt.close();
			conn.close();
			return false;
		} catch (Exception e) {
			return false;
		}
	}
}
