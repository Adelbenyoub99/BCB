<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="Models.Ouvrage"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Liste des Ouvrages</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">

<style type="text/css">
.image-buttons {
	border: none;
	padding: 0;
	background: none;
	cursor: pointer;
	display: inline-block;
	/* Ensures that the buttons appear side by side */
}
</style>
</head>
<body>

	<div class="container-fluid mt-2">
		<div class="d-flex align-items-center-center justify-content-between">
			<h4>Liste des Ouvrages</h4>
			<img alt="" src="${basePath}/images/add-book.png" height="30px"
				width="30px" data-bs-toggle="modal"
				data-bs-target="#addOuvrageModal">
		</div>
		<!-- Ajout d'un modal Bootstrap -->
		<div class="modal fade" id="addOuvrageModal" tabindex="-1"
			aria-labelledby="addOuvrageModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="addOuvrageModalLabel">Ajouter un
							Ouvrage</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<form action="${basePath}/addOuvrageServlet" method="post">
						<div class="modal-body">
							<div class="mb-3">
								<label for="titre" class="form-label">Titre</label> <input
									type="text" class="form-control" id="titre" name="titre"
									required>
							</div>
							<div class="mb-3">
								<label for="auteur" class="form-label">Auteur</label> <input
									type="text" class="form-control" id="auteur" name="auteur"
									required>
							</div>
							<div class="mb-3">
								<label for="description" class="form-label">Description</label>
								<textarea class="form-control" id="description"
									name="description" required></textarea>
							</div>
							<div class="mb-3">
								<label for="annee" class="form-label">Année</label> <input
									type="number" class="form-control" id="annee" name="annee"
									required>
							</div>
							<div class="mb-3">
								<label for="type" class="form-label">Type</label> <select
									class="form-control" id="type" name="type"
									onchange="toggleFields()" required>
									<option value="" disabled selected>Sélectionnez un
										type</option>
									<option value="these">Thèse</option>
									<option value="livre">Livre</option>
									<option value="PFC Licence">PFC Licence</option>
									<option value="PFC Master">PFC Master</option>
								</select>
							</div>

							<!-- Champs dynamiques -->
							<div class="mb-3" id="faculteField" style="display: none;">
								<label for="faculte" class="form-label">Faculté</label> <input
									type="text" class="form-control" id="faculte" name="faculte">
							</div>

							<div class="mb-3" id="promoteurField" style="display: none;">
								<label for="promoteur" class="form-label">Promoteur</label> <input
									type="text" class="form-control" id="promoteur"
									name="promoteur">
							</div>

							<div class="mb-3" id="isbnField" style="display: none;">
								<label for="isbn" class="form-label">ISBN</label> <input
									type="text" class="form-control" id="isbn" name="isbn">
							</div>

							<div class="mb-3" id="prixField" style="display: none;">
								<label for="prix" class="form-label">Prix</label> <input
									type="number" step="0.01" class="form-control" id="prix"
									name="prix">
							</div>
							<!-- Ajoutez d'autres champs selon les besoins -->
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-bs-dismiss="modal">Fermer</button>
							<button type="submit" class="btn btn-primary">Ajouter</button>
						</div>
					</form>
				</div>
			</div>
		</div>

		<table class="table table-bordered">
			<thead>
				<tr>
					<th>Type</th>
					<th>Titre</th>
					<th>Faculté</th>
					<th>ISBN</th>
					<th>Prix</th>
					<th>Disponible</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<%
				List<Ouvrage> ouvrages = (List<Ouvrage>) request.getAttribute("ouvrages");
				if (ouvrages != null) {
					for (Ouvrage ouvrage : ouvrages) {
				%>
				<tr>
					<td><%=ouvrage.getType()%></td>
					<td><%=ouvrage.getTitre()%></td>
					<td><%=ouvrage.getFaculte()%></td>
					<td><%=ouvrage.getIsbn()%></td>
					<td><%=ouvrage.getPrix()%></td>
					<td><%=ouvrage.getDisponible()%></td>
					<td>
						<button class="image-buttons">
							<img alt="edit" src="${basePath}/images/edit.png" height="24px"
								width="24px">
						</button>
						<button class="image-buttons">
							<img alt="delete" src="${basePath}/images/delete.png"
								height="24px" width="24px">
						</button>
					</td>


				</tr>
				<%
				}
				}
				%>
			</tbody>
		</table>
	</div>

	<script>
		function toggleFields() {
			const type = document.getElementById("type").value;
			document.getElementById("faculteField").style.display = (type === "these" || type
					.startsWith("PFC")) ? "block" : "none";
			document.getElementById("promoteurField").style.display = (type === "these" || type
					.startsWith("PFC")) ? "block" : "none";
			document.getElementById("isbnField").style.display = (type === "livre") ? "block"
					: "none";
			document.getElementById("prixField").style.display = (type === "livre") ? "block"
					: "none";
		}
	</script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>

</body>
</html>
