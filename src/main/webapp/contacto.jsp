
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <%@ include file="./includes/headCliente.jsp" %>
<body>
<div class="hero_area sub_pages">
    <!-- header section -->
    <%@ include file="./includes/header.jsp" %>
    <!-- end header section -->
</div>

<!-- seção de contato -->
<section class="contact_section layout_padding">
    <div class="container">
        <h2 class="font-weight-bold">
            Entre em Contato Conosco
        </h2>
        <div class="row">
            <div class="col-md-8 mr-auto">
                <form action="enviar.jsp" method="post">
                    <div class="contact_form-container">
                        <div>
                            <div class="form-group">
                                <input type="text" class="form-control" name="nome" placeholder="Nome" required>
                            </div>
                            <div class="form-group">
                                <input type="text" class="form-control" name="telefone" placeholder="Número de Telefone" required>
                            </div>
                            <div class="form-group">
                                <input type="email" class="form-control" name="email" placeholder="E-mail" required>
                            </div>
                            <div class="form-group mt-4">
                                <textarea class="form-control" name="mensagem" rows="5" placeholder="Mensagem" required></textarea>
                            </div>
                            <div class="mt-4 text-center">
                                <button type="submit" class="btn btn-primary" style="background-color: #fc5d35; border: none;">
                                    Enviar
                                </button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</section>
<!-- fim da seção de contato -->

<!-- footer section -->
<%@ include file="./includes/footer.jsp" %>
<!-- end footer section -->
</body>
</html>
