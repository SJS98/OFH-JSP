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
import orderfromhere.dto.Branch;
import orderfromhere.dto.Menu;
import orderfromhere.dto.User;

@WebServlet("/createcustomer")
public class CreateCustomer extends HttpServlet {
	EntityManagerFactory emf = Persistence.createEntityManagerFactory("order_from_here");
	EntityManager em = emf.createEntityManager();
	EntityTransaction et = em.getTransaction();

	UserDao userDao = new UserDao(em, et);
	MenuDao menuDao = new MenuDao(em, et);
	BranchDao branchDao = new BranchDao(em, et);

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String name = req.getParameter("username");
		String password = req.getParameter("password");
		long phone = Long.parseLong(req.getParameter("phone"));
		
		//do validation
	
		//...
		
		User user = new User();
		user.setName(name);
		user.setPhone(phone);
		user.setPassword(password);

		
		
		user.setRole("Customer");
		userDao.saveUser(user);

		resp.getWriter().print("<p id='msg-green'>Customer created successfully!</p>");
		req.getRequestDispatcher("StaffHome.jsp?page=customer.jsp").include(req, resp);
	}
}
