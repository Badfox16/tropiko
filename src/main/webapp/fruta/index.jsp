<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.isced.tropiko.service.FrutaService" %>
<%@ page import="com.isced.tropiko.model.Fruta" %>

<%
    FrutaService frutaService = new FrutaService(new com.isced.tropiko.dao.FrutaDAO());
    List<Fruta> frutas = frutaService.listarFrutas();
%>

<!DOCTYPE html>
<html>
<%@ include file="../includes/head.jsp" %>

<body>
    <section class="d-flex">
        <%@ include file="../includes/sidebar.jsp" %>
        <div class="card-body" style="width: calc(100% - 300px); margin-left: 300px; overflow-y: scroll;">
            <h2 class="pd-2 m-5" style="color: #fc5d35;"><b>Gestão de Frutas</b></h2>
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
                            <th>Descrição</th>
                            <th>Preço</th>
                            <th>Estoque</th>
                            <th>Categoria</th>
                            <th>Ações</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% if (frutas == null || frutas.isEmpty()) { %>
                            <tr>
                                <td colspan="8">Nenhuma fruta encontrada.</td>
                            </tr>
                        <% } else { %>
                            <% for (Fruta fruta : frutas) { %>
                                <tr>
                                    <td><%= fruta.getId() %></td>
                                    <td><%= fruta.getNome() %></td>
                                    <td style="white-space: normal; word-wrap: break-word;"><%= fruta.getDescricao() %></td>
                                    <td><%= fruta.getPreco() %></td>
                                    <td><%= fruta.getEstoque() %></td>
                                    <td><%= fruta.getCategoria() %></td>
                                    <td>
                                        <a href="edit.jsp?id=<%= fruta.getId() %>">
                                            <span style="font-size: 1.5rem; color:#fc5d35;" aria-hidden="true">
                                                <i class="fa fa-edit"></i>
                                            </span>
                                        </a>
                                        <a href="controller.jsp?action=deletar&id=<%= fruta.getId() %>" class="deleteButton">
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

            <!-- Modal de Cadastro de Fruta -->
            <div class="modal fade" id="myModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Cadastro de Fruta</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <form method="post" action="controller.jsp?action=registrar">
                                <div class="form-group">
                                    <label for="Nome">Nome:</label>
                                    <input type="text" class="form-control" id="Nome" name="nome" required>
                                </div>
                                <div class="form-group">
                                    <label for="Descricao">Descrição:</label>
                                    <textarea class="form-control" id="Descricao" name="descricao" required></textarea>
                                </div>
                                <div class="form-group">
                                    <label for="Preco">Preço:</label>
                                    <input type="number" step="0.01" class="form-control" id="Preco" name="preco" required>
                                </div>
                                <div class="form-group">
                                    <label for="Estoque">Estoque:</label>
                                    <input type="number" class="form-control" id="Estoque" name="estoque" required>
                                </div>
                                <div class="form-group">
                                    <label for="Categoria">Categoria:</label>
                                    <input type="text" class="form-control" id="Categoria" name="categoria" required>
                                </div>
                                <div class="form-group">
                                    <label for="ImagemUrl">URL da Imagem:</label>
                                    <input type="text" class="form-control" id="ImagemUrl" name="imagemUrl">
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