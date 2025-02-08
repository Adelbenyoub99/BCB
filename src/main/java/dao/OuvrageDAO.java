package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import Models.Ouvrage;
import Utils.Connexion;

public class OuvrageDAO {

    private Connection connection;

    public OuvrageDAO() {
        this.connection = new Connexion().ConnectBdd();  // Connexion à la base de données
    }

    // Méthode pour ajouter un ouvrage à la base de données
    public void add(Ouvrage ouvrage) {
        String query = "INSERT INTO ouvrages (titre, auteur, description, annee, type, faculte, promoteur, isbn, prix, disponible) "
                     + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, ouvrage.getTitre());
            statement.setString(2, ouvrage.getAuteur());
            statement.setString(3, ouvrage.getDescription());
            statement.setInt(4, ouvrage.getAnnee());
            statement.setString(5, ouvrage.getType());
            statement.setString(6, ouvrage.getFaculte());
            statement.setString(7, ouvrage.getPromoteur());
            statement.setString(8, ouvrage.getIsbn());
            statement.setDouble(9, ouvrage.getPrix());
            statement.setInt(10, ouvrage.getDisponible());

            int rowsInserted = statement.executeUpdate();
            if (rowsInserted > 0) {
                System.out.println("Ouvrage ajouté avec succès !");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    // Vous pouvez ajouter d'autres méthodes pour récupérer, modifier ou supprimer des ouvrages
}
