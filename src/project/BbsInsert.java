package project;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import user.User;

/**
 * Servlet implementation class BbsInsert
 */
@WebServlet("/BbsInsert")
public class BbsInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BbsInsert() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String bbsTitle = request.getParameter("bbsTitle");
		String bbsContent = request.getParameter("bbsContent");
		int bbsPercent = Integer.parseInt(request.getParameter("bbsPercent"));
		String bbsStartDate = request.getParameter("bbsStartDate");
		String bbsLastDate = request.getParameter("bbsLastDate");
		String bbsUser = request.getParameter("bbsUser");
		
		System.out.println(bbsTitle);
		 System.out.println(bbsContent);
		 System.out.println(bbsPercent);
		 System.out.println(bbsStartDate);
		 System.out.println(bbsLastDate);
		 System.out.println(bbsUser + " " + "¿‘¥œ¥Ÿ");
		 
		 
		 BbsDAO insert = new BbsDAO();
		 
		 Bbs bbs = new Bbs(bbsTitle,bbsContent,bbsPercent,bbsStartDate,bbsLastDate,bbsUser);
		 
		 insert.write(bbs);
		
		 
		response.sendRedirect("project.jsp");
	}

}
