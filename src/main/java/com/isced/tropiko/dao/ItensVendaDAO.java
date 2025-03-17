package com.isced.tropiko.dao;

import com.isced.tropiko.model.ItensVenda;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

import java.util.List;

public class ItensVendaDAO {

    private EntityManagerFactory emf = Persistence.createEntityManagerFactory("tropikoPU");

    public void salvar(ItensVenda itensVenda) {
        EntityManager em = emf.createEntityManager();
        try {
            em.getTransaction().begin();
            em.persist(itensVenda);
            em.getTransaction().commit();
        } finally {
            em.close();
        }
    }

    public ItensVenda buscarPorId(Integer id) {
        EntityManager em = emf.createEntityManager();
        try {
            return em.find(ItensVenda.class, id);
        } finally {
            em.close();
        }
    }

    public List<ItensVenda> listarTodos() {
        EntityManager em = emf.createEntityManager();
        try {
            return em.createQuery("SELECT iv FROM ItensVenda iv", ItensVenda.class).getResultList();
        } finally {
            em.close();
        }
    }

    public List<ItensVenda> listarPorVendaId(Integer vendaId) {
        EntityManager em = emf.createEntityManager();
        try {
            return em.createQuery(
                            "SELECT iv FROM ItensVenda iv WHERE iv.venda.id = :vendaId", ItensVenda.class)
                    .setParameter("vendaId", vendaId)
                    .getResultList();
        } finally {
            em.close();
        }
    }

    public void atualizar(ItensVenda itensVenda) {
        EntityManager em = emf.createEntityManager();
        try {
            em.getTransaction().begin();
            em.merge(itensVenda);
            em.getTransaction().commit();
        } finally {
            em.close();
        }
    }

    public void deletar(Integer id) {
        EntityManager em = emf.createEntityManager();
        try {
            ItensVenda itensVenda = em.find(ItensVenda.class, id);
            if (itensVenda != null) {
                em.getTransaction().begin();
                em.remove(itensVenda);
                em.getTransaction().commit();
            }
        } finally {
            em.close();
        }
    }
}