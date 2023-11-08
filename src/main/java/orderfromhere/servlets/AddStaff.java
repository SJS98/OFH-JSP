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

@WebServlet("/add-staff")
public class AddStaff extends HttpServlet{
	
	EntityManagerFactory emf = Persistence.createEntityManagerFactory("order_from_here");
	EntityManager em = emf.createEntityManager();
	EntityTransaction et = em.getTransaction();

	UserDao userDao = new UserDao(em, et);
	MenuDao menuDao = new MenuDao(em, et);
	BranchDao branchDao = new BranchDao(em, et);
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		String name = req.getParameter("sname");
		long phone = Long.parseLong(req.getParameter("sphone"));
		String password = req.getParameter("spassword");
		
		if(userDao.findUserByPhone(phone)!=null) {
			
			resp.getWriter().print("<p id='msg-orange'>Phone number alresady in use!</p>");
			req.getRequestDispatcher("ManagerHome.jsp").include(req, resp);
			return;
			
		}
		
		User user = (User) req.getSession().getAttribute("current_user");
		
		User staff = new User();
		staff.setRole("Staff");
		
		staff.setName(name);
		staff.setPhone(phone);
		staff.setPassword(password);
		staff.setFoodOrders(new ArrayList<>());
		
		System.out.println("Came");
		userDao.saveUser(staff);
		System.out.println("Came");
		List<User> staffli = (List<User>) req.getSession().getAttribute("staff");
		
		staffli.add(staff);
		
		req.getSession().setAttribute("staff", staffli);
		
		req.getSession().setAttribute("current_user", user);
		
		resp.getWriter().print("<p id='msg-green'>Staff Added successfully!</p>");
		req.getRequestDispatcher("ManagerHome.jsp?page=staff").include(req, resp);
	}
}
