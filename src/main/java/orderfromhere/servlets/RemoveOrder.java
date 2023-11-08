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

import orderfromhere.dao.FoodOrderDao;
import orderfromhere.dao.UserDao;
import orderfromhere.dto.FoodOrder;
import orderfromhere.dto.User;

@WebServlet("/removeorder")
public class RemoveOrder extends HttpServlet {

	EntityManagerFactory emf = Persistence.createEntityManagerFactory("order_from_here");
	EntityManager em = emf.createEntityManager();
	EntityTransaction et = em.getTransaction();

	UserDao userDao = new UserDao(em, et);
	FoodOrderDao foDao = new FoodOrderDao(em, et);

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		int id = Integer.parseInt(req.getParameter("oid"));

		FoodOrder fo = foDao.findFoodOrderById(id); 

		System.out.println(id);
		
		User user = (User) req.getSession().getAttribute("current_user");

		List<FoodOrder> foli = user.getFoodOrders();

		for (int i = 0; i < foli.size(); i++)
			if (foli.get(i).getId() == id) {
				foli.remove(i);
				break;
			}
		
		user.setFoodOrders(foli);
		userDao.updateUser(user);
		
		foDao.removeFoodOrder(fo);		
		
		req.getSession().setAttribute("current_user", user);

		resp.getWriter().print("<p id='msg-green'>Order removed!</p>");
		req.getRequestDispatcher("StaffHome.jsp?page=orders").include(req, resp);
	}
}
