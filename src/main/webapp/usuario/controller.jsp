<%@ page import="com.isced.tropiko.service.UsuarioService" %>
<%@ page import="com.isced.tropiko.model.Usuario" %>

<%
    String action = request.getParameter("action");
    UsuarioService usuarioService = new UsuarioService();

    if ("registrar".equals(action)) {
        // Lógica de registro
        String nome = request.getParameter("nome");
        String email = request.getParameter("email");
        String senha = request.getParameter("senha");

        usuarioService.registrarUsuario(email, senha, nome);
        response.sendRedirect("index.jsp"); // Redireciona para a página de login
    } else if ("deletar".equals(action)) {
        // Lógica de exclusão
        String id = request.getParameter("id");

        if (id != null) {
            usuarioService.removerUsuario(Integer.parseInt(id));
        }
        response.sendRedirect("index.jsp"); // Redireciona para a página principal
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
                response.sendRedirect("./index.jsp");
            } else if ("CLIENTE".equals(usuario.getTipo())) {
                response.sendRedirect("../cliente/home.jsp");
            } else {
                request.setAttribute("erro", "Tipo de usuário inválido.");
                request.getRequestDispatcher("../index.jsp").forward(request, response);
            }
        } else {
            // Credenciais inválidas
            request.setAttribute("erro", "Credenciais inválidas.");
            request.getRequestDispatcher("../index.jsp").forward(request, response);
        }
    } else {
        // Ação inválida
        response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Ação inválida.");
    }
%>