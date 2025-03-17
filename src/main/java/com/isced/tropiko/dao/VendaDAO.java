package com.isced.tropiko.dao;

import com.isced.tropiko.model.Venda;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

import java.util.List;

public class VendaDAO {

    private EntityManagerFactory emf = Persistence.createEntityManagerFactory("tropikoPU");

    public void salvar(Venda venda) {
        EntityManager em = emf.createEntityManager();
        try {
            em.getTransaction().begin();
            em.persist(venda);
            em.getTransaction().commit();
        } finally {
            em.close();
        }
    }

    public Venda buscarPorId(Integer id) {
        EntityManager em = emf.createEntityManager();
        try {
            return em.find(Venda.class, id);
        } finally {
            em.close();
        }
    }

    public List<Venda> listarTodos() {
        EntityManager em = emf.createEntityManager();
        try {
            return em.createQuery("SELECT v FROM Venda v", Venda.class).getResultList();
        } finally {
            em.close();
        }
    }

    public List<Venda> listarPorUsuarioId(Integer usuarioId) {
        EntityManager em = emf.createEntityManager();
        try {
            return em.createQuery(
                            "SELECT v FROM Venda v WHERE v.usuario.id = :usuarioId", Venda.class)
                    .setParameter("usuarioId", usuarioId)
                    .getResultList();
        } finally {
            em.close();
        }
    }

    public void atualizar(Venda venda) {
        EntityManager em = emf.createEntityManager();
        try {
            em.getTransaction().begin();
            em.merge(venda);
            em.getTransaction().commit();
        } finally {
            em.close();
        }
    }

    public void deletar(Integer id) {
        EntityManager em = emf.createEntityManager();
        try {
            Venda venda = em.find(Venda.class, id);
            if (venda != null) {
                em.getTransaction().begin();
                em.remove(venda);
                em.getTransaction().commit();
            }
        } finally {
            em.close();
        }
    }
}