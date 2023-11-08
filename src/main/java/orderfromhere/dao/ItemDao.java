package orderfromhere.dao;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;

import orderfromhere.dto.Item;

public class ItemDao {

	EntityManager em;
	EntityTransaction et;

	public ItemDao(EntityManager em, EntityTransaction et) {
		this.em = em;
		this.et = et;
	}

	public Item saveItem(Item item) {
		et.begin();
		em.persist(item);
		et.commit();
		return item;
	}

	public Item updateItem(Item item) {
		et.begin();
		em.merge(item);
		et.commit();
		return item;
	}
	
	public Item removeItem(Item item) {
		et.begin();
		em.remove(item);
		et.commit();
		return item;
	}
	
	public Item findItemById(int id) {
		return em.find(Item.class, id);
	}	
}
