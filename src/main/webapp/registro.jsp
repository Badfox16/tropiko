<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<%@ include file="./includes/headCliente.jsp" %>

<body>
<div class="hero_area">
    <!-- header section -->
    <%@ include file="./includes/header.jsp" %>
    <!-- end header section -->
</div>

<!-- seção de registro -->
<section class="register_section layout_padding">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="form_container">
                    <h2 class="custom_heading text-center">Registro</h2>
                    <form action="usuario" method="post">
                        <input type="hidden" name="action" value="register" />
                        <div class="form-group">
                            <label for="nome">Nome:</label>
                            <input type="text" id="nome" name="nome" class="form-control" placeholder="Digite seu nome" required>
                        </div>
                        <div class="form-group">
                            <label for="email">Email:</label>
                            <input type="email" id="email" name="email" class="form-control" placeholder="Digite seu email" required>
                        </div>
                        <div class="form-group">
                            <label for="senha">Senha:</label>
                            <input type="password" id="senha" name="senha" class="form-control" placeholder="Digite sua senha" required>
                        </div>
                        <div class="form-group">
                            <label for="confirmarSenha">Confirmar Senha:</label>
                            <input type="password" id="confirmarSenha" name="confirmarSenha" class="form-control" placeholder="Confirme sua senha" required>
                        </div>
                        <div class="form-group text-center">
                            <button type="submit" class="btn btn-primary custom_dark-btn" style="background-color: #fc5d35; border: none;">
                                Registrar
                            </button>
                        </div>
                        <div class="text-center mt-3">
                            <p>Já tem uma conta? <a href="index.jsp" style="color: #fc5d35;">Faça login</a></p>
                        </div>
                    </form>
                    <% if (request.getAttribute("erro") != null) { %>
                        <div class="alert alert-danger mt-3">
                            <%= request.getAttribute("erro") %>
                        </div>
                    <% } %>
                    <% if (request.getAttribute("sucesso") != null) { %>
                        <div class="alert alert-success mt-3">
                            <%= request.getAttribute("sucesso") %>
                        </div>
                    <% } %>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- fim da seção de registro -->

<!-- footer section -->
<%@ include file="./includes/footer.jsp" %>
<!-- end footer section -->
</body>
</html>