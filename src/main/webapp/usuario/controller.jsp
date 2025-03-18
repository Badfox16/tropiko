<%@ page import="com.isced.tropiko.service.UsuarioService" %>
<%@ page import="com.isced.tropiko.model.Usuario" %>

<%
    String action = request.getParameter("action");
    UsuarioService usuarioService = new UsuarioService();

    if ("registrar".equals(action)) {
        String nome = request.getParameter("nome");
        String email = request.getParameter("email");
        String senha = request.getParameter("senha");

        usuarioService.registrarUsuario(email, senha, nome);
        response.sendRedirect("index.jsp"); // Redireciona de volta para a página principal
    } else if ("deletar".equals(action)) {
        String id = request.getParameter("id");

        if (id != null) {
            usuarioService.removerUsuario(Integer.parseInt(id));
        }
        response.sendRedirect("index.jsp"); // Redireciona de volta para a página principal
    }
%>