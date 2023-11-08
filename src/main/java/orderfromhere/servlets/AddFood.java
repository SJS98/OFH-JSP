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

import orderfromhere.dao.BranchDao;
import orderfromhere.dao.FoodProductDao;
import orderfromhere.dao.MenuDao;
import orderfromhere.dao.UserDao;
import orderfromhere.dto.FoodOrder;
import orderfromhere.dto.FoodProduct;
import orderfromhere.dto.Menu;
import orderfromhere.dto.User;

@WebServlet("/add-food")
public class AddFood extends HttpServlet{
	
	EntityManagerFactory emf = Persistence.createEntityManagerFactory("order_from_here");
	EntityManager em = emf.createEntityManager();
	EntityTransaction et = em.getTransaction();

	UserDao userDao = new UserDao(em, et);
	MenuDao menuDao = new MenuDao(em, et);
	BranchDao branchDao = new BranchDao(em, et);
	FoodProductDao fpDao = new FoodProductDao(em, et); 
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		String fname = req.getParameter("fname");
		String ftype = req.getParameter("ftype");
		String fabout = req.getParameter("fabout");
		String favailability = req.getParameter("favailability");
		String fprice = req.getParameter("fprice");
		
		User user = (User) req.getSession().getAttribute("current_user");
		
		Menu menu = user.getMenu();

		List<FoodProduct> fpli = menu.getFoodProducts();

		for(FoodProduct eachfp : fpli) {
			if(eachfp.getName().equalsIgnoreCase(fname)) {
				resp.getWriter().print("<p id='msg-orange'>Already Added!</p>");
				req.getRequestDispatcher("ManagerHome.jsp").include(req, resp);
				return;
			}
		}
		
		
		FoodProduct fp = new FoodProduct();
		fp.setName(fname);
		fp.setAbout(fabout);
		fp.setAvailability(Integer.parseInt(favailability));
		fp.setPrice(Double.parseDouble(fprice));
		fp.setType(ftype);
		
		FoodProduct fpSaved = fpDao.saveFoodProduct(fp);
		
		fpli.add(fpSaved);
		
		menu.setFoodProducts(fpli);
		
		menuDao.updateMenu(menu);
		
		user.setMenu(menu);
		
		userDao.updateUser(user);
		
		req.getSession().setAttribute("current_user", user);
		
		resp.getWriter().print("<p id='msg-green'>Food Product Added!</p>");
		req.getRequestDispatcher("ManagerHome.jsp?page=menu").include(req, resp);
	}
}
