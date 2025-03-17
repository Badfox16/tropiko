package com.isced.tropiko.dao;

import com.isced.tropiko.model.Fruta;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;

import java.util.List;

public class FrutaDAO {

    private EntityManager entityManager;

    public FrutaDAO(EntityManager entityManager) {
        this.entityManager = entityManager;
    }

    public void salvar(Fruta fruta) {
        EntityTransaction transaction = entityManager.getTransaction();
        try {
            transaction.begin();
            entityManager.persist(fruta);
            transaction.commit();
        } catch (Exception e) {
            if (transaction.isActive()) {
                transaction.rollback();
            }
            throw e;
        }
    }

    public Fruta buscarPorId(Integer id) {
        return entityManager.find(Fruta.class, id);
    }

    public List<Fruta> listarTodos() {
        return entityManager.createQuery("SELECT f FROM Fruta f", Fruta.class).getResultList();
    }

    public List<Fruta> listarPorCategoria(String categoria) {
        return entityManager.createQuery(
                        "SELECT f FROM Fruta f WHERE f.categoria = :categoria", Fruta.class)
                .setParameter("categoria", categoria)
                .getResultList();
    }

    public void atualizar(Fruta fruta) {
        EntityTransaction transaction = entityManager.getTransaction();
        try {
            transaction.begin();
            entityManager.merge(fruta);
            transaction.commit();
        } catch (Exception e) {
            if (transaction.isActive()) {
                transaction.rollback();
            }
            throw e;
        }
    }

    public void deletar(Integer id) {
        EntityTransaction transaction = entityManager.getTransaction();
        try {
            transaction.begin();
            Fruta fruta = entityManager.find(Fruta.class, id);
            if (fruta != null) {
                entityManager.remove(fruta);
            }
            transaction.commit();
        } catch (Exception e) {
            if (transaction.isActive()) {
                transaction.rollback();
            }
            throw e;
        }
    }
}