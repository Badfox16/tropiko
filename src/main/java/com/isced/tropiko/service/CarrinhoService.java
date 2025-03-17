package com.isced.tropiko.service;


import com.isced.tropiko.model.Carrinho;
import com.isced.tropiko.dao.CarrinhoDAO;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

import java.util.List;

public class CarrinhoService {

    private EntityManagerFactory emf = Persistence.createEntityManagerFactory("lojaPU");
    private com.isced.tropiko.dao.CarrinhoDAO carrinhoDAO;

    public CarrinhoService() {
        // Criamos um EntityManager para passar à DAO.
        EntityManager em = emf.createEntityManager();
        carrinhoDAO = new CarrinhoDAO(em);
    }

    public void adicionarAoCarrinho(Carrinho carrinho) {
        carrinhoDAO.salvar(carrinho);
    }

    public List<Carrinho> listarCarrinhoPorUsuario(Integer usuarioId) {
        return carrinhoDAO.listarPorUsuario(usuarioId);
    }

    public void atualizarCarrinho(Carrinho carrinho) {
        carrinhoDAO.atualizar(carrinho);
    }

    public void removerItemDoCarrinho(Integer carrinhoId) {
        carrinhoDAO.deletar(carrinhoId);
    }

    public void limparCarrinho(Integer usuarioId) {
        carrinhoDAO.limparCarrinhoPorUsuario(usuarioId);
    }
}
