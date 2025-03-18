<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<style>
    .nav-link.btn:hover {
        background-color: #12065e;
        color: #fff;
        font-weight: bold;
    }
</style>
<div class="d-flex flex-column p-3 text-white position-fixed border border-left"
     style="width: 300px; background-color:#fc5d35; height:100vh;">
    <a href="<%= request.getContextPath() %>"
       class="d-flex flex-column align-items-center mb-3 text-white text-decoration-none">
        <span class="fs-4" style="font-weight: bolder;">Loja Online</span>
        <span class="fs-4"><img src="<%= request.getContextPath() %>/assets/logo.png" alt="icone Loja Online" srcset=""
                                width="80"></span>
    </a>
    <hr>
    <ul class="nav nav-pills flex-column mb-auto">
        <li>
            <a href="<%= request.getContextPath() %>/fruta/index.jsp"
               class="nav-link my-4 text-white btn d-flex align-items-center"
               style="background-color: #fc5d35; border: none;">
                <strong>
                    <i class="fa-solid fa-box mx-2"></i>
                    <span>Frutas</span>
                </strong>
            </a>
        </li>
        <li>
            <a href="<%= request.getContextPath() %>/Cliente/index.jsp"
               class="nav-link text-white mb-4 btn d-flex align-items-center"
               style="background-color: #fc5d35; border: none;">
                <strong>
                    <i class="fa-solid fa-users mx-2"></i>
                    <span>Clientes</span>
                </strong>
            </a>
        </li>
        <li>
            <a href="<%= request.getContextPath() %>/carrinho/index.jsp"
               class="nav-link text-white mb-4 btn d-flex align-items-center"
               style="background-color: #fc5d35; border: none;">
                <strong>
                    <i class="fa-solid fa-shopping-cart mx-2"></i>
                    <span>Carrinhos</span>
                </strong>
            </a>
        </li>
        <li>
            <a href="<%= request.getContextPath() %>/usuario/index.jsp"
               class="nav-link text-white mb-4 btn d-flex align-items-center"
               style="background-color: #fc5d35; border: none;">
                <strong>
                    <i class="fa-solid fa-user mx-2"></i>
                    <span>Usuários</span>
                </strong>
            </a>
        </li>
    </ul>
    <hr>
    <div class="d-flex flex-column">
        <a href="<%= request.getContextPath() %>/usuario/controller.jsp?action=logout"
           class="d-flex align-items-center text-white text-decoration-none m-2 btn"
           style="background-color: #fc5d35; border: none;">
            <i class="fa fa-sign-out mx-2"></i>
            <strong>Logout</strong>
        </a>
    </div>
</div>
