<%@ page import="com.isced.tropiko.model.Usuario" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<header class="header_section">
    <div class="container">
        <nav class="navbar navbar-expand-lg custom_nav-container pt-3">
            <a class="navbar-brand" href="home.jsp">
                <img src="<%= request.getContextPath() %>/assets/images/logo.png" alt="" /><span>
              Tropiko
            </span>
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                    aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <div class="d-flex ml-auto flex-column flex-lg-row align-items-center">
                    <ul class="navbar-nav  ">
                        <li class="nav-item active">
                            <a class="nav-link" href="<%= request.getContextPath() %>/home.jsp">Home <span class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="<%= request.getContextPath() %>/frutas.jsp"> Frutas</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="<%= request.getContextPath() %>/servicos.jsp"> Serviços </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="<%= request.getContextPath() %>/contacto.jsp">Fale connosco</a>
                        </li>
                    </ul>
                    <form action="<%= request.getContextPath() %>/frutas.jsp" class="form-inline my-2 my-lg-0 ml-0 ml-lg-4 mb-3 mb-lg-0">
                        <button class="btn  my-2 my-sm-0 nav_search-btn" type="submit"></button>
                    </form>
                </div>
                <div class="quote_btn-container ml-0 ml-lg-4 d-flex justify-content-center">
                    <a href="<%= request.getContextPath() %>/carrinho.jsp">
                        Carrinho
                    </a>
                </div>
                <div class="quote_btn-container ml-0 ml-lg-4 d-flex justify-content-center">
                    <%
                        Usuario usuarioLogado = (Usuario) session.getAttribute("usuarioLogado");
                        if (usuarioLogado != null) {
                    %>
                        <span>Olá, <%= usuarioLogado.getNome() %>!</span>
                        <a href="<%= request.getContextPath() %>/usuario/controller.jsp?action=logout">
                            Logout
                        </a>
                    <%
                        } else {
                    %>
                        <a href="<%= request.getContextPath() %>/index.jsp">
                            Login
                        </a>
                    <%
                        }
                    %>
                </div>
            </div>
        </nav>
    </div>
</header>
