package com.isced.tropiko;

import com.isced.tropiko.model.Usuario;
import com.isced.tropiko.service.UsuarioService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "UsuarioController", urlPatterns = {"/usuario"})
public class UsuarioController extends HttpServlet {

    private UsuarioService usuarioService = new UsuarioService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("🚀 Servlet UsuarioController chamado!");
        String action = request.getParameter("action");

        try {
            if ("listar".equals(action)) {
                List<Usuario> usuarios = usuarioService.listarUsuarios();
                System.out.println("Usuários carregados pelo Servlet: " + usuarios);
                request.setAttribute("usuarios", usuarios);
                request.getRequestDispatcher("index.jsp").forward(request, response);
            } else if ("buscar".equals(action)) {
                Integer id = Integer.parseInt(request.getParameter("id"));
                Usuario usuario = usuarioService.buscarUsuarioPorId(id);
                request.setAttribute("usuario", usuario);
                request.getRequestDispatcher("/usuario/detalhes.jsp").forward(request, response);
            } else {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Ação inválida.");
            }
        } catch (Exception e) {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Erro ao processar a solicitação.");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        try {
            if ("registrar".equals(action)) {
                String email = request.getParameter("email");
                String senha = request.getParameter("senha");
                String nome = request.getParameter("nome");
                usuarioService.registrarUsuario(email, senha, nome);
                response.sendRedirect("usuario?action=listar");
            } else if ("atualizar".equals(action)) {
                Integer id = Integer.parseInt(request.getParameter("id"));
                String email = request.getParameter("email");
                String senha = request.getParameter("senha");
                String nome = request.getParameter("nome");
                Usuario usuario = new Usuario(email, senha, nome);
                usuario.setId(id);
                usuarioService.atualizarUsuario(usuario);
                response.sendRedirect("usuario?action=listar");
            } else if ("deletar".equals(action)) {
                Integer id = Integer.parseInt(request.getParameter("id"));
                usuarioService.removerUsuario(id);
                response.sendRedirect("usuario?action=listar");
            } else if ("login".equals(action)) {
                String email = request.getParameter("email");
                String senha = request.getParameter("senha");
                Usuario usuario = usuarioService.loginUsuario(email, senha);
                if (usuario != null) {
                    request.getSession().setAttribute("usuarioLogado", usuario);
                    response.sendRedirect("home.jsp");
                } else {
                    request.setAttribute("erro", "Credenciais inválidas.");
                    request.getRequestDispatcher("/login.jsp").forward(request, response);
                }
            } else {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Ação inválida.");
            }
        } catch (Exception e) {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Erro ao processar a solicitação.");
        }
    }
}
