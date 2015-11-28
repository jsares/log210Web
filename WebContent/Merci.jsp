

<jsp:include page="header.jsp"/>

<h3>Votre transaction est confirmé</h3>


	<div>
		<form class="form-signin" action="/log210Web/Logout" method=post>
			<c:if test="${sessionScope.loginGestionnaire != null || sessionScope.loginEtudiant != null}">
				<button class="btn btn-lg btn-primary btn-block" type="submit">Se
					déconnecter</button>
			</c:if>
		</form>
	</div>



	<a href="ChercherLivre.jsp"> <button class="btn btn-lg btn-primary btn-block" type="submit"><h4>Chercher 
	un livre</h4></button>

	</body>
</html>
			
			
	
	
	
