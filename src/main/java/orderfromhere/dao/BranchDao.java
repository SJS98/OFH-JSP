package orderfromhere.dao;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.ManyToMany;

import orderfromhere.dto.Branch;

public class BranchDao {
	EntityManager em;
	EntityTransaction et;

	public BranchDao(EntityManager em, EntityTransaction et) {
		this.em = em;
		this.et = et;
	}

	public Branch saveBranch(Branch branch) {
		et.begin();
		em.persist(branch);
		et.commit();
		return branch;
	}

	public Branch updateBranch(Branch branch) {
		et.begin();
		em.merge(branch);
		et.commit();
		return branch;
	}

	public Branch removeBranch(Branch branch) {
		et.begin();
		em.remove(branch);
		et.commit();
		return branch;
	}

	public Branch findBranchById(int id) {
		return em.find(Branch.class, id);
	}
	
}
