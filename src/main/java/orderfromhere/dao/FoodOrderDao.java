package orderfromhere.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;

import orderfromhere.dto.FoodOrder;

public class FoodOrderDao {

	EntityManager em;
	EntityTransaction et;

	public FoodOrderDao(EntityManager em, EntityTransaction et) {
		this.em = em;
		this.et = et;
	}

	public FoodOrder saveFoodOrder(FoodOrder foodOrder) {
		et.begin();
		em.persist(foodOrder);
		et.commit();
		return foodOrder;
	}

	public FoodOrder updateFoodOrder(FoodOrder foodOrder) {
		et.begin();
		em.merge(foodOrder);
		et.commit();
		return foodOrder;
	}

	public FoodOrder removeFoodOrder(FoodOrder foodOrder) {
		et.begin();
		em.remove(foodOrder);
		et.commit();
		return foodOrder;
	}

	public FoodOrder findFoodOrderById(int id) {
		return em.find(FoodOrder.class, id);
	}
	
	public List<FoodOrder> findAllOrders() {
		return em.createQuery("from FoodOrder").getResultList();
	}
}