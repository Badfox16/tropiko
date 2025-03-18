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

    public List<Fruta> listarPorCategoriaComPaginacao(String categoria, int offset, int itensPorPagina) {
        EntityManager em = emf.createEntityManager();
        try {
            String query = "SELECT f FROM Fruta f";
            if (categoria != null && !categoria.isEmpty()) {
                query += " WHERE f.categoria = :categoria";
            }
            var typedQuery = em.createQuery(query, Fruta.class);
            if (categoria != null && !categoria.isEmpty()) {
                typedQuery.setParameter("categoria", categoria);
            }
            return typedQuery.setFirstResult(offset).setMaxResults(itensPorPagina).getResultList();
        } finally {
            em.close();
        }
    }

    public int contarPorCategoria(String categoria) {
        EntityManager em = emf.createEntityManager();
        try {
            String query = "SELECT COUNT(f) FROM Fruta f";
            if (categoria != null && !categoria.isEmpty()) {
                query += " WHERE f.categoria = :categoria";
            }
            var typedQuery = em.createQuery(query, Long.class);
            if (categoria != null && !categoria.isEmpty()) {
                typedQuery.setParameter("categoria", categoria);
            }
            return typedQuery.getSingleResult().intValue();
        } finally {
            em.close();
        }
    }

    public List<Fruta> listarPorNomeComPaginacao(String nome, int offset, int itensPorPagina) {
        EntityManager em = emf.createEntityManager();
        try {
            String query = "SELECT f FROM Fruta f";
            if (nome != null && !nome.isEmpty()) {
                query += " WHERE LOWER(f.nome) LIKE LOWER(:nome)";
            }
            var typedQuery = em.createQuery(query, Fruta.class);
            if (nome != null && !nome.isEmpty()) {
                typedQuery.setParameter("nome", "%" + nome + "%");
            }
            return typedQuery.setFirstResult(offset).setMaxResults(itensPorPagina).getResultList();
        } finally {
            em.close();
        }
    }
    
    public int contarPorNome(String nome) {
        EntityManager em = emf.createEntityManager();
        try {
            String query = "SELECT COUNT(f) FROM Fruta f";
            if (nome != null && !nome.isEmpty()) {
                query += " WHERE LOWER(f.nome) LIKE LOWER(:nome)";
            }
            var typedQuery = em.createQuery(query, Long.class);
            if (nome != null && !nome.isEmpty()) {
                typedQuery.setParameter("nome", "%" + nome + "%");
            }
            return typedQuery.getSingleResult().intValue();
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