package com.isced.tropiko.service;

import com.isced.tropiko.dao.FrutaDAO;
import com.isced.tropiko.model.Fruta;

import java.math.BigDecimal;
import java.util.List;

public class FrutaService {

    private FrutaDAO frutaDAO;

    public FrutaService(FrutaDAO frutaDAO) {
        this.frutaDAO = frutaDAO;
    }

    public void adicionarFruta(String nome, String descricao, BigDecimal preco, Integer estoque, String categoria, String imagemUrl) {
        Fruta fruta = new Fruta(nome, descricao, preco, estoque, categoria, imagemUrl);
        frutaDAO.salvar(fruta);
    }

    public Fruta buscarFrutaPorId(Integer id) {
        return frutaDAO.buscarPorId(id);
    }

    public List<Fruta> listarFrutas() {
        return frutaDAO.listarTodos();
    }

    public List<Fruta> listarFrutasPorCategoria(String categoria, int pagina, int itensPorPagina) {
        int offset = (pagina - 1) * itensPorPagina;
        return frutaDAO.listarPorCategoriaComPaginacao(categoria, offset, itensPorPagina);
    }

    public int contarFrutasPorCategoria(String categoria) {
        return frutaDAO.contarPorCategoria(categoria);
    }

    public List<Fruta> listarFrutasPorNome(String nome, int pagina, int itensPorPagina) {
        int offset = (pagina - 1) * itensPorPagina;
        return frutaDAO.listarPorNomeComPaginacao(nome, offset, itensPorPagina);
    }
    
    public int contarFrutasPorNome(String nome) {
        return frutaDAO.contarPorNome(nome);
    }

    public void atualizarFruta(Fruta fruta) {
        frutaDAO.atualizar(fruta);
    }

    public void removerFruta(Integer id) {
        frutaDAO.deletar(id);
    }
}