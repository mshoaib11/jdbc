package jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.List;

public class JDBC {
	
	public Connection connect() {
    	String connectionURL = "jdbc:sqlserver://"+JDBC_Test.serverName+"\\"+JDBC_Test.instanceName+";integratedSecurity=true;";
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver") ;
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Connection connection = null;
		try {
			connection = DriverManager.getConnection(connectionURL);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return connection;		
	}
	
    public int NumShipsInClass(Connection connection, String Class) throws SQLException {
    	//insert code here
    	return 0;    	
    }

	public int MostShipsSunkInBattle(Connection connection, String battle) throws SQLException {
		//insert code here
		return 0;
	}

	public String ShipYearLaunched(Connection connection, String ship) {
		//insert code here
		return null;
	}

	public String BattleFoughtBetweenDates(Connection connection, String startdate, String enddate) {
		// TODO Auto-generated method stub
		return null;
	}

	public List<String> GetAllBattles(Connection connection) {
		// TODO Auto-generated method stub
		return null;
	}
}