<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="com.isced.tropiko.model.Fruta" %>
<%@ page import="com.isced.tropiko.service.FrutaService" %>

<%
    // Obtém os parâmetros do formulário
    String frutaIdParam = request.getParameter("frutaId");
    String quantidadeParam = request.getParameter("quantidade");

    if (frutaIdParam != null && quantidadeParam != null) {
        try {
            int frutaId = Integer.parseInt(frutaIdParam);
            int quantidade = Integer.parseInt(quantidadeParam);

            // Busca a fruta pelo ID
            FrutaService frutaService = new FrutaService(new com.isced.tropiko.dao.FrutaDAO());
            Fruta fruta = frutaService.buscarFrutaPorId(frutaId);

            if (fruta != null && quantidade > 0 && quantidade <= fruta.getEstoque()) {
                // Obtém o carrinho da sessão ou cria um novo
                Map<Integer, Integer> carrinho = (Map<Integer, Integer>) session.getAttribute("carrinho");
                if (carrinho == null) {
                    carrinho = new HashMap<>();
                }

                // Adiciona ou atualiza a quantidade no carrinho
                carrinho.put(frutaId, carrinho.getOrDefault(frutaId, 0) + quantidade);

                // Atualiza o carrinho na sessão
                session.setAttribute("carrinho", carrinho);

                // Redireciona para a página do carrinho
                response.sendRedirect(request.getContextPath() + "/carrinho.jsp");
            } else {
                out.println("<p>Erro: Quantidade inválida ou fruta não encontrada.</p>");
            }
        } catch (NumberFormatException e) {
            out.println("<p>Erro: Parâmetros inválidos.</p>");
        }
    } else {
        out.println("<p>Erro: Parâmetros ausentes.</p>");
    }
%>