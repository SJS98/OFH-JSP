package orderfromhere.servlets;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.stream.Collectors;

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
import orderfromhere.dao.FoodOrderDao;
import orderfromhere.dao.FoodProductDao;
import orderfromhere.dao.MenuDao;
import orderfromhere.dao.UserDao;
import orderfromhere.dto.FoodOrder;
import orderfromhere.dto.FoodProduct;
import orderfromhere.dto.Menu;
import orderfromhere.dto.User;

@WebServlet(value = "/changeOrderStatus", loadOnStartup = 1)
public class ChangeOrderStatus extends HttpServlet {

	EntityManagerFactory emf = Persistence.createEntityManagerFactory("order_from_here");
	EntityManager em = emf.createEntityManager();
	EntityTransaction et = em.getTransaction();

	UserDao userDao = new UserDao(em, et);
	MenuDao menuDao = new MenuDao(em, et);
	BranchDao branchDao = new BranchDao(em, et);
	FoodProductDao fpDao = new FoodProductDao(em, et);
	FoodOrderDao foDao = new FoodOrderDao(em, et);

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String orderId_ = req.getParameter("id");
		String status = req.getParameter("status");

		User user = (User) req.getSession().getAttribute("current_user");

		List<FoodOrder> orders = user.getFoodOrders();

		FoodOrder order = orders.stream().filter((o) -> o.getId() == Integer.parseInt(orderId_))
				.collect(Collectors.toList()).get(0);

		// toggling status
		order.setStatus(status.equals("Pending") ? "Ready" : "Delivered");

		if (order.getStatus().equals("Delivered")) {

			LocalDateTime date = LocalDateTime.now();
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yy HH:mm:ss");
			String currentDateTime = formatter.format(date);

			order.setOrderDeliveryTime(currentDateTime);
		}

		foDao.updateFoodOrder(order);

		for (int i = 0; i < orders.size(); i++) {
			FoodOrder o = orders.get(i);
			if (o.getId() == Integer.parseInt(orderId_)) {
				o.setStatus(status.equals("Pending") ? "Ready" : "Delivered");
				orders.set(i, o);
				break;
			}
		}

		user.setFoodOrders(orders);

		req.getSession().setAttribute("current_user", user);

		resp.getWriter().print("<p id='msg-green'>Status Changed!</p>");
		req.getRequestDispatcher("StaffHome.jsp?page=menu").include(req, resp);
	}
}