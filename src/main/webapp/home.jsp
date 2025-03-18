<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.isced.tropiko.service.FrutaService" %>
<%@ page import="com.isced.tropiko.model.Fruta" %>

<%
    FrutaService frutaService = new FrutaService(new com.isced.tropiko.dao.FrutaDAO());
    List<Fruta> frutas = frutaService.listarFrutas();
%>

<html>
<%@ include file="./includes/headCliente.jsp" %>

<body>
<div class="hero_area sub_pages">
    <!-- header section strats -->
    <%@ include file="./includes/header.jsp" %>
    <!-- end header section -->
</div>
<!-- slider section -->
<section class="slider_section position-relative">
    <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
        <div class="carousel-inner">
            <div class="carousel-item active">
                <div class="slider_item-box">
                    <div class="slider_item-container">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="slider_item-detail">
                                        <div>
                                            <h1>
                                                Bem-vindo à <br />
                                                Nossa Loja de Frutas
                                            </h1>
                                            <p>
                                              Explore a nossa seleção de frutas frescas e deliciosas, 
                                              perfeitas para todas as ocasiões e para uma vida mais saudável.
                                            </p>
                                            <div class="d-flex">
                                                <a href="frutas.jsp" class="text-uppercase custom_orange-btn mr-3">
                                                    Comprar Agora
                                                </a>
                                                <a href="contacto.jsp" class="text-uppercase custom_dark-btn">
                                                    Contate-nos
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="slider_img-box">
                                        <div>
                                            <img src="<%= request.getContextPath() %>/assets/images/slide-img.png" alt="Frutas Frescas" class="" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="carousel-item">
                <div class="slider_item-box">
                    <div class="slider_item-container">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="slider_item-detail">
                                        <div>
                                            <h1>
                                                Descubra <br />
                                                Nossas Frutas Frescas
                                            </h1>
                                            <p>
                                                Oferecemos uma ampla variedade de frutas frescas e de alta qualidade, 
                                                perfeitas para sua saúde e bem-estar.
                                            </p>
                                            <div class="d-flex">
                                                <a href="frutas.jsp" class="text-uppercase custom_orange-btn mr-3">
                                                    Comprar Agora
                                                </a>
                                                <a href="contacto.jsp" class="text-uppercase custom_dark-btn">
                                                    Contate-nos
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="slider_img-box">
                                        <div>
                                            <img src="<%= request.getContextPath() %>/assets/images/tasty-image.png" alt="Frutas Frescas" class="" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="carousel-item">
                <div class="slider_item-box">
                    <div class="slider_item-container">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="slider_item-detail">
                                        <div>
                                            <h1>
                                                Qualidade e <br />
                                                Sabor Garantidos
                                            </h1>
                                            <p>
                                                Nossas frutas são cuidadosamente selecionadas para garantir o melhor 
                                                sabor e qualidade para você e sua família.
                                            </p>
                                            <div class="d-flex">
                                                <a href="frutas.jsp" class="text-uppercase custom_orange-btn mr-3">
                                                    Comprar Agora
                                                </a>
                                                <a href="contacto.jsp" class="text-uppercase custom_dark-btn">
                                                    Contate-nos
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="slider_img-box">
                                        <div>
                                            <img src="<%= request.getContextPath() %>/assets/images/fruta-boa.png" alt="Frutas Frescas" class="" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="custom_carousel-control">
            <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
                <span class="sr-only">Anterior</span>
            </a>
            <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
                <span class="sr-only">Próximo</span>
            </a>
        </div>
    </div>
</section>

<!-- end slider section -->
<!-- tasty section -->
<section class="tasty_section">
    <div class="container_fluid">
        <h2>
            Frutas saborosas e saudáveis
        </h2>
    </div>
</section>
<!-- end tasty section -->
<!-- seção de frutas -->

<section class="fruit_section layout_padding-top">
    <div class="container">
        <h2 class="custom_heading">Frutas Frescas</h2>
        <p class="custom_heading-text">
            Aqui você encontra as frutas mais frescas e de alta qualidade.
        </p>
        <div class="row layout_padding2">
            <% 
                int limite = 3; 
                int contador = 0;
                for (Fruta fruta : frutas) { 
                    if (contador >= limite) break;
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
                    <img src="<%= fruta.getImagemUrl() != null ? fruta.getImagemUrl() : "assets/images/default-fruit.png" %>"
                         alt="<%= fruta.getNome() %>" class="" width="250px" />
                </div>
            </div>
            <% 
                    contador++;
                } 
            %>
        </div>
        <div class="text-center mt-5">
            <a href="frutas.jsp" class="btn btn-primary" style="background-color: #fc5d35; border: none;">
                Ver Mais Frutas
            </a>
        </div>
    </div>
</section>

<!-- fim da seção de frutas -->
<!-- footer section -->
<%@ include file="./includes/footer.jsp" %>
<!-- end footer section -->
<script type="text/javascript" src="<%= request.getContextPath() %>/assets/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="<%= request.getContextPath() %>/assets/js/bootstrap.js"></script>
</body>
</html>