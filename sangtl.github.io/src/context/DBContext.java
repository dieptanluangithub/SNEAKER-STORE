package context;
import java.sql.Connection;
import java.sql.DriverManager;
public class DBContext {

	public Connection getConnection() throws Exception {
		String url = "jdbc:sqlserver://" + serverName + ":" + portNumber + "\\" + instance + ";databaseName=" + dbName;
		if (instance == null || instance.trim().isEmpty())
			url = "jdbc:sqlserver://" + serverName + ":" + portNumber + ";databaseName=" + dbName;
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		return DriverManager.getConnection(url, userID, password);
	}

	private String serverName = "localhost";
	private String dbName = "Shoe";
	private String portNumber = "1433";
	private String instance = "";// LEAVE THIS ONE EMPTY IF YOUR SQL IS A SINGLE INSTANCE
	private String userID = "sa";
	private String password = "123456";

	public Connection getConnection(String userID, String password) throws Exception {
		this.userID = userID;
		this.password = password;
		return this.getConnection();
	}
}
