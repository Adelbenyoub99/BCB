package Servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Models.Ouvrage;

/**
 * Servlet implementation class getLivres
 */
@WebServlet("/getLivresServlet")
public class getLivresServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public getLivresServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 List<Ouvrage> livres = Ouvrage.getLivres();
		 response.setContentType("text/html;charset=UTF-8");
	        response.setCharacterEncoding("UTF-8");
	        /*  ///test////
	        for (Ouvrage livre : livres) {
	            System.out.println( livre.getTitre());
	        }*/
	     // envoyer la list des livres as a request attribute
	        request.setAttribute("livres", livres);

	        // rediriger la requete vers livres.jsp
	        RequestDispatcher dispatcher = request.getRequestDispatcher("generalPages/livres.jsp");
	        dispatcher.forward(request, response);
	}

	

}
