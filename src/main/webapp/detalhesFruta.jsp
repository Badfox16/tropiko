<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.isced.tropiko.service.FrutaService" %>
<%@ page import="com.isced.tropiko.model.Fruta" %>
<%@ include file="./includes/headCliente.jsp" %>

<%
    // Obtém o ID da fruta da URL
    String idFruta = request.getParameter("id");
    Fruta fruta = null;
    FrutaService frutaService = new FrutaService(new com.isced.tropiko.dao.FrutaDAO());

    if (idFruta != null) {
        try {
            Integer id = Integer.parseInt(idFruta);
            fruta = frutaService.buscarFrutaPorId(id); // Busca a fruta pelo ID
        } catch (NumberFormatException e) {
            out.println("<p>Erro: ID da Fruta inválido.</p>");
        }
    }

    if (fruta == null) {
        out.println("<p>Erro: Fruta não encontrada.</p>");
        return;
    }
%>

<html>
  <body>
    <div class="hero_area sub_pages">
      <!-- header section -->
      <%@ include file="./includes/header.jsp" %>
      <!-- end header section -->
    </div>

    <!-- detalhes da fruta -->
    <section class="fruit_details_section layout_padding">
      <div class="container">
        <div class="row">
          <div class="col-md-6">
            <div class="fruit_img-box">
              <img src="<%= fruta.getImagemUrl() != null ? request.getContextPath() + "/" + fruta.getImagemUrl() : request.getContextPath() + "/assets/images/default-fruta.png" %>"
                   alt="Imagem da Fruta" class="img-fluid" />
            </div>
          </div>
          <div class="col-md-6">
            <div class="fruit_detail-box">
              <h2 class="custom_heading"><%= fruta.getNome() %></h2>
              <p class="custom_heading-text">
                <%= fruta.getDescricao() %>
              </p>
              <h4 class="price">
                Preço: MZN$ <span><%= String.format("%.2f", fruta.getPreco()) %></span>
              </h4>
              <h5 class="stock">
                Estoque: <span><%= fruta.getEstoque() %> Kgs</span>
              </h5>
              <% if (fruta.getEstoque() > 0) { %>
                <form action="<%= request.getContextPath() %>/adicionarCarrinho.jsp" method="post">
                  <input type="hidden" name="frutaId" value="<%= fruta.getId() %>" />
                  <div class="quantity_box">
                      <label for="quantidade">Quantidade:</label>
                      <input type="number" id="quantidade" name="quantidade" value="1" min="1" max="<%= fruta.getEstoque() %>" class="form-control" />
                  </div>
                  <br>
                  <div class="btn-box">
                      <button type="submit" class="custom_dark-btn">Adicionar ao Carrinho</button>
                  </div>
              </form>
              <% } else { %>
              <div class="alert alert-danger mt-3">
                <strong>Indisponível:</strong> Esta fruta está fora de estoque.
              </div>
              <% } %>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- fim dos detalhes da fruta -->

    <!-- footer section -->
    <%@ include file="./includes/footer.jsp" %>
    <!-- end footer section -->
  </body>
</html>