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

@WebServlet("/createaccount")
public class CreateAccount extends HttpServlet {
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
		String role = req.getParameter("role");

		long phone = Long.parseLong(req.getParameter("phone"));
		
		User user = new User();
		user.setName(name);
		user.setPhone(phone);
		user.setPassword(password);

		switch (role) {
		case "Manager": {
			createManager(name, phone, password, req, resp, user);
			return;
		}
		case "Staff": {
			createStaff(name, phone, password, req, resp, user);
			return;
		}
		case "Customer": {
			createCustomer(name, phone, password, req, resp, user);
			return;
		}
		}
	}

	private void createCustomer(String name, long phone, String password, HttpServletRequest req,
			HttpServletResponse resp, User user) throws IOException, ServletException {
		user.setRole("Customer");
		userDao.saveUser(user);

		resp.getWriter().print("<p id='msg-green'>Customer created successfully!</p>");
		req.getRequestDispatcher("CreateAccountCustomer.html").include(req, resp);
	}

	private void createStaff(String name, long phone, String password, HttpServletRequest req, HttpServletResponse resp,
			User user) throws IOException, ServletException {
		user.setRole("Staff");
		userDao.saveUser(user);

		resp.getWriter().print("<p id='msg-green'>Staff created successfully!</p>");
		req.getRequestDispatcher("CreateAccountStaff.html").include(req, resp);
	}

	private void createManager(String name, long phone, String password, HttpServletRequest req,
			HttpServletResponse resp, User user) throws IOException, ServletException {
		
		user.setRole("Manager");
		userDao.saveUser(user);

		Menu menu = new Menu();
		menu.setFoodProducts(new ArrayList<>());

		menuDao.saveMenu(menu);

		String branchName = req.getParameter("branchname");
		String city = req.getParameter("city");
		String state = req.getParameter("state");
		String landmark = req.getParameter("landmark");
		String bphone = req.getParameter("bphone");

		Branch branch = new Branch();

		branch.setAddress(landmark + ", " + city + ", " + state);
		branch.setName(branchName);
		branch.setPhone(Long.parseLong(bphone));

		branchDao.saveBranch(branch);

		List<Branch> branches = new ArrayList<>();
		branches.add(branch);

		user.setMenu(menu);
		user.setBranches(branches);

		userDao.updateUser(user);
		
		resp.getWriter().print("<p id='msg-green'>Manager created successfully!</p>");
		req.getRequestDispatcher("CreateAccountManager.jsp").include(req, resp);
	}
}
