<%--
  Created by IntelliJ IDEA.
  User: 1108559698
  Date: 23/08/2025
  Time: 11:28 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Agregar Conductor</title>
</head>
<body>
  <h1>Agregar un nuevo conductor</h1>



  <form method="POST" action="addDriver">
    <input type="text" name="name" placeholder="Nombre" required>
    <input type="text" name="position" placeholder="Cargo" required>
    <input type="text" name="typeOfIdentification" placeholder="Tipo de identificación" required>
    <input type="text" name="identificationNumber" placeholder="Numero de identificacion" required>
    <button>Agregar Conductor</button>
  </form>
  <%

    String messageType = (String) request.getAttribute("messageType");
    String message = (String) request.getAttribute("message");

    if(messageType != null && message != null){
      if(messageType.equals("success")){
        out.println("<div style='color:green'>"+message+"</div>");
      } else {
        out.println("<div style='color:red'>"+message+"</div>");
      }
    }

  %>
</body>
</html>
