# Day 34 JDBC 연동, 중복검사

프로젝트 자체를 우클릭하고 Build Path > Configure Build Path > Lib 에서 oraclexe/../jtbc/oracle6.jar 찾아서 apply 해주고, order and export 에서도 체크 후 apply 해주면 거기에있는 기능들을 사용할수있게된다.

```java
//DBConnector
package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnecter {
	public static Connection getConnection() {
		Connection conn = null;
		
		try {
			String url = "jtbc:oracle:thin:@localhost:1521:XE";
			String user = "hr";
			String pw = "hr";
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
}
```