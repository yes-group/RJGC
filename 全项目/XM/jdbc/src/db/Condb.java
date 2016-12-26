package db;
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
public class Condb {
	private final String		db_url	= "jdbc:mysql://localhost:3306/info";	// 连接数据库字符串
	private final String		db_user	= "root";								// 数据库用户名
	private final String		db_paw	= "root";								// 数据库密码
	private int					id		= -1;
	private int					user	= -1;
	private Connection			conn;
	private PreparedStatement	pstmt;
	public static void main(String[] args) {
		// 这里是测试内容
		Condb name = new Condb();
		name.initialize();
		name.cheakislogin("6FBBE2F0103204F68E000BC8E14FEAED");
		// System.out.println(name.inchange(5,"高一（1）班", 600000001, -2));
		 System.out.println(name.inquery(-3));
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
			return true;
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return false;
		} finally {
			try {
				pstmt.close();
				conn.close();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
	}
	public String login(int user, String password, int id) {
		String result = null;
		try {
			ArrayList<String> arrayList = new ArrayList<String>();
			if (Query("select id from tb_user where user=" + user + " and password=\"" + password + "\"", arrayList) && arrayList.size() == 1 && Integer.valueOf(arrayList.get(0)) == id) {
				result = makecookie(user);
				this.user=user;
				this.id=id;
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return result;
	}
	public boolean logout() {
		try {
			if (Query("delete from tb_cookie where user=" + user)==1) {
				return true;
			}
		} catch (Exception e) {
		}
		return false;
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
					temp=null;
					break;
				}
				temp = enMD5(String.valueOf(user+time++));
				success = Query("select user from tb_cookie where cookie=\"" + temp + "\"", arrayList);
			} while (success == false || arrayList.size() != 0);
			if (temp != null) {
				if (Query("select count(*) from tb_cookie where user=" + user, arrayList) && arrayList.size() == 1) {
					int count = Integer.valueOf(arrayList.get(0));
					if (count == 0) {
						if (Query("insert into tb_cookie (user,cookie,time) values (" + user + ",\"" + temp + "\"," + time + ")") == 1) {
							md5 = temp;
						}
					} else {
						if (Query("update tb_cookie set cookie =\"" + temp + "\", time = " + time + " where user =" + user) == 1) {
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
	public String inquery(int target) {
		try {
			ArrayList<String> list = new ArrayList<String>();
			int columns;
			String sql = "";
			switch (target) {
				case -1:
					columns = 7;
					sql = "select tno,tname,sex,birthday,workday,pface,origin from tb_teacher";
					break;
				case -2:
					columns = 8;
					sql = "select sno,sname,sex,birthday,studyday,class,pface,origin from tb_student,tb_class where id=sclass";
					break;
				default:				
					if (id == 1) {
						columns = 7;
						sql = "select tno,tname,sex,birthday,workday,pface,origin from tb_teacher where tno="+user;
					} else {
						columns = 8;
						sql = "select sno,sname,sex,birthday,studyday,class,pface,origin from tb_student,tb_class where id=sclass and sno="+user;
					}
					break;
			}
			if (Query(sql, list)) {
				int i = 0;
				JSONObject json = new JSONObject();
				JSONArray jsonMembers = new JSONArray();
				JSONArray data = null;
				json.put("code", "0");
				for (String string : list) {
					if (i % columns == 0) {
						data = new JSONArray();
					}
					data.put(string);
					i++;
					if (i % columns == 0) {
						jsonMembers.put(data);
					}
				}
				json.put("data", jsonMembers);
				return json.toString();
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return null;
	}
	public boolean add(int no,int id) {
		try {
			String table="";
			String field="";
			switch (id) {
				case 1:
					table="tb_teacher";
					field="tno";
					break;
				case 2:
					table="tb_student";
					field="sno";
					break;
				default:
					break;
			}
			String sql = "insert into tb_user (user,password,id) values (" + no+",\""+no+"\","+id + ")";
			if (Query(sql)==1) {
				sql = "insert into "+table+" ("+field+") values (" + no + ")";
				if (Query(sql)==1) {
					return true;
				}
			}
			
		} catch (Exception e) {
			
		}
		return false;
	}
	public boolean inchange(int index, String targetdata, int key, int target) {
		try {
			String sql = "update ";
			switch (target) {
				case -1:
					sql += "tb_teacher set ";
					switch (index) {
						case 0:
							sql += "tno=";
							break;
						case 1:
							sql += "tname=";
							break;
						case 2:
							sql += "sex=";
							break;
						case 3:
							sql += "birthday=";
							break;
						case 4:
							sql += "workday=";
							break;
						case 5:
							sql += "pface=";
							break;
						case 6:
							sql += "origin=";
							break;
						default:
							return false;
					}
					sql += "\"" + targetdata + "\" where tno=" + key;
					break;
				case -2:
					sql += "tb_student set ";
					switch (index) {
						case 0:
							sql += "sno=";
							break;
						case 1:
							sql += "sname=";
							break;
						case 2:
							sql += "sex=";
							break;
						case 3:
							sql += "birthday=";
							break;
						case 4:
							sql += "studyday=";
							break;
						case 5:
							ArrayList<String> list=new ArrayList<String>();
							if(Query("select class,id from tb_class",list)&&list.size()>0){
								int i;
								for(i=0;i<list.size();i++){
									if(list.get(i).equals(targetdata)){
										break;
									}
									
								}
								if(i!=list.size()){
									targetdata=list.get(i+1);
								}else{
									return false;
								}
							}else{
								return false;
							}
							sql += "sclass=";
							break;
						case 6:
							sql += "pface=";
							break;
						case 7:
							sql += "origin=";
							break;
						default:
							return false;
					}
					if(targetdata.equals("")){
						sql += "default where sno=" + key;
					}else{
						sql += "\"" + targetdata + "\" where sno=" + key;
					}
					
					break;
				default:
					return false;
			}
			if (Query(sql) == 1) {
				return true;
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return false;
	}
	public boolean delete(int no) {
		try {
			ArrayList<String> list = new ArrayList<String>();
			if (Query("select id from tb_user where user=" + no, list) && list.size() == 1) {
				int id = Integer.valueOf(list.get(0));
				String table = null;
				switch (id) {
					case 1:
						table = "tb_teacher where tno=";
						break;
					case 2:
						table = "tb_student where sno=";
						break;
					default:
						return false;
				}
				if (Query("delete from " + table + no) == 1 && Query("delete from tb_user where user=" + no) == 1 && Query("delete from tb_cookie where user=" + no) != -1) {
					return true;
				}
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return false;
	}
	public boolean cheakislogin(String cookie) {
		try {
			ArrayList<String> list = new ArrayList<String>(2);
			if (Query("select a.user,id from tb_cookie as a,tb_user as b where a.user=b.user and cookie=\"" + cookie + "\"", list) && list.size() == 2) {
				user = Integer.valueOf(list.get(0));
				id = Integer.valueOf(list.get(1));
				return true;
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return false;
	}
	public int cookieid() {
		return id;
	}
	public int cookieuser() {
		return user;
	}
	private int Query(String sql) {
		int change = -1;
		try {
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
