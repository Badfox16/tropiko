<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.Map" %>
<%@ page import="com.isced.tropiko.model.Fruta" %>
<%@ page import="com.isced.tropiko.service.FrutaService" %>
<%@ page import="java.math.BigDecimal" %>
<%@ include file="./includes/headCliente.jsp" %>

<%
    // Obtém o carrinho da sessão
    Map<Integer, Integer> carrinho = (Map<Integer, Integer>) session.getAttribute("carrinho");
    FrutaService frutaService = new FrutaService(new com.isced.tropiko.dao.FrutaDAO());
    double total = 0.0;
%>

<!DOCTYPE html>
<html>
<body>
<div class="hero_area sub_pages">
    <!-- header section -->
    <%@ include file="./includes/header.jsp" %>
    <!-- end header section -->
</div>

<section class="cart_section layout_padding">
    <div class="container">
        <h2 class="custom_heading">Carrinho de Compras</h2>
        <p class="custom_heading-text">Revise os itens do seu carrinho antes de finalizar a compra.</p>

        <div class="table-responsive">
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>Nome</th>
                        <th>Quantidade</th>
                        <th>Preço Unitário (MZN$)</th>
                        <th>Subtotal (MZN$)</th>
                        <th>Ações</th>
                    </tr>
                </thead>
                <tbody>
                    <% if (carrinho != null && !carrinho.isEmpty()) {
                        for (Map.Entry<Integer, Integer> entry : carrinho.entrySet()) {
                            Fruta fruta = frutaService.buscarFrutaPorId(entry.getKey());
                            int quantidade = entry.getValue();
                            BigDecimal precoFruta = fruta.getPreco();
                            double subtotal = quantidade * precoFruta.doubleValue();
                            total += subtotal;
                    %>
                    <tr>
                        <td><%= fruta.getNome() %></td>
                        <td><%= quantidade %></td>
                        <td><%= String.format("%.2f", fruta.getPreco()) %></td>
                        <td><%= String.format("%.2f", subtotal) %></td>
                        <td>
                            <form action="<%= request.getContextPath() %>/removerItemCarrinho.jsp" method="post" style="display:inline;">
                                <input type="hidden" name="frutaId" value="<%= fruta.getId() %>" />
                                <button type="submit" class="btn btn-danger btn-sm">Remover</button>
                            </form>
                        </td>
                    </tr>
                    <% } } else { %>
                    <tr>
                        <td colspan="5" class="text-center">Seu carrinho está vazio.</td>
                    </tr>
                    <% } %>
                </tbody>
                <tfoot>
                    <tr>
                        <th colspan="4" class="text-right">Total:</th>
                        <th>MZN$ <%= String.format("%.2f", total) %></th>
                    </tr>
                </tfoot>
            </table>
        </div>

        <% if (carrinho != null && !carrinho.isEmpty()) { %>
        <form action="<%= request.getContextPath() %>/finalizarCompra.jsp" method="post">
            <div class="form-group text-center">
                <button type="submit" class="btn btn-primary custom_dark-btn" style="background-color: #fc5d35; border: none;">
                    Finalizar Compra
                </button>
            </div>
        </form>
        <% } %>
    </div>
</section>

<!-- footer section -->
<%@ include file="./includes/footer.jsp" %>
<!-- end footer section -->
</body>
</html>