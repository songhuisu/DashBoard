package user;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.Bbs;
import project.BbsDAO;

/**
 * Servlet implementation class Userjoin
 */
@WebServlet("/Userjoin")
public class Userjoin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Userjoin() {
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
		
		request.setCharacterEncoding("utf-8");
		
		String jid = request.getParameter("inId");
		String jpw = request.getParameter("inPass");
		String jrepass = request.getParameter("inRePass");
		String jName = request.getParameter("inName");
		String jEmail = request.getParameter("inEmail");
		
		 System.out.println(jid);
		 System.out.println(jpw);
		 System.out.println(jrepass);
		 System.out.println(jName);
		 System.out.println(jEmail);
		 
		 UserDAO jdao = new UserDAO();
		 
		 jdao.join(jid, jpw, jrepass, jName,jEmail);
		 
		response.sendRedirect("login.jsp");
		 
		 
		 
	}

}
