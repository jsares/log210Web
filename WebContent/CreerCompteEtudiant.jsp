<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<jsp:include page="header.jsp"></jsp:include>

<h3>Créer un nouvel utilisateur</h3>
<form action="/log210Web/test" method=post>
	<div id="courrielEtudiant">
		<!-- style="margin:10px 0px 10px 0px;" >-->
		<input type="text" name="courriel"
			placeholder="Entrer votre adresse de courriel" class="form-control" required>
	</div>
	<div id="mdpEtudiant">
		<!-- style="margin:10px 0px 10px 0px;"> -->
		<input type="password" name="mdp" id="inputPassword" class="form-control"
			placeholder="Password" required>
	</div>
	<div id="confirmerMdpEtudiant">
		<!-- style="margin:10px 0px 10px 0px;"> -->
		<input type="password" name="confirmerMdp" placeholder="confirmer votre mot de passe" class="form-control" required> 
		
	</div>
	<div id="btnSubmit">
		<!-- style="margin:10px 0px 10px 0px;" -->
		 <button type="submit" class="btn btn-default">Submit</button>
	</div>
</form>

<jsp:include page="footer.jsp"></jsp:include>