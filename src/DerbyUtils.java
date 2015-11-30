

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.ResultSetMetaData;


public class DerbyUtils {

	private static java.sql.Connection con;
	
	

	
	private static DerbyUtils singleton = new DerbyUtils( );
	
	
	 /* A private Constructor prevents any other 
	    * class from instantiating.
	    */
	   private DerbyUtils(){ 
		   LoadDBDriver();
		CreateDBConnection();
	   }
	   
	   /* Static 'instance' method */
	   public static DerbyUtils getInstance( ) {
	      return singleton;
	   }
	   
	   /* Static 'instance' method */
	   public static Connection getConnection( ) {
	      return con;
	   }
	
	public static void LoadDBDriver() {
		try {
			/*
			 ** Load the Derby driver. When the embedded Driver is used this
			 * action start the Derby engine. Catch an error and suggest a
			 * CLASSPATH problem
			 */
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			System.out.println("com.mysql.jdbc.Driver" + " loaded. ");
		} catch (java.lang.ClassNotFoundException e) {
			System.err.print("ClassNotFoundException: ");
			System.err.println(e.getMessage());
			System.out.println("\n    >>> Please check your CLASSPATH variable   <<<\n");
		} catch (InstantiationException e) {
			// TODO Auto-generated catch block
			System.out.println("\n    >>> Instantiation Exception   <<<\n");
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			System.out.println("\n    >>> Illegal Access Exception   <<<\n");
			e.printStackTrace();
		}
	}

	public static void CreateDBConnection() {
		try {
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/librairieLog210","root","toor");
			System.out.println("Connected to database " + "LibrairieLog210");
		} catch (Throwable e) {
			/*
			 * Catch all exceptions and pass them to the exception reporting
			 * method
			 */
			System.out.println(" . . . exception thrown:");
		}
	}
	
	public static void ShutdownDB() {
		try {
			DerbyUtils.getConnection().close();
			System.out.println("Closed connection");
		} catch (Throwable e) {
			System.out.println(" . . . exception thrown:");
		}

		
		
	}
	

}
