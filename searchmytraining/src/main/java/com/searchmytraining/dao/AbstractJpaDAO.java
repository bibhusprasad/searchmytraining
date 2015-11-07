package com.searchmytraining.dao;

import java.io.Serializable;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

public abstract class AbstractJpaDAO<T extends Serializable> {

	private Class<T> clazz;

	@PersistenceContext
	private EntityManager entityManager;

	public final void setClazz(Class<T> clazzToSet) {
		this.clazz = clazzToSet;
	}

	public T findOne(long id) {
		return entityManager.find(clazz, id);
	}

	public T findOne(Integer id) {
		return entityManager.find(clazz, id);
	}

	@SuppressWarnings("unchecked")
	public List<T> findAll() {
		return entityManager.createQuery("from " + clazz.getName())
				.getResultList();
	}

	public void create(T entity) {
		entityManager.persist(entity);
		entityManager.flush();
	}

	public void create1(T entity) {
		entityManager.persist(entity);
	}

	public T update(T entity) {
		return entityManager.merge(entity);
	}

	public void delete(T entity) {
		entityManager.remove(entity);
	}

	public void deleteById(long entityId) {
		T entity = findOne(entityId);
		if (null != entity) {
			delete(entity);
		}
	}

	public Long getMaxId(String classname, String idcolumn) {

		String query = "select max(e." + idcolumn + ") from " + classname
				+ " e";
		Query q = entityManager.createQuery(query);
		Long maxid = (Long) q.getSingleResult();
		return maxid;
	}

	public Object getQueryResult(String query1) {
		Query query = entityManager.createQuery(query1);
		return query.getSingleResult();
	}

}
