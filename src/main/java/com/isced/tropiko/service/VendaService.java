package com.isced.tropiko.service;

import com.isced.tropiko.dao.VendaDAO;
import com.isced.tropiko.model.Usuario;
import com.isced.tropiko.model.Venda;

import java.math.BigDecimal;
import java.time.Instant;
import java.util.List;

public class VendaService {

    private VendaDAO vendaDAO;

    public VendaService(VendaDAO vendaDAO) {
        this.vendaDAO = vendaDAO;
    }

    public void registrarVenda(Usuario usuario, BigDecimal total, String status) {
        Venda venda = new Venda(null, usuario, Instant.now(), total, status);
        vendaDAO.salvar(venda);
    }

    public void salvarVenda(Venda venda) {
        vendaDAO.salvar(venda);
    }

    public Venda buscarVendaPorId(Integer id) {
        return vendaDAO.buscarPorId(id);
    }

    public List<Venda> listarVendas() {
        return vendaDAO.listarTodos();
    }

    public List<Venda> listarVendasPorUsuarioId(Integer usuarioId) {
        return vendaDAO.listarPorUsuarioId(usuarioId);
    }

    public void atualizarVenda(Venda venda) {
        vendaDAO.atualizar(venda);
    }

    public void removerVenda(Integer id) {
        vendaDAO.deletar(id);
    }
}