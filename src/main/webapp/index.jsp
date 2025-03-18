<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<%@ include file="./includes/headCliente.jsp" %>

<body>
<!-- seção de login -->
<section class="login_section layout_padding">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="form_container">
                    <h2 class="custom_heading text-center">Login</h2>
                    <form action="usuario/controller.jsp" method="post">
                        <input type="hidden" name="action" value="login" />
                        <div class="form-group">
                            <label for="email">Email:</label>
                            <input type="email" id="email" name="email" class="form-control" placeholder="Digite seu email" required>
                        </div>
                        <div class="form-group">
                            <label for="senha">Senha:</label>
                            <input type="password" id="senha" name="senha" class="form-control" placeholder="Digite sua senha" required>
                        </div>
                        <div class="form-group text-center">
                            <button type="submit" class="btn btn-primary custom_dark-btn" style="background-color: #fc5d35; border: none;">
                                Entrar
                            </button>
                        </div>
                        <div class="text-center mt-3">
                            <p>Não tem uma conta? <a href="registro.jsp" style="color: #fc5d35;">Registre-se</a></p>
                        </div>
                    </form>
                    <% if (session.getAttribute("erro") != null) { %>
                        <div class="alert alert-danger mt-3">
                            <%= session.getAttribute("erro") %>
                            <% session.removeAttribute("erro"); %>
                        </div>
                    <% } %>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- fim da seção de login -->

<!-- footer section -->
<%@ include file="./includes/footer.jsp" %>
<!-- end footer section -->
</body>
</html>