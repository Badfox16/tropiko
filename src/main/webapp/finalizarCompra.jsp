<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.math.BigDecimal" %>
<%@ page import="com.isced.tropiko.model.Fruta" %>
<%@ page import="com.isced.tropiko.model.ItensVenda" %>
<%@ page import="com.isced.tropiko.model.Venda" %>
<%@ page import="com.isced.tropiko.service.FrutaService" %>
<%@ page import="com.isced.tropiko.service.VendaService" %>
<%@ page import="com.isced.tropiko.service.ItensVendaService" %>
<%@ page import="com.isced.tropiko.model.Usuario" %>

<%
    // Verifica se o usuário está logado
    Usuario usuarioLogado = (Usuario) session.getAttribute("usuarioLogado");
    Integer usuarioId = usuarioLogado.getId();
    if (usuarioId == null) {
        response.sendRedirect(request.getContextPath() + "/index.jsp");
        return;
    }

    // Obtém o carrinho da sessão
    Map<Integer, Integer> carrinho = (Map<Integer, Integer>) session.getAttribute("carrinho");
    if (carrinho == null || carrinho.isEmpty()) {
        response.sendRedirect(request.getContextPath() + "/carrinho.jsp");
        return;
    }

    // Inicializa os serviços
    FrutaService frutaService = new FrutaService(new com.isced.tropiko.dao.FrutaDAO());
    VendaService vendaService = new VendaService(new com.isced.tropiko.dao.VendaDAO());
    ItensVendaService itensVendaService = new ItensVendaService(new com.isced.tropiko.dao.ItensVendaDAO());

    // Cria a venda
    Venda venda = new Venda();
    venda.setUsuario(usuarioLogado); // Define o usuário logado
    venda.setStatus("PENDENTE");
    BigDecimal totalVenda = BigDecimal.ZERO;

    // Processa os itens do carrinho
    List<ItensVenda> itensVenda = new ArrayList<>();
    for (Map.Entry<Integer, Integer> entry : carrinho.entrySet()) {
        Integer frutaId = entry.getKey();
        Integer quantidade = entry.getValue();

        Fruta fruta = frutaService.buscarFrutaPorId(frutaId);
        if (fruta != null && quantidade > 0 && quantidade <= fruta.getEstoque()) {
            BigDecimal precoUnitario = fruta.getPreco();
            BigDecimal subtotal = precoUnitario.multiply(new BigDecimal(quantidade));

            // Cria o item da venda
            ItensVenda item = new ItensVenda();
            item.setFruta(fruta);
            item.setQuantidade(quantidade);
            item.setPrecoUnitario(precoUnitario);
            item.setSubtotal(subtotal);
            item.setVenda(venda); // Associa o item à venda

            // Adiciona o item à lista de itens da venda
            itensVenda.add(item);

            // Atualiza o total da venda
            totalVenda = totalVenda.add(subtotal);

            // Atualiza o estoque da fruta
            fruta.setEstoque(fruta.getEstoque() - quantidade);
            frutaService.atualizarFruta(fruta);
        }
    }

    // Define o total da venda
    venda.setTotal(totalVenda);

    // Salva a venda no banco de dados
    vendaService.salvarVenda(venda); // Persistindo a venda antes dos itens

    // Salva os itens da venda no banco de dados
    for (ItensVenda item : itensVenda) {
        itensVendaService.adicionarItemVenda(venda, item.getFruta(), item.getQuantidade(), item.getPrecoUnitario());
    }

    // Limpa o carrinho da sessão
    session.removeAttribute("carrinho");

    // Redireciona para a página de confirmação
    response.sendRedirect(request.getContextPath() + "/confirmacao.jsp");
%>