<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.isced.tropiko.service.VendaService" %>
<%@ page import="com.isced.tropiko.service.ItensVendaService" %>
<%@ page import="com.isced.tropiko.model.Venda" %>
<%@ page import="com.isced.tropiko.model.ItensVenda" %>
<%@ page import="java.util.List" %>

<%
    // Obtém o ID da venda da URL
    Integer vendaId = Integer.parseInt(request.getParameter("id"));

    // Instancia os serviços necessários
    VendaService vendaService = new VendaService(new com.isced.tropiko.dao.VendaDAO());
    ItensVendaService itensVendaService = new ItensVendaService(new com.isced.tropiko.dao.ItensVendaDAO());

    // Busca os detalhes da venda e os itens associados
    Venda venda = vendaService.buscarVendaPorId(vendaId);
    List<ItensVenda> itensVenda = itensVendaService.listarItensPorVendaId(vendaId);
%>

<!DOCTYPE html>
<html>
<%@ include file="../includes/head.jsp" %>
<body>
    <section class="d-flex">
        <%@ include file="../includes/sidebar.jsp" %>
        <div class="card-body" style="width: calc(100% - 300px); margin-left: 300px; overflow-y: scroll;">
            <h2 class="pd-2 m-5" style="color: #fc5d35;"><b>Detalhes da Venda</b></h2>

            <!-- Informações da Venda -->
            <div class="m-5">
                <h4>Informações da Venda</h4>
                <p><strong>ID da Venda:</strong> <%= venda.getId() %></p>
                <p><strong>Usuário:</strong> <%= venda.getUsuario().getNome() %></p>
                <p><strong>Data:</strong> <%= venda.getDataVenda() %></p>
                <p><strong>Total:</strong> MZN$ <%= venda.getTotal() %></p>
                <p><strong>Status:</strong> <%= venda.getStatus() %></p>
            </div>

            <!-- Itens da Venda -->
            <div class="m-5">
                <h4>Itens da Venda</h4>
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>Fruta</th>
                            <th>Quantidade</th>
                            <th>Preço Unitário</th>
                            <th>Subtotal</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% if (itensVenda == null || itensVenda.isEmpty()) { %>
                            <tr>
                                <td colspan="4">Nenhum item encontrado para esta venda.</td>
                            </tr>
                        <% } else { %>
                            <% for (ItensVenda item : itensVenda) { %>
                                <tr>
                                    <td><%= item.getFruta().getNome() %></td>
                                    <td><%= item.getQuantidade() %></td>
                                    <td>MZN$ <%= item.getPrecoUnitario() %></td>
                                    <td>MZN$ <%= item.getSubtotal() %></td>
                                </tr>
                            <% } %>
                        <% } %>
                    </tbody>
                </table>
            </div>

            <!-- Botão Voltar -->
            <div class="m-5 text-center">
                <a href="index.jsp" class="btn btn-primary" style="background-color:#fc5d35; border:none;">
                    <i class="fa fa-arrow-left"></i> Voltar
                </a>
            </div>
        </div>
    </section>

    <!-- Scripts -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>