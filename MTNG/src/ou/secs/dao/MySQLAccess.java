package ou.secs.dao;

import java.sql.Connection;
import java.util.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;
import java.util.Random;

import ou.secs.domain.Poll;
import ou.secs.domain.TimeOption;

public class MySQLAccess {
	public static Connection getConnection() throws Exception {
		String driverName = "org.gjt.mm.mysql.Driver";
		Class.forName(driverName);

		String serverName = "localhost";
		String mydatabase = "mtng";
		String url = "jdbc:mysql://" + serverName + "/" + mydatabase;

		String username = "root";
		String password = "sqluserpw#2018";
		Connection connection = DriverManager.getConnection(url, username, password);

		if (connection.isValid(5)) {
			System.out.println(connection);
		}
		return connection;
	}

	public static void saveToDB(Poll poll) {
		Connection c = null;
		Statement s;
		PreparedStatement p = null;
		int pollID = 0;
		int personID = 0;
		try {
			Random random = new Random();
			String authToken = String.format("%04d", random.nextInt(100000));

			c = getConnection();
			s = c.createStatement();
			s.execute("USE mtng;");

			// Inserting data into Person table
			String insertPersonStmt = "INSERT INTO Person (Person_Name, IsCreator, auth_token) VALUE (?, ?, ?);";
			p = c.prepareStatement(insertPersonStmt, Statement.RETURN_GENERATED_KEYS);
			p.setString(1, poll.getEmail());
			p.setString(2, "Y");
			p.setString(3, authToken);
			int noOfPersonRowsInserted = p.executeUpdate();
			if (noOfPersonRowsInserted == 0) {
				System.out.println("Error in insert");
			} else {
				// Getting Poll_ID after INSERT into Poll table
				ResultSet generatedKeys = p.getGeneratedKeys();
				if (generatedKeys.next()) {
					personID = generatedKeys.getInt(1);
				}
			}

			// Inserting data into Poll table
			String insertStmt = "INSERT INTO Poll (Name, Location, Person_ID) VALUE (?, ?, ?);";
			p = c.prepareStatement(insertStmt, Statement.RETURN_GENERATED_KEYS);
			p.setString(1, poll.getName());
			p.setString(2, poll.getLocation());
			p.setInt(3, personID);
			int noOfPollRowsInserted = p.executeUpdate();
			if (noOfPollRowsInserted == 0) {
				System.out.println("Error in insert");
			} else {
				// Getting Poll_ID after INSERT into Poll table
				ResultSet generatedKeys = p.getGeneratedKeys();
				if (generatedKeys.next()) {
					pollID = generatedKeys.getInt(1);
				}
			}

			// Loop through time_options in Poll object and insert into time_options table
			List<TimeOption> timeOptions = poll.getPollTimeList();
			if (timeOptions != null && timeOptions.size() > 0) {
				for (TimeOption timeOption : timeOptions) {
					String insertTimeOption = "INSERT INTO time_options (Poll_ID, Start, End) VALUE (?, ?, ?);";
					p = c.prepareStatement(insertTimeOption);
					p.setInt(1, pollID);
					p.setDate(2, new java.sql.Date(new Date().getTime()));
					p.setDate(3, new java.sql.Date(new Date().getTime()));
					p.executeUpdate();
				}
			}
		} catch (Exception e) {
			System.out.println("Error in saving" + e.getMessage());
		} finally {
			try {
				if (p != null)
					p.close();
				if (c != null)
					c.close();
			} catch (SQLException e2) {
			}
		}

	}

	public static void readDB(Poll poll) {
		Connection c = null;
		Statement s;
		PreparedStatement p = null;
		try {
			c = getConnection();
			s = c.createStatement();
			s.execute("USE mtng;");
			p = c.prepareStatement("SELECT Start, End FROM Time_Options WHERE" + " (Time_ID, Poll_ID) VALUE (?, ?);");
			p.setInt(1, poll.getTime_ID());
			p.setInt(2, poll.getPoll_ID());
			p.execute();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if (p != null)
					p.close();
				if (c != null)
					c.close();
			} catch (SQLException e2) {
			}
		}
	}

	// TODO: Will update event name, event location, and time options
	// Pass DB keys (like Time_ID, Poll_ID) and use IDs in WHERE clause to update
	// Add IDs to json in jsp and Java objects
	public static void updateDB(Poll poll) {

	}
}