<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.Map" %>

<%
    // Obtém o ID da fruta a ser removida
    String frutaIdParam = request.getParameter("frutaId");

    if (frutaIdParam != null) {
        try {
            int frutaId = Integer.parseInt(frutaIdParam);

            // Obtém o carrinho da sessão
            Map<Integer, Integer> carrinho = (Map<Integer, Integer>) session.getAttribute("carrinho");

            if (carrinho != null && carrinho.containsKey(frutaId)) {
                // Remove o item do carrinho
                carrinho.remove(frutaId);

                // Atualiza o carrinho na sessão
                session.setAttribute("carrinho", carrinho);
            }

            // Redireciona de volta para a página do carrinho
            response.sendRedirect(request.getContextPath() + "/carrinho.jsp");
        } catch (NumberFormatException e) {
            out.println("<p>Erro: ID da fruta inválido.</p>");
        }
    } else {
        out.println("<p>Erro: Nenhum ID de fruta fornecido.</p>");
    }
%>