<%@ page import="com.isced.tropiko.service.FrutaService" %>
<%@ page import="com.isced.tropiko.model.Fruta" %>
<%@ page import="java.math.BigDecimal" %>

<%
    String action = request.getParameter("action");
    FrutaService frutaService = new FrutaService(new com.isced.tropiko.dao.FrutaDAO());

    if ("registrar".equals(action)) {
        // Obtém os parâmetros do formulário
        String nome = request.getParameter("nome");
        String descricao = request.getParameter("descricao");
        BigDecimal preco = new BigDecimal(request.getParameter("preco"));
        Integer estoque = Integer.parseInt(request.getParameter("estoque"));
        String categoria = request.getParameter("categoria");
        String imagemUrl = request.getParameter("imagemUrl");

        // Registra a nova fruta
        frutaService.adicionarFruta(nome, descricao, preco, estoque, categoria, imagemUrl);
        response.sendRedirect("index.jsp"); 
    } else if ("deletar".equals(action)) {
        // Obtém o ID da fruta a ser deletada
        String id = request.getParameter("id");

        if (id != null) {
            frutaService.removerFruta(Integer.parseInt(id));
        }
        response.sendRedirect("index.jsp"); 
    }
%>