package com.isced.tropiko.dao;

import java.util.List;

public interface GenericDAO<T> {
    void salvar(T entidade);
    void atualizar(T entidade);
    void deletar(Integer id);
    T buscarPorId(Integer id);
    List<T> listarTodos();
}