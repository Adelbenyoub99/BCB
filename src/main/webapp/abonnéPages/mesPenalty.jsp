<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.text.*" %>
<%@ page import="Models.Penalisation" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mes Penalisation</title>
</head>
<body>

 <div class="container-fluid mt-4">
 
 		 <div class="row mb-3 d-flex align-items-center" style="border-radius: 10px; border: 2px solid #4B91F1; background-color:#93BCEC ;">
          <div class="col-md-3 col-sm-6 d-flex align-items-center justify-content-center">
           <h6>Date de début: 09/01/2024 </h6>
          </div>
           <div class="col-md-2 col-sm-6 d-flex align-items-center justify-content-center">
           -------------------------------
           </div>
           <div class="col-md-2 col-sm-6 d-flex align-items-center justify-content-center">
           <h4> En cours</h4> 
           </div>
           <div class="col-md-2 col-sm-6 d-flex align-items-center justify-content-center ">
           ----------------------------->
           </div>
           <div class="col-md-3 col-sm-6 d-flex align-items-center justify-content-center">
           <h6>Date de fin: 20/01/2024</h6>
           </div>
        </div>
        <%
             List<Penalisation> userPenalties = (List<Penalisation>) request.getAttribute("penalties");
            for (Penalisation penalisation : userPenalties) {
                // Formatage des dates
                SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
                String startDate = dateFormat.format(penalisation.getDate_debut());
                String endDate = dateFormat.format(penalisation.getDate_fin());

                // Vérification si la date de fin est supérieure à la date actuelle
                boolean isDateInFuture = penalisation.getDate_fin().after(new Date());

                // Détermination de la couleur de fond en fonction de la date de fin
                 String backgroundColor = isDateInFuture ? "#93BCEC" : "#DBE6E6";
                 String etat = isDateInFuture ? "en cours" : "Terminer";

        %>
        <div class="row mb-3 d-flex align-items-center" style="border-radius: 10px; border: 2px solid #4B91F1; background-color: <%= backgroundColor %>;">
          <div class="col-md-3 col-sm-6 d-flex align-items-center justify-content-center">
           <h6>Date de début: <%= startDate %></h6>
          </div>
           <div class="col-md-2 col-sm-6 d-flex align-items-center justify-content-center">
           -------------------------------
           </div>
           <div class="col-md-2 col-sm-6 d-flex align-items-center justify-content-center">
           <h4> <%= etat %> </h4> 
           </div>
           <div class="col-md-2 col-sm-6 d-flex align-items-center justify-content-center ">
           ----------------------------->
           </div>
           <div class="col-md-3 col-sm-6 d-flex align-items-center justify-content-center">
           <h6>Date de fin: <%= endDate %></h6>
           </div>
           
            
        </div>
        <% }  %>
           <div class="row mb-3 d-flex align-items-center" style="border-radius: 10px; border: 2px solid #4B91F1; background-color:#DBE6E6;">
          <div class="col-md-3 col-sm-6 d-flex align-items-center justify-content-center">
           <h6>Date de début: 21/05/2023 </h6>
          </div>
           <div class="col-md-2 col-sm-6 d-flex align-items-center justify-content-center">
           -------------------------------
           </div>
           <div class="col-md-2 col-sm-6 d-flex align-items-center justify-content-center">
           <h4> Terminer</h4> 
           </div>
           <div class="col-md-2 col-sm-6 d-flex align-items-center justify-content-center ">
           ----------------------------->
           </div>
           <div class="col-md-3 col-sm-6 d-flex align-items-center justify-content-center">
           <h6>Date de fin: 03/06/2023</h6>
           </div>
        </div>    
          
    </div>
</body>
</body>
</html>