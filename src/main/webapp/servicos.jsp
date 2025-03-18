<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2025/03/18
  Time: 01:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <%@ include file="./includes/headCliente.jsp" %>

  <body>
  <div class="hero_area sub_pages">
      <!-- header section strats -->
      <%@ include file="./includes/header.jsp" %>
      <!-- end header section -->
  </div>

 <!-- seção de serviços -->
 <section class="service_section layout_padding ">
  <div class="container">
    <h2 class="custom_heading">Nossos Serviços</h2>
    <p class="custom_heading-text">
      Oferecemos serviços de alta qualidade para atender às suas necessidades.
    </p>
    <div class="layout_padding2">
      <div class="card-deck">
        <div class="card">
          <img class="card-img-top" src="<%= request.getContextPath() %>/assets/images/card-item-1.png" alt="Entrega rápida" />
          <div class="card-body">
            <h5 class="card-title">Entrega Rápida</h5>
            <p class="card-text">
              Garantimos que seus pedidos cheguem no menor tempo possível, com segurança e eficiência.
            </p>
          </div>
        </div>
        <div class="card">
          <img class="card-img-top" src="<%= request.getContextPath() %>/assets/images/card-item-2.png" alt="Produtos frescos" />
          <div class="card-body">
            <h5 class="card-title">Produtos Frescos</h5>
            <p class="card-text">
              Trabalhamos com produtos de alta qualidade, sempre frescos e prontos para uso.
            </p>
          </div>
        </div>
        <div class="card">
          <img class="card-img-top" src="<%= request.getContextPath() %>/assets/images/card-item-3.png" alt="Atendimento personalizado" />
          <div class="card-body">
            <h5 class="card-title">Atendimento Personalizado</h5>
            <p class="card-text">
              Nossa equipe está pronta para oferecer um atendimento exclusivo e adaptado às suas necessidades.
            </p>
          </div>
        </div>
      </div>
    </div>
    <div class="d-flex justify-content-center">
      <a href="home.jsp" class="custom_dark-btn">
        Saiba Mais
      </a>
    </div>
  </div>
</section>
<!-- fim da seção de serviços -->
  <!-- footer section -->
<%@ include file="./includes/footer.jsp" %>
<!-- end footer section -->
</body>
</html>
