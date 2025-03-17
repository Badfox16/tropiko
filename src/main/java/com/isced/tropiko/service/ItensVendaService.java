package com.isced.tropiko.service;

import com.isced.tropiko.dao.ItensVendaDAO;
import com.isced.tropiko.model.ItensVenda;
import com.isced.tropiko.model.Venda;
import com.isced.tropiko.model.Fruta;

import java.math.BigDecimal;
import java.util.List;

public class ItensVendaService {

    private ItensVendaDAO itensVendaDAO;

    public ItensVendaService(ItensVendaDAO itensVendaDAO) {
        this.itensVendaDAO = itensVendaDAO;
    }

    public void adicionarItemVenda(Venda venda, Fruta fruta, Integer quantidade, BigDecimal precoUnitario) {
        BigDecimal subtotal = precoUnitario.multiply(new BigDecimal(quantidade));
        ItensVenda itensVenda = new ItensVenda(null, venda, fruta, quantidade, precoUnitario, subtotal);
        itensVendaDAO.salvar(itensVenda);
    }

    public ItensVenda buscarItemVendaPorId(Integer id) {
        return itensVendaDAO.buscarPorId(id);
    }

    public List<ItensVenda> listarItensVenda() {
        return itensVendaDAO.listarTodos();
    }

    public List<ItensVenda> listarItensPorVendaId(Integer vendaId) {
        return itensVendaDAO.listarPorVendaId(vendaId);
    }

    public void atualizarItemVenda(ItensVenda itensVenda) {
        itensVendaDAO.atualizar(itensVenda);
    }

    public void removerItemVenda(Integer id) {
        itensVendaDAO.deletar(id);
    }
}