<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.isced.service.UsuarioService" %>
<%@ page import="com.isced.model.Usuario" %>
<%@ page import="java.io.IOException" %>

<%
    // Obtém o ID do usuário da URL
    String idUsuario = request.getParameter("idUsuario");
    Usuario usuario = null;
    UsuarioService usuarioService = new UsuarioService();

    if (idUsuario != null) {
        try {
            Long id = Long.parseLong(idUsuario);
            usuario = usuarioService.buscarUsuarioPorId(id);  // Carrega os dados do usuário
        } catch (NumberFormatException e) {
            out.println("<p>Erro: ID do Usuário inválido.</p>");
        }
    }

    // Atualiza os dados do usuário
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        if (usuario != null) {
            usuario.setNome(request.getParameter("Nome"));
            usuario.setEmail(request.getParameter("Email"));
            usuario.setSenha(request.getParameter("Senha"));
            usuario.setTipo(request.getParameter("Tipo"));

            usuarioService.atualizarUsuario(usuario);

            response.sendRedirect("index.jsp");
            return;
        }
    }
%>

<!DOCTYPE html>
<html>
    <%@ include file="../includes/head.jsp" %>
    <body>
        <section class="d-flex">
            <%@ include file="../includes/sidebar.jsp" %>
            <div class="card-body" style="width: calc(100% - 300px); margin-left: 300px; overflow-y: scroll;">
                <h2 class="pd-2 m-5" style="color: #1a0985;"><b>Editar Usuário</b></h2>

                <!-- Formulário de edição -->
                <div class="m-5">
                    <form method="post" action="edit.jsp?idUsuario=<%= idUsuario %>">
                        <div class="form-group">
                            <label for="Nome">Nome:</label>
                            <input type="text" class="form-control" id="Nome" name="Nome" value="<%= usuario != null ? usuario.getNome() : "" %>" required>
                        </div>
                        <div class="form-group">
                            <label for="Email">Email:</label>
                            <input type="email" class="form-control" id="Email" name="Email" value="<%= usuario != null ? usuario.getEmail() : "" %>" required>
                        </div>
                        <div class="form-group">
                            <label for="Senha">Senha:</label>
                            <input type="password" class="form-control" id="Senha" name="Senha" placeholder="Deixe em branco para manter a senha atual">
                        </div>
                        <div class="form-group">
                            <label for="Tipo">Tipo de Usuário:</label>
                            <select class="form-control" id="Tipo" name="Tipo" required>
                                <option value="CLIENTE" <%= usuario != null && "CLIENTE".equals(usuario.getTipo()) ? "selected" : "" %>>Cliente</option>
                                <option value="ADMIN" <%= usuario != null && "ADMIN".equals(usuario.getTipo()) ? "selected" : "" %>>Admin</option>
                            </select>
                        </div>
                        <br>
                        <div class="form-group text-center">
                            <button type="submit" class="btn btn-primary" style="background-color:#1a0985; border:none;">
                                <i class="fa fa-save"></i> Salvar
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </section>

        <!-- Scripts -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>