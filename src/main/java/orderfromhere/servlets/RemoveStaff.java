package orderfromhere.servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import orderfromhere.dao.BranchDao;
import orderfromhere.dao.MenuDao;
import orderfromhere.dao.UserDao;
import orderfromhere.dto.User;

@WebServlet("/removestaff")
public class RemoveStaff extends HttpServlet{
	
	EntityManagerFactory emf = Persistence.createEntityManagerFactory("order_from_here");
	EntityManager em = emf.createEntityManager();
	EntityTransaction et = em.getTransaction();

	UserDao userDao = new UserDao(em, et);
	MenuDao menuDao = new MenuDao(em, et);
	BranchDao branchDao = new BranchDao(em, et);
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		int id = Integer.parseInt(req.getParameter("id"));
		
		userDao.removeUserById(id);
		
		User user = (User) req.getSession().getAttribute("current_user");
		
		List<User> staffli = (List<User>) req.getSession().getAttribute("staff");
		
		for(int i = 0; i < staffli.size(); i++)
			if(staffli.get(i).getId() == id) {
				staffli.remove(i);
				break;
			}
		
		req.getSession().setAttribute("staff", staffli);
		
		req.getSession().setAttribute("current_user", user);
		
		resp.getWriter().print("<p id='msg-green'>Staff Removed successfully!</p>");
		req.getRequestDispatcher("ManagerHome.jsp?page=staff").include(req, resp);
	}
}
