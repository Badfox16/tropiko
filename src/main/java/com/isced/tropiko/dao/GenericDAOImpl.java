package com.isced.tropiko.dao;

import com.isced.tropiko.util.JPAUtil;
import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;

import java.lang.reflect.ParameterizedType;
import java.util.List;

public class GenericDAOImpl<T> implements GenericDAO<T> {
    private final Class<T> classe;

    @SuppressWarnings("unchecked")
    public GenericDAOImpl() {
        this.classe = (Class<T>) ((ParameterizedType) getClass().getGenericSuperclass()).getActualTypeArguments()[0];
    }

    @Override
    public void salvar(T entidade) {
        EntityManager em = JPAUtil.getEntityManager();
        try {
            em.getTransaction().begin();
            em.persist(entidade);
            em.getTransaction().commit();
        } finally {
            em.close();
        }
    }

    @Override
    public void atualizar(T entidade) {
        EntityManager em = JPAUtil.getEntityManager();
        try {
            em.getTransaction().begin();
            em.merge(entidade);
            em.getTransaction().commit();
        } finally {
            em.close();
        }
    }

    @Override
    public void deletar(Integer id) {
        EntityManager em = JPAUtil.getEntityManager();
        try {
            em.getTransaction().begin();
            T entidade = em.find(classe, id);
            if (entidade != null) {
                em.remove(entidade);
            }
            em.getTransaction().commit();
        } finally {
            em.close();
        }
    }

    @Override
    public T buscarPorId(Integer id) {
        EntityManager em = JPAUtil.getEntityManager();
        try {
            return em.find(classe, id);
        } finally {
            em.close();
        }
    }

    @Override
    public List<T> listarTodos() {
        EntityManager em = JPAUtil.getEntityManager();
        try {
            TypedQuery<T> query = em.createQuery("SELECT e FROM " + classe.getSimpleName() + " e", classe);
            return query.getResultList();
        } finally {
            em.close();
        }
    }
}