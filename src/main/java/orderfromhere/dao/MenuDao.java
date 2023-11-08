package orderfromhere.dao;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;

import orderfromhere.dto.Menu;

public class MenuDao {
	EntityManager em;
	EntityTransaction et;

	public MenuDao(EntityManager em, EntityTransaction et) {
		this.em = em;
		this.et = et;
	}

	public Menu saveMenu(Menu menu) {
		et.begin();
		em.persist(menu);
		et.commit();
		return menu;
	}

	public Menu updateMenu(Menu menu) {
		et.begin();
		em.merge(menu);
		et.commit();
		return menu;
	}

	public Menu removeMenu(Menu menu) {
		et.begin();
		em.remove(menu);
		et.commit();
		return menu;
	}

	public Menu findMenuById(int id) {
		return em.find(Menu.class, id);
	}
}
