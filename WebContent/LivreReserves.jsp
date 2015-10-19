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
		<form action="/log210Web/ReserverLivre" method=post>
			<fieldset>
			<h4><%
			session.setAttribute("id", request.getAttribute("id"));
			session.setAttribute("prix", request.getAttribute("prix"));
			out.println(request.getAttribute("titre") ); 
			%>
			
			<%
			out.println(request.getAttribute("auteur") ); 
			%>
			
			
			Prix :
			<%
			out.println(request.getAttribute("prix")+"$" ); 
			%>	
			
			</h4>
			
			</fieldset>
			
			

			<div class="col-md-8" style="margin-bottom: 15px;">
				<input type="submit" name="Reserver" value="Réserver ce livre">
			</div>
			<div class="col-md-8" style="margin-bottom: 15px;">
				<input type="submit" name="Retour" value="Chercher un autre livre">
			</div>
	</div>

	</form>
	</div>
</body>
</html>