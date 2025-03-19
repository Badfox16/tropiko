<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.isced.tropiko.service.VendaService" %>
<%@ page import="com.isced.tropiko.model.Venda" %>

<%
    VendaService vendaService = new VendaService(new com.isced.tropiko.dao.VendaDAO());
    List<Object[]> vendas = vendaService.listarVendasComNomeUsuario();
%>

<!DOCTYPE html>
<html>
<%@ include file="../includes/head.jsp" %>

<body>
    <section class="d-flex">
        <%@ include file="../includes/sidebar.jsp" %>
        <div class="card-body" style="width: calc(100% - 300px); margin-left: 300px; overflow-y: scroll;">
            <h2 class="pd-2 m-5" style="color: #fc5d35;"><b>Gestão de Vendas</b></h2>

            <!-- TABELA -->
            <div class="">
                <table class="table table-responsive-lg table-hover table-borderless mb-0">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Usuário</th>
                            <th>Data</th>
                            <th>Total</th>
                            <th>Status</th>
                            <th>Ações</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% if (vendas == null || vendas.isEmpty()) { %>
                            <tr>
                                <td colspan="6">Nenhuma venda encontrada.</td>
                            </tr>
                        <% } else { %>
                            <% for (Object[] venda : vendas) { %>
                                <tr>
                                    <td><%= ((com.isced.tropiko.model.Venda) venda[0]).getId() %></td>
                                    <td><%= (String) venda[1] %></td>
                                    <td><%= ((com.isced.tropiko.model.Venda) venda[0]).getDataVenda() %></td>
                                    <td>MZN$ <%= ((com.isced.tropiko.model.Venda) venda[0]).getTotal() %></td>
                                    <td><%= ((com.isced.tropiko.model.Venda) venda[0]).getStatus() %></td>
                                    <td>
                                        <a href="detalhes.jsp?id=<%= ((com.isced.tropiko.model.Venda) venda[0]).getId() %>">
                                            <span style="font-size: 1.5rem; color:#fc5d35;" aria-hidden="true">
                                                <i class="fa fa-eye"></i>
                                            </span>
                                        </a>
                                    </td>
                                </tr>
                            <% } %>
                        <% } %>
                    </tbody>
                </table>
            </div>
        </div>
    </section>

    <!-- Scripts -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>