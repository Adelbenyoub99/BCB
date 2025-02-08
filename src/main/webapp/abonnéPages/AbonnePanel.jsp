<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.text.*"%>
<%@ page import="Models.Abonné"%>
<%
Abonné abonne = (Abonné) request.getAttribute("abonne");
String type = (String) request.getAttribute("type");
String genre = abonne.getGenre();
int ID = abonne.getId_utilisateur();
boolean isEtu = true;
if ("enseignant".equals(abonne.getType())) {
	genre = null;
	isEtu = false;
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Abonné</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<link rel="stylesheet" href="${basePath}/assets/style3.css">
<link rel="stylesheet" href="${basePath}/assets/style.css">
</head>
<body>

	<nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top">
		<a class="navbar-brand" href="#"> <img
			src="${basePath}/images/logo.png" alt="Logo" class="logo">
		</a> <a
			href="${basePath}/home.html?nom=<%= abonne.getNom_utilisateur() %>&password=<%= abonne.getMot_de_pass() %>"
			class="ms-auto me-4"> <img src="${basePath}/images/homeIcon.png"
			class="home-icon" />
		</a>
	</nav>


	<div class="container-fluid " style="margin-top: 80px">
		<div class="row">
			<div class="col-md-1 ">

				<%
				if ("male".equals(genre)) {
				%>
				<img src="${basePath}/images/maleAccount.png"
					style="height: 90px; width: 90px">
				<%
				} else if ("femelle".equals(genre)) {
				%>
				<img src="${basePath}/images/femaleAccount.png"
					style="height: 90px; width: 90px">
				<%
				} else {
				%>
				<img src="${basePath}/images/teach.png"
					style="height: 90px; width: 90px">
				<%
				}
				%>



			</div>
			<div class="col-md-9 ms-2 mt-4">
				<h4>
					Bienvenue,
					<%=type%>
				</h4>

				<h6>
					<%=abonne.getNom()%>
					<%=abonne.getPrenom()%></h6>
			</div>
			<div class="col-md-1  ms-auto me-4 mt-4">
				<button id="logoutBtn" class="btn btn-danger" onclick="deconnect()">
					deconnecter</button>

			</div>
			<nav class="navbar navbar-expand-lg navbar-light"
				style="background-color: #e3f2fd; height: 60px">
				<div class="container-fluid ms-5">
					<div class="collapse navbar-collapse" id="navbarNav">
						<ul class="navbar-nav mx-auto">
							<!-- Updated class here -->
							<li class="nav-item"><a class="nav-link active d-flex me-5"
								onclick="changeActive(this);getMesEmprunt() "> <img
									src="${basePath}/images/mesEmprunt.png" alt="Abonnés"
									class="nav-icon mt-1 me-2" height="50px" width="48px">
									<h4 class="mt-4">Mes Emprunts</h4>
							</a></li>
							<li class="nav-item"><a class="nav-link d-flex me-5"
								onclick="changeActive(this); getMesReserves()"> <img
									src="${basePath}/images/reserve.png" alt="Bibliothèques"
									class="nav-icon mt-1 me-2" height="48px" width="48px">
									<h4 class="mt-4">
										Mes Reservation
										</h1></a></li>
							<li class="nav-item"><a class="nav-link d-flex"
								onclick="changeActive(this); getMesPenalty()"> <img
									src="${basePath}/images/no_book.png" alt="Pénalisation"
									class="nav-icon  me-2" height="55px" width="55px">
									<h4 class="mt-4">Mes Penalisations</h4>
							</a></li>
						</ul>
					</div>
				</div>
			</nav>

			<div id="tableContainer"
				class="d-flex ligne-item-center justify-content-center "></div>




			<script>
var type = '<%=type%>' || null;
var gnr = '<%=genre%>' || null;
var isEtu = '<%=isEtu%>'|| null;
var id = '<%=ID%>
				';
				if (type) {
					localStorage.setItem('type', type);
					localStorage.setItem('genre', gnr);
					localStorage.setItem('isEtu', isEtu);
				}
				function deconnect() {
					localStorage.removeItem('type');
					localStorage.removeItem('genre');
					localStorage.removeItem('isEtu');
					window.location.href = '${basePath}/home.html';

				}
				function changeActive(link) {
					// Remove the 'active' class from all links
					document.querySelectorAll('.navbar-nav .nav-link').forEach(
							function(navLink) {
								navLink.classList.remove('active');
							});

					// Add the 'active' class to the clicked link
					link.classList.add('active');
				}
				function getMesEmprunt() {
					var xhttp = new XMLHttpRequest();
					xhttp.onreadystatechange = function() {
						if (this.readyState == 4 && this.status == 200) {
							document.getElementById("tableContainer").innerHTML = this.responseText;
						}
					};
					xhttp.open("GET", "${basePath}/userEmprunServlet?ID=" + id,
							true);
					xhttp.send();
				}
				function getMesPenalty() {
					var xhttp = new XMLHttpRequest();
					xhttp.onreadystatechange = function() {
						if (this.readyState == 4 && this.status == 200) {
							document.getElementById("tableContainer").innerHTML = this.responseText;
						}
					};
					xhttp.open("GET",
							"${basePath}/userPenaltyServlet?ID=" + id, true);
					xhttp.send();
				}
				function getMesReserves() {
					var xhttp = new XMLHttpRequest();
					xhttp.onreadystatechange = function() {
						if (this.readyState == 4 && this.status == 200) {
							document.getElementById("tableContainer").innerHTML = this.responseText;
						}
					};
					xhttp.open("GET", "${basePath}/userReservServlet?ID=" + id,
							true);
					xhttp.send();
				}
			</script>
			<script
				src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
				integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
				crossorigin="anonymous"></script>
</body>
</html>