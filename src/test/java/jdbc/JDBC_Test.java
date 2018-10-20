package jdbc;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.io.Reader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;

import org.apache.ibatis.jdbc.ScriptRunner;
import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;
import junit.framework.TestCase;

/**
 * Unit tests for JDBC.
 */

@RunWith(JUnit4.class)
public class JDBC_Test extends TestCase {
	
	static final String serverName = "WINDOWS-FUMCC90";
	static final String instanceName = "SQLEXPRESS";
	static Connection connection = null;
	
    @BeforeClass
    public static void setUpDatabase() throws IOException, SQLException {   
        connection = new JDBC().connect();
        assertNotNull(connection);
        ScriptRunner sr = new ScriptRunner(connection);
		Reader reader = new BufferedReader(new FileReader("ships-n-battles.sql"));
		sr.runScript(reader);
    }

    @Test
    public void TestNumShipsInClass() throws SQLException {
    	int NumShipsInClass = new JDBC().NumShipsInClass(connection, "Revenge");
    	assertEquals(5, NumShipsInClass);
    }
    
    @Test
    public void TestNumShipsSunkInBattle() throws SQLException {
    	int NumShipsSunkInBattle = new JDBC().MostShipsSunkInBattle(connection, "Guadalcanalt");
    	assertEquals(1, NumShipsSunkInBattle);
    }
    
    @Test
    public void TestShipYearLaunched() throws SQLException {
    	String ShipYearLaunched = new JDBC().ShipYearLaunched(connection, "Washington");
    	assertEquals("1941", ShipYearLaunched);
    }
    
    @Test
    public void TestBattleFoughtBetweenDates() throws SQLException {
    	String BattleFoughtBetweenDates = new JDBC().BattleFoughtBetweenDates(connection, "1941-05-24", "1941-05-27");
		assertEquals(BattleFoughtBetweenDates, "Denmark Strait");
    }
    
    @Test
    public void TestGetAllBattles() throws SQLException {
    	List<String> GetAllBattles = new JDBC().GetAllBattles(connection);
    	List<String> allBattles = new ArrayList<String>();
    	allBattles.add("Denmark Strait");
    	allBattles.add("Guadalcanal");
    	allBattles.add("North Cape");
    	allBattles.add("Surigao Strait");
    	assertTrue(JDBC_Test.listEqualsIgnoreOrder(GetAllBattles, allBattles));
    }
    
    @AfterClass
    public static void cleanup() throws SQLException {
		connection.close();
    }  
    
    public static <String> boolean listEqualsIgnoreOrder(List<String> list1, List<String> list2) {
        return new HashSet<String>(list1).equals(new HashSet<String>(list2));
    }

}