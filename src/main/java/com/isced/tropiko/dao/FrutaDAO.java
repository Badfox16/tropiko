package com.isced.tropiko.dao;

import com.isced.tropiko.model.Fruta;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

import java.util.List;

public class FrutaDAO {

    private EntityManagerFactory emf = Persistence.createEntityManagerFactory("tropikoPU");

    public void salvar(Fruta fruta) {
        EntityManager em = emf.createEntityManager();
        try {
            em.getTransaction().begin();
            em.persist(fruta);
            em.getTransaction().commit();
        } finally {
            em.close();
        }
    }

    public Fruta buscarPorId(Integer id) {
        EntityManager em = emf.createEntityManager();
        try {
            return em.find(Fruta.class, id);
        } finally {
            em.close();
        }
    }

    public List<Fruta> listarTodos() {
        EntityManager em = emf.createEntityManager();
        try {
            return em.createQuery("SELECT f FROM Fruta f", Fruta.class).getResultList();
        } finally {
            em.close();
        }
    }

    public List<Fruta> listarPorCategoria(String categoria) {
        EntityManager em = emf.createEntityManager();
        try {
            return em.createQuery("SELECT f FROM Fruta f WHERE f.categoria = :categoria", Fruta.class)
                    .setParameter("categoria", categoria)
                    .getResultList();
        } finally {
            em.close();
        }
    }

    public void atualizar(Fruta fruta) {
        EntityManager em = emf.createEntityManager();
        try {
            em.getTransaction().begin();
            em.merge(fruta);
            em.getTransaction().commit();
        } finally {
            em.close();
        }
    }

    public void deletar(Integer id) {
        EntityManager em = emf.createEntityManager();
        try {
            Fruta fruta = em.find(Fruta.class, id);
            if (fruta != null) {
                em.getTransaction().begin();
                em.remove(fruta);
                em.getTransaction().commit();
            }
        } finally {
            em.close();
        }
    }
}