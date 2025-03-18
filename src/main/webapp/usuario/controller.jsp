<%@ page import="com.isced.tropiko.service.UsuarioService" %>
<%@ page import="com.isced.tropiko.model.Usuario" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String action = request.getParameter("action");
    UsuarioService usuarioService = new UsuarioService();

    if ("registrar".equals(action)) {
        // Lógica de registro
        String nome = request.getParameter("nome");
        String email = request.getParameter("email");
        String senha = request.getParameter("senha");

        usuarioService.registrarUsuario(email, senha, nome);
        response.sendRedirect(request.getContextPath() + "/index.jsp"); // Redireciona para a página de login
    } else if ("deletar".equals(action)) {
        // Lógica de exclusão
        String id = request.getParameter("id");

        if (id != null) {
            usuarioService.removerUsuario(Integer.parseInt(id));
        }
        response.sendRedirect(request.getContextPath() + "/usuario/"); // Redireciona para a página principal
    } else if ("login".equals(action)) {
        // Lógica de login
        String email = request.getParameter("email");
        String senha = request.getParameter("senha");

        Usuario usuario = usuarioService.loginUsuario(email, senha);
        if (usuario != null) {
            // Cria a sessão e armazena o usuário logado
            session.setAttribute("usuarioLogado", usuario);

            // Verifica o tipo de usuário e redireciona
            if ("ADMIN".equals(usuario.getTipo())) {
                response.sendRedirect(request.getContextPath() + "/usuario/");
            } else if ("CLIENTE".equals(usuario.getTipo())) {
                response.sendRedirect(request.getContextPath() + "/home.jsp");
            } else {
                request.setAttribute("erro", "Tipo de usuário inválido.");
                response.sendRedirect(request.getContextPath() + "/index.jsp");
            }
        } else {
            // Credenciais inválidas
            session.setAttribute("erro", "Credenciais inválidas.");
            response.sendRedirect(request.getContextPath() + "/index.jsp");
        }
    } else if ("logout".equals(action)) {
        // Lógica de logout
        session.invalidate();
        response.sendRedirect(request.getContextPath() + "/index.jsp");
    } else {
        // Ação inválida
        response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Ação inválida.");
    }
%>