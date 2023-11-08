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
import orderfromhere.dto.FoodProduct;
import orderfromhere.dto.Menu;
import orderfromhere.dto.User;

@WebServlet("/removefood")
public class RemoveFood extends HttpServlet {

	EntityManagerFactory emf = Persistence.createEntityManagerFactory("order_from_here");
	EntityManager em = emf.createEntityManager();
	EntityTransaction et = em.getTransaction();

	UserDao userDao = new UserDao(em, et);
	MenuDao menuDao = new MenuDao(em, et);
	BranchDao branchDao = new BranchDao(em, et);
	FoodProductDao pdao = new FoodProductDao(em, et);

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		int id = Integer.parseInt(req.getParameter("id"));

		FoodProduct fp = pdao.findFoodProductById(id);

		System.out.println(id);
		User user = (User) req.getSession().getAttribute("current_user");

		List<FoodProduct> fpli = (List<FoodProduct>) req.getSession().getAttribute("fpli");

		for (int i = 0; i < fpli.size(); i++)
			if (fpli.get(i).getId() == id) {
				fpli.remove(i);
				break;
			}
		
		Menu menu = user.getMenu();
		menu.setFoodProducts(fpli);

		menuDao.updateMenu(menu);

		pdao.removeFoodProduct(fp);

		user.setMenu(menu);

		req.getSession().setAttribute("fpli", fpli);

		req.getSession().setAttribute("current_user", user);

		resp.getWriter().print("<p id='msg-green'>Product removed successfully!</p>");
		req.getRequestDispatcher("ManagerHome.jsp?page=menu").include(req, resp);
	}
}
