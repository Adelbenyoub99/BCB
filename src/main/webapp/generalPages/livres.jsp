<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="Models.Ouvrage" %>

<html>
<head>
    <title>Liste des Livres</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
   <link rel="stylesheet" href="../assets/style2.css">
     <link rel="stylesheet" href="../assets/style.css">
</head>
<body>
    <div class="container mt-4 " >
        <div class="d-flex align-items-start justify-content-center mt-2">
            <div class="d-flex align-items-center justify-content-between" style="width: 90%; border-bottom: 2px solid blue; background-color: #fff;">
                <h2 class="home-hdr" style="margin: 0px;">Liste des Livres : </h2>
                <a href="search.html">
                    <h6>Retour</h6>
                </a>
            </div>
        </div>
        <div class="row" style="margin: 0px 30px">
            <div class="col-md-12">
                <div class="d-flex align-items-start justify-content-center">
                    <table class="table table-hover table-bordered " border="1" id="myTable">
                        <thead style="position:sticky; top: 0;">
                            <tr>
                                <th>Code</th>
                               
                                <th>Titre</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                List<Ouvrage> livres = (List<Ouvrage>) request.getAttribute("livres");
                                for (Ouvrage livre : livres) {
                            %>
                          <tr data-bs-toggle="modal" data-bs-target="#exampleModal"
                           onclick="updateModal('<%= livre.getId_ouvrage() %>', '<%= livre.getTitre() %>', '<%= livre.getAuteur() %>',
                            '<%= livre.getDescription() %>', '<%= livre.getAnnee() %>', '<%= livre.getDisponible() %>', '<%= livre.getType() %>',
                             '<%= livre.getFaculte() %>', '<%= livre.getPromoteur() %>', '<%= livre.getIsbn() %>', '<%= livre.getPrix() %>')">
    							<td><%= livre.getId_ouvrage() %></td>
                              
                                <td><%= livre.getTitre() %></td>
                            </tr>
                            <%
                                }
                            %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal -->
    <div class="modal" id="exampleModal" aria-labelledby="exampleModalLabel" data-bs-backdrop="false" style="margin-top: 20px;position: relative; width: 50%; margin-right: 20px;">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-body">
                    <div class="d-flex align-items-center justify-content-between">
                    <h3>Détail d'Ouvrage :</h3>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                   
                    <h6 id="modalData"></h6>
                </div>
                <div class="modal-footer">
                    
                    <button type="button" class="btn btn-primary">reserver</button>
                </div>
            </div>
        </div>
    </div>
 
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
 
  
</body>
</html>
