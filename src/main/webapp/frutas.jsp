<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.isced.tropiko.service.FrutaService" %>
<%@ page import="com.isced.tropiko.model.Fruta" %>
<%
    // Parâmetros de pesquisa e paginação
    String nomeFiltro = request.getParameter("nome");
    String paginaParam = request.getParameter("pagina");
    int paginaAtual = (paginaParam != null) ? Integer.parseInt(paginaParam) : 1;
    int itensPorPagina = 4;

    FrutaService frutaService = new FrutaService(new com.isced.tropiko.dao.FrutaDAO());
    List<Fruta> frutas = frutaService.listarFrutasPorNome(nomeFiltro, paginaAtual, itensPorPagina);
    int totalFrutas = frutaService.contarFrutasPorNome(nomeFiltro);
    int totalPaginas = (int) Math.ceil((double) totalFrutas / itensPorPagina);
%>
<html>
<%@ include file="./includes/headCliente.jsp" %>

<body>
<div class="hero_area sub_pages">
    <!-- header section -->
    <%@ include file="./includes/header.jsp" %>
    <!-- end header section -->
</div>

<!-- seção de frutas -->
<section class="fruit_section layout_padding-top">
    <div class="container">
        <h2 class="custom_heading">Frutas Frescas</h2>
        <p class="custom_heading-text">
            Aqui você encontra as frutas mais frescas e de alta qualidade.
        </p>

        <!-- Formulário de pesquisa -->
        <form method="get" action="frutas.jsp" class="mb-4">
            <div class="row">
                <div class="col-md-8">
                    <input type="text" name="nome" class="form-control" placeholder="Pesquisar por nome" value="<%= nomeFiltro != null ? nomeFiltro : "" %>">
                </div>
                <div class="col-md-4">
                    <button type="submit" class="btn btn-primary" style="background-color: #fc5d35; border: none;">
                        Pesquisar
                    </button>
                </div>
            </div>
        </form>

        <!-- Lista de frutas -->
        <div class="row layout_padding2">
            <%
                if (frutas != null && !frutas.isEmpty()) {
                    for (Fruta fruta : frutas) {
            %>
            <div class="col-md-8">
                <div class="fruit_detail-box">
                    <h3>
                        <%= fruta.getNome() %>
                    </h3>
                    <p class="mt-4 mb-5">
                        <%= fruta.getDescricao() %>
                    </p>
                    <div>
                        <a href="detalhesFruta.jsp?id=<%= fruta.getId() %>" class="custom_dark-btn">
                            Ver Detalhes
                        </a>
                    </div>
                </div>
            </div>
            <div class="col-md-4 d-flex justify-content-center align-items-center">
                <div class="fruit_img-box d-flex justify-content-center align-items-center">
                    <img height="220" src="<%= fruta.getImagemUrl() != null ? fruta.getImagemUrl() : "assets/images/default-fruta.png" %>"
                         alt="<%= fruta.getNome() %>" class="" width="250px" />
                </div>
            </div>
            <%
                    }
                } else {
            %>
            <div class="col-12 text-center">
                <p>Nenhuma fruta encontrada para o filtro aplicado.</p>
            </div>
            <%
                }
            %>
        </div>

        <!-- Paginação -->
        <div class="text-center mt-5">
            <nav>
                <ul class="pagination justify-content-center">
                    <%
                        for (int i = 1; i <= totalPaginas; i++) {
                    %>
                    <li class="page-item <%= (i == paginaAtual) ? "active" : "" %>">
                        <a class="page-link" href="frutas.jsp?pagina=<%= i %>&nome=<%= nomeFiltro != null ? nomeFiltro : "" %>">
                            <%= i %>
                        </a>
                    </li>
                    <%
                        }
                    %>
                </ul>
            </nav>
        </div>
    </div>
</section>
<!-- fim da seção de frutas -->

<!-- footer section -->
<%@ include file="./includes/footer.jsp" %>
<!-- end footer section -->
</body>
</html>