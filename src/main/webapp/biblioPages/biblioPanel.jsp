<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="Models.Bibliothecaire" %> 
    <%
    Bibliothecaire biblio=(Bibliothecaire) request.getAttribute("biblio");
   String type = (String) request.getAttribute("type");
   
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bibliothecaire</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link rel="stylesheet" href="${basePath}/assets/style3.css">
<link rel="stylesheet" href="${basePath}/assets/style.css">
</head>
<body>
<!--navBar-->
<nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top">
  <a class="navbar-brand" href="#">
    <img src="${basePath}/images/logo.png" alt="Logo" class="logo">
  </a>
  <a href="${basePath}/home.html?nom=<%= biblio.getNom_utilisateur() %>&password=<%= biblio.getMot_de_pass() %>" class="ms-auto me-4">
		<img src="${basePath}/images/homeIcon.png" class="home-icon"/>
  </a> 
</nav>

<div class="container-fluid "  style="margin-top: 80px">
<div class="row">
<div class="col-md-1 ">
<img  src="${basePath}/images/librarianAccount.png " style="height: 90px;width: 90px">
</div>
<div class="col-md-9 ms-4 mt-4">
<h4>Bienvenue,  <%= type%> </h4>

<h6> <%= biblio.getNom()%>  <%= biblio.getPrenom()%></h6>
</div>
<div class="col-md-1  ms-auto me-4 mt-4">
<button id="logoutBtn" class="btn btn-danger" onclick="deconnect()">
  deconnecter
</button>

</div>
<nav class="navbar navbar-expand-lg navbar-light" style="background-color: #e3f2fd; height: 60px">
    <div class="container-fluid ms-5">
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav mx-auto"> <!-- Updated class here -->
                <li class="nav-item">
                    <a class="nav-link active d-flex me-5" onclick="changeActive(this); getOuvrages();">
                        <img src="${basePath}/images/ouvrages.png" alt="Abonnés" class="nav-icon mt-1 me-2" height="50px" width="50px">
                        <h4 class="mt-4"> Ouvrages</h4>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link d-flex me-5" onclick="changeActive(this);getEmprunt();">
                        <img src="${basePath}/images/emprunt.png" alt="Bibliothèques" class="nav-icon mt-1 me-2" height="50px" width="50px">
                        <h4 class="mt-4"> Emprunts</h1>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link d-flex" onclick="changeActive(this); getDemande(); ">
                        <img src="${basePath}/images/demandes.png" alt="Pénalisation" class="nav-icon mt-1 me-2" height="50px" width="50px">
                        <h4 class="mt-4"> Demandes </h4>
                    </a>
                </li>
            </ul>
        </div>
    </div>
</nav>




<div id="tableContainer" class="d-flex ligne-item-center justify-content-center " >


</div>











<script>
var type = '<%=type%>' || null;
if (type) {
    localStorage.setItem('type', type);  
}
function deconnect(){ 
	 localStorage.removeItem('type');
	 window.location.href = '${basePath}/home.html';

} 
function changeActive(link) {
	    // Remove the 'active' class from all links
	    document.querySelectorAll('.navbar-nav .nav-link').forEach(function (navLink) {
	      navLink.classList.remove('active');
	    });

	    // Add the 'active' class to the clicked link
	    link.classList.add('active');
}
function getOuvrages(){
	var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            document.getElementById("tableContainer").innerHTML = this.responseText;
        }
    };
    xhttp.open("GET", "${basePath}/ouvrageServlet" , true);
    xhttp.send();
}
function getEmprunt(){
	var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            document.getElementById("tableContainer").innerHTML = this.responseText;
        }
    };
    xhttp.open("GET", "${basePath}/empruntServlet" , true);
    xhttp.send();
}
function getDemande(){
	var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            document.getElementById("tableContainer").innerHTML = this.responseText;
        }
    };
    xhttp.open("GET", "${basePath}/demandeServlet" , true);
    xhttp.send();
}
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script> 
 

</body>
</html>