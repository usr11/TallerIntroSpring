<%--
  Created by IntelliJ IDEA.
  User: 1108559698
  Date: 20/08/2025
  Time: 9:35 a. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Agregar Vehículo</title>
</head>
<body>
  <h1>Formulario para agregar vehículo:</h1>
  <form method="POST" action="addVehicle"><br><br>
    <input type="text" placeholder="Placa" name="licensePlate" required><br><br>
    <input type="number" placeholder="Cilindraje" name="cylinderSize" required><br><br>
    <input type="text" placeholder="Tipo de combustible" name="fuelType" required><br><br>
    <input type="text" placeholder="Número de motor" name="engineNumber" required><br><br>
    <input type="text" placeholder="Marca" name="brand" required><br><br>
    <input type="number" placeholder="Modelo" name="model" min="1900" max="2030" required><br><br>

    <!--Mensajes de error-->
    <%

      String message = (String) request.getAttribute("message");
      String messageType = (String) request.getAttribute("messageType");
      if(message != null){

        if(messageType.equals("error")){
          out.println("<div style='color:red'>"+message+"</div>");
        } else {
          out.println("<div style='color:green'>"+message+"</div>");
        }

      }
    %>

    <button type="submit">Registrar</button>
  </form>
</body>
</html>
