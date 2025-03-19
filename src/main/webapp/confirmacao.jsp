<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<%@ include file="./includes/headCliente.jsp" %>

<body>
<div class="hero_area sub_pages">
    <!-- header section -->
    <%@ include file="./includes/header.jsp" %>
    <!-- end header section -->
</div>

<section class="confirmation_section layout_padding">
    <div class="container text-center">
        <h2 class="custom_heading">Compra Finalizada</h2>
        <p class="custom_heading-text">
            Obrigado por sua compra! Seu pedido foi processado com sucesso.
        </p>
        <a href="<%= request.getContextPath() %>/home.jsp" class="btn btn-primary custom_dark-btn" style="background-color: #fc5d35; border: none;">
            Voltar para a Página Inicial
        </a>
    </div>
</section>

<!-- footer section -->
<%@ include file="./includes/footer.jsp" %>
<!-- end footer section -->
</body>
</html>