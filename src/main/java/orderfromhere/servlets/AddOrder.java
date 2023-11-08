package orderfromhere.servlets;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import orderfromhere.dao.ItemDao;
import orderfromhere.dao.MenuDao;
import orderfromhere.dao.UserDao;
import orderfromhere.dto.FoodOrder;
import orderfromhere.dto.FoodProduct;
import orderfromhere.dto.Item;
import orderfromhere.dto.User;

@WebServlet("/placeorder")
public class AddOrder extends HttpServlet {

	EntityManagerFactory emf = Persistence.createEntityManagerFactory("order_from_here");
	EntityManager em = emf.createEntityManager();
	EntityTransaction et = em.getTransaction();

	UserDao userDao = new UserDao(em, et);
	MenuDao menuDao = new MenuDao(em, et);
	BranchDao branchDao = new BranchDao(em, et);
	FoodProductDao fpDao = new FoodProductDao(em, et);
	FoodOrderDao foDao = new FoodOrderDao(em, et);
	ItemDao iDao = new ItemDao(em, et);
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String ids_ = req.getParameter("ids");
		String cname = req.getParameter("cname");
		String cpassword = req.getParameter("cpassword");
		String cphone = req.getParameter("cphone");
		String checkCustExist = req.getParameter("custcheck"); 

		// if customer does not exist just create new

		long custphone = Long.parseLong(cphone);
		User customer = userDao.findUserByPhone(custphone);
		
		if (checkCustExist == null) {
			if(customer == null) {
				customer = new User();
				customer.setName(cname);
				customer.setPassword(cpassword);
				customer.setPhone(custphone);
				customer.setRole("Customer");
				customer.setBranches(new ArrayList<>());
				customer.setFoodOrders(new ArrayList<>());
				userDao.saveUser(customer);
			}			
		}
		
		System.out.println(ids_);

		List<Item> ids = new ArrayList<>();
		String[] idArr = ids_.split("-");

		// finding -> id - count
		Map<String, Integer> idcount = new HashMap<>();

		for (String id : idArr) {
			if (idcount.containsKey(id)) {
				idcount.put(id, idcount.get(id) + 1);
				continue;
			}
			idcount.put(id, 1);
		}

		double total = 0;

		for (Map.Entry<String, Integer> id_count : idcount.entrySet()) {
			int id = Integer.parseInt(id_count.getKey());
			FoodProduct fp = fpDao.findFoodProductById(id);

			Item item = new Item();

			item.setName(fp.getName());
			item.setPrice(fp.getPrice());
			item.setProductId(id);
			item.setType(fp.getType());
			item.setQuality(id_count.getValue());

			ids.add(item);
			
			iDao.saveItem(item);
			
			total += fp.getPrice() * item.getQuality();
		}

		FoodOrder order = new FoodOrder();
		order.setCustomerName(cname);
		order.setContactNumber(Long.parseLong(cphone));
		order.setTotalPrice(total);
		order.setStatus("Pending");
		order.setItems(ids);
		
		LocalDateTime date = LocalDateTime.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yy HH:mm:ss");
		String currentDateTime = formatter.format(date);
		
		order.setOrderCreationTime(currentDateTime);

		foDao.saveFoodOrder(order);
		
		User user = (User) req.getSession().getAttribute("current_user");

		List<FoodOrder> foli = user.getFoodOrders();

		if(foli == null) {
			foli = new ArrayList<>();
		}
		
		foli.add(order);
		
		user.setFoodOrders(foli);
		
		userDao.updateUser(user);
		
		
		
		// Adding order into customer list
//		List<FoodOrder> oli = customer.getFoodOrders();
//		oli.add(order);
//		user.setFoodOrders(oli);
//		userDao.updateUser(customer);
		
		
		
		resp.getWriter().print("<p id='msg-green'>Order Placed!</p>");
		req.getRequestDispatcher("StaffHome.jsp?page=order").include(req, resp);

	}
}
