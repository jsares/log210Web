<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%
String userid=request.getParameter("usr"); 
session.putValue("userid",userid); 
String pwd=request.getParameter("pwd"); 
Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/LibrairieLog210","root","toor"); 
Statement st= con.createStatement(); 
ResultSet rs=st.executeQuery("select * from gestionnaires where email='"+userid+"'"); 
if(rs.next()) 
{ 
if(rs.getString(2).equals(pwd)) 
{ 
out.println("welcome"+userid); 

} 
else 
{ 
out.println("Invalid password try again  "); 			
} 
} 
else{
}
%>