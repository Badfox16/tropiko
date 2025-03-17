package com.isced.tropiko.dao;

import com.isced.tropiko.model.Carrinho;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;

import java.util.List;

public class CarrinhoDAO {

    private EntityManager entityManager;

    public CarrinhoDAO(EntityManager entityManager) {
        this.entityManager = entityManager;
    }

    public void salvar(Carrinho carrinho) {
        EntityTransaction transaction = entityManager.getTransaction();
        try {
            transaction.begin();
            entityManager.persist(carrinho);
            transaction.commit();
        } catch (Exception e) {
            if (transaction.isActive()) {
                transaction.rollback();
            }
            throw e;
        }
    }

    public Carrinho buscarPorId(Integer id) {
        return entityManager.find(Carrinho.class, id);
    }

    public List<Carrinho> listarTodos() {
        return entityManager.createQuery("SELECT c FROM Carrinho c", Carrinho.class).getResultList();
    }

    public List<Carrinho> listarPorUsuario(Integer usuarioId) {
        return entityManager.createQuery(
                        "SELECT c FROM Carrinho c WHERE c.usuario.id = :usuarioId", Carrinho.class)
                .setParameter("usuarioId", usuarioId)
                .getResultList();
    }

    public void atualizar(Carrinho carrinho) {
        EntityTransaction transaction = entityManager.getTransaction();
        try {
            transaction.begin();
            entityManager.merge(carrinho);
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
            Carrinho carrinho = entityManager.find(Carrinho.class, id);
            if (carrinho != null) {
                entityManager.remove(carrinho);
            }
            transaction.commit();
        } catch (Exception e) {
            if (transaction.isActive()) {
                transaction.rollback();
            }
            throw e;
        }
    }

    public void limparCarrinhoPorUsuario(Integer usuarioId) {
        EntityTransaction transaction = entityManager.getTransaction();
        try {
            transaction.begin();
            entityManager.createQuery("DELETE FROM Carrinho c WHERE c.usuario.id = :usuarioId")
                    .setParameter("usuarioId", usuarioId)
                    .executeUpdate();
            transaction.commit();
        } catch (Exception e) {
            if (transaction.isActive()) {
                transaction.rollback();
            }
            throw e;
        }
    }
}
