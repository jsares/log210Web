<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%
String pwd=request.getParameter("mdp"); 
String email=request.getParameter("courriel"); 
String pwd2=request.getParameter("mdp2"); 
Class.forName("com.mysql.jdbc.Driver"); 

if(pwd2.equals(pwd)){
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test2",
"root","toor"); 
Statement st= con.createStatement(); 
ResultSet rs; 
int i=st.executeUpdate("insert into etudiants values ('"+email+"','"+pwd+"')"); 
}
else{
	out.println("Vos mots de passe no concordes pas!  "); 	
}

%>
