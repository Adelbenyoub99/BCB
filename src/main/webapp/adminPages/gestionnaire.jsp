<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Models.Gestionnair" %>   
<%
    Gestionnair gestionnaire = (Gestionnair) request.getAttribute("gestionnaire");
   String type = (String) request.getAttribute("type");
    String nom = "inconnu"; 
    String prenom= null;
    if (gestionnaire != null) {
        nom = gestionnaire.getNom();
        prenom=gestionnaire.getPrenom();
        
    }
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Pannel</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

<link rel="stylesheet" href="${basePath}/assets/style3.css">
<link rel="stylesheet" href="${basePath}/assets/style.css">
<style>
   
    
</style>

</head>
<body>
<!--navBar-->
<nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top">
  <a class="navbar-brand" href="#">
    <img src="${basePath}/images/logo.png" alt="Logo" class="logo">
  </a>
  <a href="${basePath}/home.html?nom=<%= gestionnaire.getNom_utilisateur() %>&password=<%= gestionnaire.getMot_de_pass() %>" class="ms-auto me-4">
		<img src="${basePath}/images/homeIcon.png" class="home-icon"/>
  </a> 
</nav>
<!--main-->

<div class="container-fluid "  style="margin-top: 80px">
<div class="row">
<div class="col-md-1 ">
<img  src="${basePath}/images/adminAccount.png " style="height: 100px;width: 150px">
</div>
<div class="col-md-9 ms-4 mt-4">
<h4>Bienvenue,  <%= type%> </h4>

<h6> <%= gestionnaire.getNom()%>  <%= gestionnaire.getPrenom()%></h6>
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
                    <a class="nav-link active d-flex me-5" onclick="changeActive(this); getAbonnes();">
                        <img src="${basePath}/images/students.png" alt="Abonnés" class="nav-icon mt-1" height="50px" width="50px">
                        <h4 class="mt-4"> Abonnés</h4>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link d-flex me-5" onclick="changeActive(this); getBiblio();">
                        <img src="${basePath}/images/workers.png" alt="Bibliothèques" class="nav-icon mt-1 " height="50px" width="50px">
                        <h4 class="mt-4"> Bibliothécaires</h1>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link d-flex" onclick="changeActive(this); getPenalty();">
                        <img src="${basePath}/images/penalty.png" alt="Pénalisation" class="nav-icon mt-1" height="50px" width="50px">
                        <h4 class="mt-4"> Pénalisation </h4>
                    </a>
                </li>
            </ul>
        </div>
    </div>
</nav>


</div>
</div>

<div id="tableContainer" class="d-flex ligne-item-center justify-content-center mx-5" >


</div>















<script>
         var type = '<%=type%>' || null;
         if (type) {
             localStorage.setItem('type', type);  
         }
         function deconnect(){ 
        	 localStorage.removeItem('type');
        	 window.location.href = '${basePath}home.html';
 
         } 
         function changeActive(link) {
        	    // Remove the 'active' class from all links
        	    document.querySelectorAll('.navbar-nav .nav-link').forEach(function (navLink) {
        	      navLink.classList.remove('active');
        	    });

        	    // Add the 'active' class to the clicked link
        	    link.classList.add('active');
        }
         function getAbonnes(){
        	 var xhttp = new XMLHttpRequest();
             xhttp.onreadystatechange = function() {
                 if (this.readyState == 4 && this.status == 200) {
                     document.getElementById("tableContainer").innerHTML = this.responseText;
                 }
             };
             xhttp.open("GET", "${basePath}/abonneServelt" , true);
             xhttp.send();
         }
         function getBiblio(){
        	 var xhttp = new XMLHttpRequest();
             xhttp.onreadystatechange = function() {
                 if (this.readyState == 4 && this.status == 200) {
                     document.getElementById("tableContainer").innerHTML = this.responseText;
                 }
             };
             xhttp.open("GET", "${basePath}/biblioServlet" , true);
             xhttp.send();
         }
         function getPenalty(){
        	 var xhttp = new XMLHttpRequest();
             xhttp.onreadystatechange = function() {
                 if (this.readyState == 4 && this.status == 200) {
                     document.getElementById("tableContainer").innerHTML = this.responseText;
                 }
             };
             xhttp.open("GET", "${basePath}/penaltyServlet" , true);
             xhttp.send();
         }
         function refuserPenalite(penaliteId) {
             console.log("Refuser Penalite ID: " + penaliteId);
             var row = document.getElementById("penaltyRow_" + penaliteId);
             if (row) {
                 row.remove();
             }
         }
         function validerTout() {
             // Ajouter le code pour valider toutes les pénalités ici
             console.log("Validation de toutes les pénalités");

             // Modifier l'icône de toutes les lignes vers check.png
             var imageButtons = document.querySelectorAll('.image-buttons img');
             imageButtons.forEach(function (img) {
                 img.src = '${basePath}/images/check.png';
             });
         }
         
</script>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script> 
 
</body>
</html>