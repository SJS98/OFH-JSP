package orderfromhere.servlets;

import java.io.IOException;
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
import javax.servlet.http.HttpSession;

import org.hibernate.annotations.Loader;

import orderfromhere.dao.BranchDao;
import orderfromhere.dao.FoodProductDao;
import orderfromhere.dao.MenuDao;
import orderfromhere.dao.UserDao;
import orderfromhere.dto.FoodProduct;
import orderfromhere.dto.User;

@WebServlet(value = "/loginaccount", loadOnStartup = 1)
public class LoginAccount extends HttpServlet {

	EntityManagerFactory emf = Persistence.createEntityManagerFactory("order_from_here");
	EntityManager em = emf.createEntityManager();
	EntityTransaction et = em.getTransaction();

	UserDao userDao = new UserDao(em, et);
	MenuDao menuDao = new MenuDao(em, et);
	BranchDao branchDao = new BranchDao(em, et);
	FoodProductDao fpdao = new FoodProductDao(em, et);

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		long phone = Long.parseLong(req.getParameter("phone"));
		String password = req.getParameter("password");
		String role = req.getParameter("role");

		User currentUser = userDao.findUserByPhone(phone);

		if (currentUser == null) {
			resp.getWriter().print("<p id='msg-orange'>Invalid Phone Number!</p>");
			req.getRequestDispatcher("CreateAccountManager.jsp").include(req, resp);
			return;
		}

		if (!currentUser.getPassword().equals(password)) {
			resp.getWriter().print("<p id='msg-orange'>Invalid Password!</p>");
			req.getRequestDispatcher("CreateAccountManager.jsp").include(req, resp);
			return;
		}

		// New User for each login
		HttpSession session = req.getSession(true);
		
		session.setAttribute("current_user", currentUser);
		resp.getWriter().print("<p id='msg-green'>Welcome back, "+currentUser.getName().split(" ")[0]+"</p>");
		
		switch (role) {
		case "Manager": {
			List<User> staff =  userDao.getAllUsersByRole("Staff");
			req.getSession().setAttribute("staff", staff);
			req.getRequestDispatcher("ManagerHome.jsp").include(req, resp);
			return;
		}
		case "Staff": {
			
			List<FoodProduct> fpli = fpdao.getAll();
			
			req.getSession().setAttribute("fpli", fpli);

			List<User> customers = userDao.getAllUsersByRole("Customer");
			
			req.getSession().setAttribute("customers", customers);
			
			req.getRequestDispatcher("StaffHome.jsp").include(req, resp);
			return;
		}
		case "Customer": {
			req.getRequestDispatcher("CustomerHome.jsp").include(req, resp);
			return;
		}
		}
		
	}
}