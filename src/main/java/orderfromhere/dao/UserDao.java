package orderfromhere.dao;

import java.sql.Savepoint;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.NoResultException;
import javax.persistence.Query;

import orderfromhere.dto.User;

public class UserDao {

	EntityManager em;
	EntityTransaction et;

	public UserDao(EntityManager em, EntityTransaction et) {
		this.em = em;
		this.et = et;
	}

	public User saveUser(User user) {
		
		user.setId(getNewId());
		
		et.begin();
		em.persist(user);
		et.commit();

		return user;
	}

	public User updateUser(User user) {
		et.begin();
		em.merge(user);
		et.commit();
		return user;
	}

	public User removeUser(User user) {
		et.begin();
		em.remove(user);
		et.commit();
		return user;
	}

	public User findUserById(int id) {
		Query query = em.createQuery("select u from User u where u.id=:id");
		query.setParameter("id", id);
		try {
			return (User) query.getSingleResult();
		} catch (NoResultException e) {
			return null;
		}
	}

	@SuppressWarnings("unchecked")
	public List<User> getAllUsersByRole(String role) {
		Query query = em.createQuery("select u from User u where u.role=:role");
		query.setParameter("role", role);
		return query.getResultList();
	}

	public User findUserByPhone(long phone) {
		Query query = em.createQuery("select u from User u where u.phone=:phone");
		query.setParameter("phone", phone);
		try {
			return (User) query.getSingleResult();
		} catch (NoResultException e) {
			return null;
		}
	}
	
	private int getNewId() {
		while(true) {
			int id = (int) (Math.random()*100)+1;
			if(findUserById(id)==null) {
				return id;
			}
		}
	}

	public void removeUserById(int id) {
		User user = findUserById(id);		
		et.begin();
		em.remove(user);
		et.commit();
	}
	
}