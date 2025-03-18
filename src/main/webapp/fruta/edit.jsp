<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.isced.tropiko.service.FrutaService" %>
<%@ page import="com.isced.tropiko.model.Fruta" %>
<%@ page import="java.io.IOException" %>
<%@ page import="java.math.BigDecimal" %>

<%
    // Obtém o ID da fruta da URL
    String idFruta = request.getParameter("id");
    Fruta fruta = null;
    FrutaService frutaService = new FrutaService(new com.isced.tropiko.dao.FrutaDAO());

    if (idFruta != null) {
        try {
            Integer id = Integer.parseInt(idFruta);
            fruta = frutaService.buscarFrutaPorId(id); // Carrega os dados da fruta
        } catch (NumberFormatException e) {
            out.println("<p>Erro: ID da Fruta inválido.</p>");
        }
    }

    // Atualiza os dados da fruta
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        if (fruta != null) {
            fruta.setNome(request.getParameter("nome"));
            fruta.setDescricao(request.getParameter("descricao"));
            fruta.setPreco(BigDecimal.valueOf(Long.parseLong(request.getParameter("preco"))));
            fruta.setEstoque(Integer.parseInt(request.getParameter("estoque")));
            fruta.setCategoria(request.getParameter("categoria"));
            fruta.setImagemUrl(request.getParameter("imagemUrl"));

            frutaService.atualizarFruta(fruta);

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
                <h2 class="pd-2 m-5" style="color: #fc5d35;"><b>Editar Fruta</b></h2>

                <!-- Formulário de edição -->
                <div class="m-5">
                    <form method="post" action="edit.jsp?id=<%= idFruta %>">
                        <div class="form-group">
                            <label for="nome">Nome:</label>
                            <input type="text" class="form-control" id="nome" name="nome" value="<%= fruta != null ? fruta.getNome() : "" %>" required>
                        </div>
                        <div class="form-group">
                            <label for="descricao">Descrição:</label>
                            <textarea class="form-control" id="descricao" name="descricao" required><%= fruta != null ? fruta.getDescricao() : "" %></textarea>
                        </div>
                        <div class="form-group">
                            <label for="preco">Preço:</label>
                            <input type="number" step="0.01" class="form-control" id="preco" name="preco" value="<%= fruta != null ? fruta.getPreco() : "" %>" required>
                        </div>
                        <div class="form-group">
                            <label for="estoque">Estoque:</label>
                            <input type="number" class="form-control" id="estoque" name="estoque" value="<%= fruta != null ? fruta.getEstoque() : "" %>" required>
                        </div>
                        <div class="form-group">
                            <label for="categoria">Categoria:</label>
                            <input type="text" class="form-control" id="categoria" name="categoria" value="<%= fruta != null ? fruta.getCategoria() : "" %>" required>
                        </div>
                        <div class="form-group">
                            <label for="imagemUrl">URL da Imagem:</label>
                            <input type="text" class="form-control" id="imagemUrl" name="imagemUrl" value="<%= fruta != null ? fruta.getImagemUrl() : "" %>">
                        </div>
                        <br>
                        <div class="form-group text-center">
                            <button type="submit" class="btn btn-primary" style="background-color:#fc5d35; border:none;">
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