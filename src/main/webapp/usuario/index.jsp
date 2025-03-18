<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.isced.tropiko.service.UsuarioService" %>
<%@ page import="com.isced.tropiko.model.Usuario" %>

<%
    UsuarioService usuarioService = new UsuarioService();
    List<Usuario> usuarios = usuarioService.listarUsuarios();
%>

<!DOCTYPE html>
<html>
<%@ include file="../includes/head.jsp" %>

<body>
    <section class="d-flex">
        <%@ include file="../includes/sidebar.jsp" %>
        <div class="card-body" style="width: calc(100% - 300px); margin-left: 300px; overflow-y: scroll;">
            <h2 class="pd-2 m-5" style="color: #fc5d35;"><b>Gestão de Usuários</b></h2>
            <div class="d-flex">
                <div class="m-5">
                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#myModal"
                        style="background-color:#fc5d35; border:none;">
                        <i class="fa fa-plus-square" aria-hidden="true"></i> Cadastrar
                    </button>
                </div>
            </div>

            <!-- TABELA -->
            <div class="">
                <table class="table table-responsive-lg table-hover table-borderless mb-0">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Nome</th>
                            <th>Email</th>
                            <th>Data de Criação</th>
                            <th>Ações</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% if (usuarios == null || usuarios.isEmpty()) { %>
                            <tr>
                                <td colspan="5">Nenhum usuário encontrado.</td>
                            </tr>
                        <% } else { %>
                            <% for (Usuario usuario : usuarios) { %>
                                <tr>
                                    <td><%= usuario.getId() %></td>
                                    <td><%= usuario.getNome() %></td>
                                    <td><%= usuario.getEmail() %></td>
                                    <td><%= usuario.getDataCriacao() %></td>
                                    <td>
                                        <a href="edit.jsp?id=<%= usuario.getId() %>">
                                            <span style="font-size: 1.5rem; color:#fc5d35;" aria-hidden="true">
                                                <i class="fa fa-user-pen"></i>
                                            </span>
                                        </a>
                                        <a href="controller.jsp?action=deletar&id=<%= usuario.getId() %>" class="deleteButton">
                                            <span style="font-size: 1.5rem; color:#fc5d35; padding-left: 16px;" aria-hidden="true">
                                                <i class="fa fa-trash"></i>
                                            </span>
                                        </a>
                                    </td>
                                </tr>
                            <% } %>
                        <% } %>
                    </tbody>
                </table>
            </div>

            <!-- Modal de Cadastro de Usuário -->
            <div class="modal fade" id="myModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Cadastro de Usuário</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <form method="post" action="controller.jsp?action=registrar">
                                <div class="form-group">
                                    <label for="Nome">Nome:</label>
                                    <input type="text" class="form-control" id="Nome" name="nome" required>
                                </div>
                                <div class="form-group">
                                    <label for="Email">Email:</label>
                                    <input type="email" class="form-control" id="Email" name="email" required>
                                </div>
                                <div class="form-group">
                                    <label for="Senha">Senha:</label>
                                    <input type="password" class="form-control" id="Senha" name="senha" required>
                                </div>
                                <br>
                                <div class="text-center">
                                    <button type="submit" class="btn btn-primary" style="background-color:#fc5d35; border:none;">
                                        <i class="fa fa-plus-square" aria-hidden="true"></i>
                                        Cadastrar
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Scripts -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>