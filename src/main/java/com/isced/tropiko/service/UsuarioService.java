package com.isced.tropiko.service;

import com.isced.tropiko.dao.UsuarioDAO;
import com.isced.tropiko.model.Usuario;

import java.util.List;

public class UsuarioService {

    private UsuarioDAO usuarioDAO = new UsuarioDAO();

    public void registrarUsuario(String email, String senha, String nome) {
        Usuario usuario = new Usuario(email, senha, nome);
        usuarioDAO.salvar(usuario);
    }

    public Usuario buscarUsuarioPorId(Integer id) {
        return usuarioDAO.buscarPorId(id);
    }

    public List<Usuario> listarUsuarios() {
        return usuarioDAO.listarTodos();
    }

    public void atualizarUsuario(Usuario usuario) {
        usuarioDAO.atualizar(usuario);
    }

    public void removerUsuario(Integer id) {
        usuarioDAO.deletar(id);
    }
}
