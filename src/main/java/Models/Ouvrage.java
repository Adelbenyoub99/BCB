package Models;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Utils.Connexion;

public class Ouvrage {

	    private String titre;
	    private String auteur;
	    private String description;
	    private int annee;
	    private int disponible = 1; // Par défaut, disponible
	    private String type;
	    private String faculte = ""; // Champ facultatif
	    private String promoteur = ""; // Champ facultatif
	    private String isbn = ""; // Champ facultatif
	    private double prix = 0.0; // Champ facultatif
		public Ouvrage() {
		}
		public Ouvrage(String titre, String auteur, String description, int annee, String type,
                String faculte, String promoteur, String isbn, double prix) {

	        this.titre = titre;
	        this.auteur = auteur;
	        this.description = description;
	        this.annee = annee;
	        this.type = type;
	        this.faculte = faculte != null ? faculte : "";
	        this.promoteur = promoteur != null ? promoteur : "";
	        this.isbn = isbn != null ? isbn : "";
	        this.prix = prix;
		}

		public String getTitre() {
			return titre;
		}
		public void setTitre(String titre) {
			this.titre = titre;
		}
		public String getAuteur() {
			return auteur;
		}
		public void setAuteur(String auteur) {
			this.auteur = auteur;
		}
		public String getDescription() {
			return description;
		}
		public void setDescription(String description) {
			this.description = description;
		}
		public int getAnnee() {
			return annee;
		}
		public void setAnnee(int annee) {
			this.annee = annee;
		}
		public int getDisponible() {
			return disponible;
		}
		public void setDisponible(int disponible) {
			this.disponible = disponible;
		}
		public String getType() {
			return type;
		}
		public void setType(String type) {
			this.type = type;
		}
		public String getFaculte() {
			return faculte;
		}
		public void setFaculte(String faculte) {
			this.faculte = faculte;
		}
		public String getPromoteur() {
			return promoteur;
		}
		public void setPromoteur(String promoteur) {
			this.promoteur = promoteur;
		}
		public String getIsbn() {
			return isbn;
		}
		public void setIsbn(String isbn) {
			this.isbn = isbn;
		}
		public double getPrix() {
			return prix;
		}
		public void setPrix(double prix) {
			this.prix = prix;
		}

		
		
		
		
		
		
		
		/////////////////////////affichage d'un ouvrage ///////////////////
		private static Ouvrage mapResultSetToOuvrage(ResultSet resultSet) throws SQLException {
		    Ouvrage ouvrage = new Ouvrage();

		    ouvrage.setTitre(resultSet.getString("titre"));
		    ouvrage.setAuteur(resultSet.getString("auteur"));
		    ouvrage.setDescription(resultSet.getString("description"));
		    ouvrage.setAnnee(resultSet.getInt("annee"));
		    ouvrage.setDisponible(resultSet.getInt("disponible"));
		    ouvrage.setType(resultSet.getString("type"));
		    ouvrage.setFaculte(resultSet.getString("faculte"));
		    ouvrage.setPromoteur(resultSet.getString("promoteur"));
		    ouvrage.setIsbn(resultSet.getString("isbn"));
		    ouvrage.setPrix(resultSet.getDouble("prix"));

		    // Add any additional attributes here...

		    return ouvrage;
		}
		/////////////////////////selectionner les livres/////////////////////
		public static List<Ouvrage> getLivres() {
			
			List<Ouvrage> livres = new ArrayList<>();
	       
	        Connexion co = new Connexion();
	        try (Connection conn = co.ConnectBdd()) {
	            if (conn != null) {
	                System.out.println("Connection successful!");
	                String query = "SELECT * FROM `ouvrage` WHERE type = 'Livre'"; 
		            try (PreparedStatement preparedStatement = conn.prepareStatement(query)) {
		            	try (ResultSet resultSet = preparedStatement.executeQuery()) {
		      	            while (resultSet.next()) {
		      	                Ouvrage livre = mapResultSetToOuvrage(resultSet);
		      	                livres.add(livre);
		      	            }

		      	        } catch (SQLException e) {
		      	            e.printStackTrace();
		      	        }
		      	      return livres;
		            }
	               
	            } else {
	                System.out.println("Connection is null. Check your configuration.");
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return null;   
	    }   

		
		//////////////////////selectionner les theses///////////////////////
		public static List<Ouvrage> getThese() {
			List<Ouvrage> Theses = new ArrayList<>();
		       
	        Connexion co = new Connexion();
	        try (Connection conn = co.ConnectBdd()) {
	            if (conn != null) {
	                System.out.println("Connection successful!");
	                String query = "SELECT * FROM `ouvrage` WHERE type = 'these'"; 
		            try (PreparedStatement preparedStatement = conn.prepareStatement(query)) {
		            	try (ResultSet resultSet = preparedStatement.executeQuery()) {
		      	            while (resultSet.next()) {
		      	                Ouvrage these = mapResultSetToOuvrage(resultSet);
		      	                Theses.add(these);
		      	            }

		      	        } catch (SQLException e) {
		      	            e.printStackTrace();
		      	        }
		      	      return Theses;
		            }
	               
	            } else {
	                System.out.println("Connection is null. Check your configuration.");
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return null;   
	        
	    }   
		
		
		//////////////////// search ouvrage //////////////////////////
		public static List<Ouvrage> searchOuvrage(String keyword) {
		    if (keyword == null || keyword.trim().isEmpty()) {
		        return null;
		    }

		    List<Ouvrage> searchResults = new ArrayList<>();
		    String[] keywords = keyword.trim().split("\\s+");
		    String[] columns = {"titre", "auteur", "description", "annee", "type", "faculte", "promoteur", "isbn"};
		    
		    // Construire la requête de recherche dynamique
		    StringBuilder queryBuilder = new StringBuilder("SELECT * FROM `ouvrage` WHERE ");
		    for (int i = 0; i < keywords.length; i++) {
		        if (i > 0) queryBuilder.append(" OR ");
		        queryBuilder.append("(");
		        for (int j = 0; j < columns.length; j++) {
		            if (j > 0) queryBuilder.append(" OR ");
		            queryBuilder.append(columns[j]).append(" LIKE ?");
		        }
		        queryBuilder.append(")");
		    }

		    try (Connection conn = Connexion.ConnectBdd();
		         PreparedStatement preparedStatement = conn.prepareStatement(queryBuilder.toString())) {
		        int parameterIndex = 1;
		        for (String keywordPart : keywords) {
		            for (int j = 0; j < columns.length; j++) {
		                preparedStatement.setString(parameterIndex++, "%" + keywordPart + "%");
		            }
		        }

		        try (ResultSet resultSet = preparedStatement.executeQuery()) {
		            while (resultSet.next()) {
		                Ouvrage ouvrage = mapResultSetToOuvrage(resultSet);
		                searchResults.add(ouvrage);
		            }
		        }
		    } catch (SQLException e) {
		        e.printStackTrace();
		    }

		    return searchResults;
		}


	    ///////////////////////// Affichage de tous les ouvrages ///////////////////////
	    public static List<Ouvrage> getAllOuvrages() {
	        List<Ouvrage> ouvrages = new ArrayList<>();
	        Connexion co = new Connexion();

	        try (Connection conn = co.ConnectBdd()) {
	            if (conn != null) {
	                String query = "SELECT * FROM `ouvrage`";

	                try (PreparedStatement preparedStatement = conn.prepareStatement(query);
	                     ResultSet resultSet = preparedStatement.executeQuery()) {

	                    while (resultSet.next()) {
	                        Ouvrage ouvrage = mapResultSetToOuvrage(resultSet);
	                        ouvrages.add(ouvrage);
	                    }
	                }
	            } else {
	                System.out.println("Connection is null. Check your configuration.");
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }

	        return ouvrages;
	    }

   public static void main(String[] args) throws SQLException {
		 String n = "exactes Livre";
		System.out.println(searchOuvrage(n)); 
		 System.out.println(getAllOuvrages());
	 }
}
