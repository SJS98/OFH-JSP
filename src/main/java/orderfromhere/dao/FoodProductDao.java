package orderfromhere.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;

import orderfromhere.dto.FoodProduct;

public class FoodProductDao {
	EntityManager em;
	EntityTransaction et;

	public FoodProductDao(EntityManager em, EntityTransaction et) {
		this.em = em;
		this.et = et;
	}

	public FoodProduct saveFoodProduct(FoodProduct foodProduct) {
		et.begin();
		em.persist(foodProduct);
		et.commit();
		return foodProduct;
	}

	public FoodProduct updateFoodProduct(FoodProduct foodProduct) {
		et.begin();
		em.merge(foodProduct);
		et.commit();
		return foodProduct;
	}

	public FoodProduct removeFoodProduct(FoodProduct foodProduct) {
		et.begin();
		em.remove(foodProduct);
		et.commit();
		return foodProduct;
	}

	public FoodProduct findFoodProductById(int id) {
		return em.find(FoodProduct.class, id);
	}

	public FoodProduct removeFoodProductById(int id) {
		FoodProduct foodProduct = em.find(FoodProduct.class, id);
		
		if(foodProduct == null) {
			return null;
		}
		
		et.begin();
		em.remove(foodProduct);
		et.commit();
		
		return foodProduct;
	}

	public List<FoodProduct> getAll() {
		Query query = em.createQuery("select u from FoodProduct u");
		return query.getResultList();
	}
}