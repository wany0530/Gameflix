package gameflix.web.contoller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import gameflix.web.entity.Game;
import gameflix.web.service.GameService;


@WebServlet("/searchResultPage")
public class GameListControl extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String query= "";
		int page = 1;
		String query_ = request.getParameter("q");
		String page_ = request.getParameter("p");
		if(query_ != null && !query_.equals("")) query = query_;
		if(page_ != null && !page_.equals("")) page = Integer.parseInt(page_);
		
		GameService service = new GameService();
		ArrayList<Game> list = service.getSearchList(query,page);
		int count = service.getCount(query);
		
		request.setAttribute("count", count);
		request.setAttribute("list", list);
		request.getRequestDispatcher("main/searchResultPage.jsp").forward(request, response);
	}
}
