package Servlets;

import dao.OuvrageDAO; // Importer le DAO
import Models.Ouvrage;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/addOuvrageServlet") // URL mapping
public class addOuvrageServlet extends HttpServlet {
    private OuvrageDAO ouvrageDAO;

    @Override
    public void init() throws ServletException {
        super.init();
        // Initialisation de l'objet DAO
        ouvrageDAO = new OuvrageDAO();  // Assurez-vous que le DAO est correctement initialisé
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String titre = request.getParameter("titre");
        String auteur = request.getParameter("auteur");
        String description = request.getParameter("description");
        int annee = Integer.parseInt(request.getParameter("annee"));
        String type = request.getParameter("type");
        String faculte = request.getParameter("faculte");
        String promoteur = request.getParameter("promoteur");
        String isbn = request.getParameter("isbn");
        String prixStr = request.getParameter("prix");

        // Validation de l'année
        int currentYear = java.util.Calendar.getInstance().get(java.util.Calendar.YEAR);
        if (annee > currentYear || String.valueOf(annee).length() != 4) {
            throw new IllegalArgumentException("Année invalide");
        }

        // Validation des champs selon le type
        if (type.equals("these") || type.startsWith("PFC")) {
            if (faculte == null || promoteur == null) {
                throw new IllegalArgumentException("Faculté et promoteur sont obligatoires pour ce type");
            }
        } else if (type.equals("livre")) {
            if (isbn == null || prixStr == null) {
                throw new IllegalArgumentException("ISBN et prix sont obligatoires pour ce type");
            }
        }

        double prix = prixStr != null ? Double.parseDouble(prixStr) : 0.0;

        // Création de l'ouvrage
        Ouvrage ouvrage = new Ouvrage(titre, auteur, description, annee, type, faculte, promoteur, isbn, prix);

        // Utilisation de OuvrageDAO pour ajouter l'ouvrage
        ouvrageDAO.add(ouvrage);

        // Redirection vers une page de succès
        response.sendRedirect("success.jsp");
    }
}
