<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.isced.tropiko.model.Usuario" %>

<!DOCTYPE html>
<html>
<head>
  <title>Teste de Usuários</title>
</head>
<body>

<h1>Teste de Listagem de Usuários</h1>

<%
  Object usuariosObj = request.getAttribute("usuarios");
  out.println("Usuarios recebidos no JSP: " + usuariosObj);
%>

<!-- Exibir os usuários se existirem -->
<% if (usuariosObj != null && usuariosObj instanceof List) {
  List<Usuario> usuarios = (List<Usuario>) usuariosObj;
  if (!usuarios.isEmpty()) {
%>
<table border="1">
  <tr>
    <th>ID</th>
    <th>Nome</th>
    <th>Email</th>
  </tr>
  <% for (Usuario usuario : usuarios) { %>
  <tr>
    <td><%= usuario.getId() %></td>
    <td><%= usuario.getNome() %></td>
    <td><%= usuario.getEmail() %></td>
  </tr>
  <% } %>
</table>
<%
} else {
%>
<p>Nenhum usuário encontrado.</p>
<%
  }
} else {
%>
<p>Atributo 'usuarios' não encontrado ou inválido.</p>
<% } %>

<br/>
<a href="usuario?action=listar">Listar Usuários</a>

</body>
</html>
