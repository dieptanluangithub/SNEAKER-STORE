package dao;

import context.DBContext;
import entity.Account;
import entity.Category;
import entity.Order;
import entity.Product;
import entity.Contact;
import entity.Member;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Types;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class DAO {

	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

	public List<Product> getAllProduct() {
		List<Product> list = new ArrayList<>();
		String query = "select * from Product";
		try {
			conn = new DBContext().getConnection();// mo ket noi voi sql
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			while (rs.next()) {
				list.add(new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getDouble(4), rs.getString(5),
						rs.getString(6)));
			}
		} catch (Exception e) {
		}
		return list;
	}

	// Load sản phẩm theo category

	public List<Product> getProductByCID(String cid) {
		List<Product> list = new ArrayList<>();
		String query = "select * from Product\n" + "Where cateID =?";
		try {
			conn = new DBContext().getConnection();// mo ket noi voi sql
			ps = conn.prepareStatement(query);
			ps.setString(1, cid);
			rs = ps.executeQuery();
			while (rs.next()) {
				list.add(new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getDouble(4), rs.getString(5),
						rs.getString(6)));
			}
		} catch (Exception e) {
		}
		return list;
	}

	public List<Account> getAccount() {
		List<Account> list = new ArrayList<>();
		String query = "select * from Account";
		try {
			conn = new DBContext().getConnection();// mo ket noi voi sql
			ps = conn.prepareStatement(query);

			rs = ps.executeQuery();
			while (rs.next()) {
				list.add(new Account(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getInt(5)));
			}
		} catch (Exception e) {
		}
		return list;
	}

	// Lấy 1 sản phẩm theo id
	public Product getProduct(String txt) {
		String query = "select * from product where id = ?";
		List<Product> list = new ArrayList<>();
		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, txt);
			rs = ps.executeQuery();
			while (rs.next()) {
				return new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getDouble(4), 1);
			}
		} catch (Exception e) {
		}
		return null;
	}

	// Lấy 1 sản phẩm theo id
	public Product getProductByID(String pid) {

		String query = "select * from Product\n" + "Where id =?";
		try {
			conn = new DBContext().getConnection();// mo ket noi voi sql
			ps = conn.prepareStatement(query);
			ps.setString(1, pid);
			rs = ps.executeQuery();
			while (rs.next()) {
				return new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getDouble(4), rs.getString(5),
						rs.getString(6));
			}
		} catch (Exception e) {
		}
		return null;
	}

	public Account getAccountByID(String uid) {

		String query = "select * from Account\n" + "Where uid =?";
		try {
			conn = new DBContext().getConnection();// mo ket noi voi sql
			ps = conn.prepareStatement(query);
			ps.setString(1, uid);
			rs = ps.executeQuery();
			while (rs.next()) {
				return new Account(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getInt(5));
			}
		} catch (Exception e) {
		}
		return null;
	}

	// Load category
	public List<Category> getAllCategory() {
		List<Category> list = new ArrayList<>();
		String query = "select * from Category";
		try {
			conn = new DBContext().getConnection();

			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			while (rs.next()) {
				list.add(new Category(rs.getInt(1), rs.getString(2)));
			}
		} catch (Exception e) {
		}
		return list;
	}

	// Lấy sản phẩm cuối
	public Product getLast() {
		String query = "select top 1 * from Product\n" + "order by id desc";
		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			while (rs.next()) {
				return new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getDouble(4), rs.getString(5),
						rs.getString(6));
			}
		} catch (Exception e) {
		}
		return null;
	}

	// Tìm kiếm sản phẩm
	public List<Product> searchByName(String txtSearch) {
		List<Product> list = new ArrayList<>();
		String query = "select * from Product\n" + "Where [name] like ?";
		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, "%" + txtSearch + "%");
			rs = ps.executeQuery();

			while (rs.next()) {
				list.add(new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getDouble(4), rs.getString(5),
						rs.getString(6)));
			}
		} catch (Exception e) {
		}
		return list;
	}

	// Đăng nhập
	public Account login(String user, String pass) {
		String query = "select * from Account\n" + "Where [user] = ?\n" + "and pass = ?";
		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, user);
			ps.setString(2, pass);
			rs = ps.executeQuery();
			while (rs.next()) {
				return new Account(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getInt(5));

			}
		} catch (Exception e) {
		}
		return null;

	}

	// Kiểm tra tài khoản có tồn tại không ?
	public Account checkAccountExist(String user) {
		String query = "select * from Account\n" + "Where [user] = ?";
		try {
			conn = new DBContext().getConnection();// mo ket noi voi sql
			ps = conn.prepareStatement(query);
			ps.setString(1, user);

			rs = ps.executeQuery();
			while (rs.next()) {
				return new Account(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getInt(5));

			}
		} catch (Exception e) {
		}
		return null;

	}

	public List<Product> getTop3() {
		List<Product> list = new ArrayList<>();
		String query = "select top 3 * from product";
		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			while (rs.next()) {
				list.add(new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getDouble(4), rs.getString(5),
						rs.getString(6)));
			}
		} catch (Exception e) {
		}
		return list;
	}

	public List<Product> getNext3Product(int amount) {
		List<Product> list = new ArrayList<>();
		String query = "select top 3 * from product\n" + "ORDER BY id\n" + "OFFSET ? ROWS\n" + "FETCH NEXT 3 ROWS ONLY";
		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			ps.setInt(1, amount);
			rs = ps.executeQuery();
			while (rs.next()) {
				list.add(new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getDouble(4), rs.getString(5),
						rs.getString(6)));
			}
		} catch (Exception e) {
		}
		return list;
	}

	// Tổng số lượng sản phẩm
	public int getTotalProduct() {
		String query = "select count(*) from product";
		try {
			conn = new DBContext().getConnection();// mo ket noi voi sql
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			while (rs.next()) {
				return rs.getInt(1);
			}
		} catch (Exception e) {
		}
		return 0;
	}

	// Tổng số lượng tài khoản
	public int getTotalAccount() {
		String query = "select count(*) from account";
		try {
			conn = new DBContext().getConnection();// mo ket noi voi sql
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			while (rs.next()) {
				return rs.getInt(1);
			}
		} catch (Exception e) {
		}
		return 0;
	}

	// load sản phẩm và phân trang
	public List<Product> pagingProduct(int index) {
		List<Product> list = new ArrayList<>();
		String query = "select * from product\n" + "ORDER BY id\n" + "OFFSET ? ROWS FETCH NEXT 6 ROWS ONLY;";
		try {
			conn = new DBContext().getConnection();// mo ket noi voi sql

			ps = conn.prepareStatement(query);
			ps.setInt(1, (index - 1) * 6);
			rs = ps.executeQuery();
			while (rs.next()) {

				list.add(new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getDouble(4), rs.getString(5),
						rs.getString(6)));
			}
		} catch (Exception e) {
		}
		return list;
	}

	// load account và phân trang
	public List<Account> pagingAccount(int index) {
		List<Account> list = new ArrayList<>();
		String query = "select * from Account\n" + "ORDER BY uid\n" + "OFFSET ? ROWS FETCH NEXT 6 ROWS ONLY;";
		try {
			conn = new DBContext().getConnection();// mo ket noi voi sql
			ps = conn.prepareStatement(query);
			ps.setInt(1, (index - 1) * 6);
			rs = ps.executeQuery();
			while (rs.next()) {
				list.add(new Account(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getInt(5)));
			}
		} catch (Exception e) {
		}
		return list;
	}

//    public List<Product> getNext6Product(int amount) {
//        List<Product> list = new ArrayList<>();
//        String query = "SELECT *\n"
//                + "  FROM product\n"
//                + " ORDER BY id\n"
//                + "OFFSET ? ROWS\n"
//                + " FETCH NEXT 6 ROWS ONLY";
//        try {
//            conn = new DBContext().getConnection();//mo ket noi voi sql
//            ps = conn.prepareStatement(query);
//            ps.setInt(1, amount);
//            rs = ps.executeQuery();
//            while (rs.next()) {
//                list.add(new Product(rs.getInt(1),
//                        rs.getString(2),
//                        rs.getString(3),
//                        rs.getDouble(4),
//                        rs.getString(5),
//                        rs.getString(6)));
//            }
//        } catch (Exception e) {
//        }
//        return list;
//    }

	// Load sản phẩm do chính người đó bán
	public List<Product> getProductBySaleID(int id) {
		List<Product> list = new ArrayList<>();
		String query = "select * from Product\n" + "Where sale_ID = ?";
		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			ps.setInt(1, id);
			rs = ps.executeQuery();
			while (rs.next()) {
				list.add(new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getDouble(4), rs.getString(5),
						rs.getString(6)));
			}
		} catch (Exception e) {
		}
		return list;
	}

	// Xóa sản phẩm
	public void deleteProduct(String pid) {
		String query = "delete from product\n" + "where id = ?";
		try {
			conn = new DBContext().getConnection();// mo ket noi voi sql
			ps = conn.prepareStatement(query);
			ps.setString(1, pid);
			ps.executeUpdate();

		} catch (Exception e) {
		}
	}

	// xóa account
	public void deleteAccount(String uid) {
		String query = "delete from Account\n" + "where uid = ?";
		try {
			conn = new DBContext().getConnection();// mo ket noi voi sql
			ps = conn.prepareStatement(query);
			ps.setString(1, uid);
			ps.executeUpdate();

		} catch (Exception e) {
		}
	}

	// Đăng ký
	public void signup(String user, String pass) {
		String query = "insert into Account\n"

				+ "values(?,?,0,0)";

		try {
			conn = new DBContext().getConnection();// mo ket noi voi sql
			ps = conn.prepareStatement(query);
			ps.setString(1, user);
			ps.setString(2, pass);
			ps.executeUpdate();

		} catch (Exception e) {
		}

	}

	// Thêm sản phẩm
	public void insertProduct(String name, String image, String price, String title, String description,
			String category, int sid) {
		String query = "INSERT [dbo].[Product] \n"
				+ "([name], [image], [price], [title], [description], [cateID], [sale_ID])\n" + "VALUES(?,?,?,?,?,?,?)";
		try {

			conn = new DBContext().getConnection();// mo ket noi voi sql
			ps = conn.prepareStatement(query);
			ps.setString(1, name);
			ps.setString(2, image);
			ps.setString(3, price);
			ps.setString(4, title);
			ps.setString(5, description);
			ps.setString(6, category);
			ps.setInt(7, sid);
			ps.executeUpdate();

		} catch (Exception e) {
		}
	}

	// Thêm thông tin tài khoản
	public void insertMyAccount(int sid, String name, String age, String email, String phone, String address) {
		try {
			conn = new DBContext().getConnection();// mo ket noi voi sql
			CallableStatement stmt = conn.prepareCall("{call sp_InsertMember(?,?,?,?,?,?) }");
			stmt.setInt(1, sid);
			stmt.setString(2, name);
			stmt.setInt(3, Integer.parseInt(age));
			stmt.setString(4, email);
			stmt.setString(5, phone);
			stmt.setString(6, address);

			stmt.execute();
		} catch (Exception e) {
		}
	}

	// Thêm liên hệ

	public void insertContact(String name, String email, String message) {
		String query = "INSERT [dbo].[Contact] \n" + "([name], [email], [message])\n" + "VALUES(?,?,?)";
		try {
			conn = new DBContext().getConnection();// mo ket noi voi sql
			ps = conn.prepareStatement(query);
			ps.setString(1, name);
			ps.setString(2, email);
			ps.setString(3, message);

			ps.executeUpdate();
		} catch (Exception e) {
		}
	}

	// Thêm tài khoản
	public void insertAccount(String user, String pass, String isSell, String isAdmin) {
		String query = "INSERT [dbo].[Account] \n" + "([user], [pass], [isSell], [isAdmin])\n" + "VALUES(?,?,?,?)";
		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, user);
			ps.setString(2, pass);
			ps.setString(3, isSell);
			ps.setString(4, isAdmin);

			ps.executeUpdate();
		} catch (Exception e) {
		}
	}

	// Sửa sản phẩm
	public void editProduct(String name, String image, String price, String title, String description, String category,
			String pid) {
		String query = "update product\n" + "set [name] = ?,\n" + "[image] = ?,\n" + "price = ?,\n" + "title = ?,\n"
				+ "description = ?,\n" + "cateID = ?\n" + "where id = ?";
		try {
			conn = new DBContext().getConnection();// mo ket noi voi sql
			ps = conn.prepareStatement(query);
			ps.setString(1, name);
			ps.setString(2, image);
			ps.setString(3, price);
			ps.setString(4, title);
			ps.setString(5, description);
			ps.setString(6, category);
			ps.setString(7, pid);
			ps.executeUpdate();
		} catch (Exception e) {
		}
	}

	// Thay đổi mật khẩu
	public void editPassWord(String pass, int uid) {
		String query = "update Account\n" + "set [pass] = ?\n" + "where uid = ?";

		try {
			conn = new DBContext().getConnection();// mo ket noi voi sql
			ps = conn.prepareStatement(query);
			ps.setString(1, pass);
			ps.setInt(2, uid);

			ps.executeUpdate();
		} catch (Exception e) {
		}
	}

	// Sửa tài khoản
	public void editAccount(String user, String pass, String isSell, String isAdmin, String uid) {
		String query = "update Account\n" + "set [user] = ?,\n" + "[pass] = ?,\n" + "isSell = ?,\n" + "isAdmin = ?\n"
				+ "where uid = ?";

		try {
			conn = new DBContext().getConnection();// mo ket noi voi sql
			ps = conn.prepareStatement(query);
			ps.setString(1, user);
			ps.setString(2, pass);
			ps.setString(3, isSell);
			ps.setString(4, isAdmin);
			ps.setString(5, uid);

			ps.executeUpdate();
		} catch (Exception e) {
		}
	}

	// Thêm detailOrder
	public void insertDetailOrder(String oid, String pid, String quantity) {
		try {
			conn = new DBContext().getConnection();
			CallableStatement stmt = conn.prepareCall("{call sp_InsertDetailOrder(?,?,?) }");
			stmt.setInt(1, Integer.parseInt(oid));
			stmt.setInt(2, Integer.parseInt(pid));
			stmt.setInt(3, Integer.parseInt(quantity));

			stmt.execute();
		} catch (Exception e) {
		}
	}

	public void saveOrder(String uid, List<Product> list) {
		try {
			conn = new DBContext().getConnection();// mo ket noi voi sql

			// 1.add Order to database
			CallableStatement stmt = conn.prepareCall("{call sp_InsertOrderWithDetail (?) }");
			stmt.setInt(1, Integer.parseInt(uid));
			stmt.execute();

			// 2.lấy oid Order vừa tạo
			int lastID = getLastOrderID();

			// 3.add DetailOrder
			for (Product p : list) {
				insertDetailOrder(String.valueOf(lastID), String.valueOf(p.getId()), String.valueOf(p.getAmount()));
			}

		} catch (Exception e) {
		}

	}

	// lấy oid Order vừa tạo
	public static int getLastOrderID() {
		try {
			Connection conn = new DBContext().getConnection();
			CallableStatement stmt = conn.prepareCall("{?= call fn_LastOrderID()}");
			stmt.registerOutParameter(1, Types.INTEGER);
			stmt.execute();
			return stmt.getInt(1);

		} catch (Exception e) {
			e.getStackTrace();
		}
		return -1;
	}

	// Lấy ra order vừa tạo
	public Order getLastOrder() {
		Order order = new Order();
		try {
			Connection conn = new DBContext().getConnection();
			CallableStatement stmt = conn.prepareCall("{call sp_getOneOrder(?) }");
			int lastID = getLastOrderID();
			stmt.setInt(1, lastID);
			rs = stmt.executeQuery();
			while (rs.next()) {
				return new Order(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getDouble(4), rs.getDate(5),
						rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9));
			}

		} catch (Exception e) {
			e.getStackTrace();
		}
		return null;
	}

	// doanhthu
	public int TongDoanhThu() {
		try {
			Connection conn = new DBContext().getConnection();
			CallableStatement stmt = conn.prepareCall("{?= call fn_TongDoanhThu()}");
			stmt.registerOutParameter(1, Types.INTEGER);
			stmt.execute();
			return stmt.getInt(1);

		} catch (Exception e) {
			e.getStackTrace();
		}
		return -1;
	}

	// doanhthutheotg
	public int TongDoanhThuTheoTG(String d1, String d2) {
		try {
			Connection conn = new DBContext().getConnection();
			CallableStatement stmt = conn.prepareCall("{?= call fn_TongDoanhThuTheoKhoangTg(?,?)}");

			stmt.setDate(2, java.sql.Date.valueOf(d1));
			stmt.setDate(3, java.sql.Date.valueOf(d2));
			stmt.registerOutParameter(1, Types.INTEGER);
			stmt.execute();
			return stmt.getInt(1);

		} catch (Exception e) {
			e.getStackTrace();
		}
		return -1;
	}

	public int getSumOrder() {
		String query = "SELECT count(*)\r\n" + "FROM [Shoe].[dbo].[Order]";
		try {
			conn = new DBContext().getConnection();// mo ket noi voi sql
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			while (rs.next()) {
				return rs.getInt(1);
			}
		} catch (Exception e) {
		}
		return 0;
	}

	public List<Order> getOrder() {
		List<Order> list = new ArrayList<>();
		String query = "SELECT *\r\n" + "FROM [Shoe].[dbo].[Order]";
		try {
			conn = new DBContext().getConnection();// mo ket noi voi sql
			ps = conn.prepareStatement(query);

			rs = ps.executeQuery();
			while (rs.next()) {
				list.add(new Order(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getDouble(4), rs.getDate(5),
						rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9)));
			}
		} catch (Exception e) {
		}
		return list;
	}

	public List<Contact> getallContact() {
		List<Contact> list = new ArrayList<>();
		String query = "select * from Contact";
		try {
			conn = new DBContext().getConnection();// mo ket noi voi sql
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			while (rs.next()) {
				list.add(new Contact( rs.getString(1), rs.getString(2), rs.getString(3)));
			}
		} catch (Exception e) {
		}
		return list;
	}
	public List<Member> getallMember() {
		List<Member> list = new ArrayList<>();
		String query = "select * from Member";
		try {
			conn = new DBContext().getConnection();// mo ket noi voi sql
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			while (rs.next()) {
				list.add(new Member( rs.getInt(1),rs.getString(2),rs.getInt(3),rs.getString(4), rs.getString(5), rs.getString(6)));
			}
		} catch (Exception e) {
		}
		return list;
	}

	public static void main(String[] args) throws ParseException {
		DAO dao = new DAO();
		List<Order> list = dao.getOrder();
		for (Order o : list) {
			System.out.println(o);
		}
	}
}