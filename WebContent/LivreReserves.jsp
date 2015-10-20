<!-- Bootstrap -->
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/signin.css" rel="stylesheet">
<jsp:include page="header.jsp"></jsp:include>



<title>Livres reservés</title>
</head>
<body>
	<h3>Vos livres</h3>
	<div class="container-fluid">
		
			<fieldset>
			<h3>Réservés</h3>
			<h4>
			<%

			try {
				Class.forName("com.mysql.jdbc.Driver");
				java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/LibrairieLog210","root","toor");
				Statement st= (Statement) con.createStatement(); 
				ResultSet rs;
				int prix = 0;
				
				rs=st.executeQuery("Select * from reservation where etudiant='"+session.getAttribute("utilisateur")+"'"); 
				
				while(rs.next()){
					
			        	if(Integer.parseInt(rs.getString(1))==0){
							String id= (rs.getString(2) ); 
							
							try {
								Statement st1= (Statement) con.createStatement(); 
								ResultSet rqs;
								rqs=st1.executeQuery("Select * from livres where id='"+id+"'"); 
								if(rqs.next()){
									out.println(rqs.getString(4)+" de ");
									out.println(rqs.getString(5) + " à ");
									out.println(rqs.getString(7)+ "$");
									out.println("/n");
								}
								
								prix = prix + Integer.parseInt(rqs.getString(7));
							
							
							}
							catch (SQLException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							} 
						
			        	
			        }
					
			        	
			        	
			        
					
					}
				out.println("Il vous reste "+prix+"$ à payer");
					
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} 
			
			
			
			
			
			
			%>	
			
			</h4>
			
			</fieldset>
			
			<fieldset>
			<h3>Payés</h3>
			<h4>
			<%
			try {
				Class.forName("com.mysql.jdbc.Driver");
				java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/LibrairieLog210","root","toor");
				Statement st= (Statement) con.createStatement(); 
				ResultSet rs;
				int prix = 0;
				
				rs=st.executeQuery("Select * from reservation where etudiant='"+session.getAttribute("utilisateur")+"'"); 
				
				while(rs.next()){
					
			        	if(Integer.parseInt(rs.getString(1))==1){
							String id= (rs.getString(2) ); 
							
							try {
								Statement st1= (Statement) con.createStatement(); 
								ResultSet rqs;
								rqs=st1.executeQuery("Select * from livres where id='"+id+"'"); 
								if(rqs.next()){
									
									out.println(rqs.getString(4)+" ");
								}
							
							
							}
							catch (SQLException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							} 
						
			        	
			        }
					
			        	
			        	
			        
					
					}
					
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} 
			
			
			%>		
			</h4>
			
			</fieldset>
			
		<form class="form-signin" action="/log210Web/LivrePaye" method=post>
			<div class="col-md-8" style="margin-bottom: 15px;">
				<input type="submit" name="Payer" value="Payer ces livres">
			</div>
		</form>
		<form class="form-signin" action="/log210Web/ReserverLivre" method=post>
			<div class="col-md-8" style="margin-bottom: 15px;">
				<input type="submit" name="Retour" value="Chercher un autre livre">
			</div>
		</form>
	</div>
	
	<div>
	<form class="form-signin" action="/log210Web/Logout" method=post>
	<c:if test="${sessionScope.utilisateur != null}">
		<button class="btn btn-lg btn-primary btn-block" type="submit">Se
			déconnecter</button>
	</c:if>
</form>
	</div>
	

</body>
</html>