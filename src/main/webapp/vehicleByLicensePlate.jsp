<%@ page import="org.example.model.Vehicle" %><%--
  Created by IntelliJ IDEA.
  User: 1108559698
  Date: 20/08/2025
  Time: 9:55 a. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Obtener vehículo por la placa</title>
</head>
<body>

  <h1>Buscar un vehículo por placa</h1>

  <form method="GET" action="vehicleByLicensePlate">
    <input type="text" name="licensePlate" placeholder="Placa" required>
    <button>Buscar</button>
  </form>

  <%

    String message = (String) request.getAttribute("message");
    String messageType = (String) request.getAttribute("messageType");

    if(message != null) {
      if("error".equals(messageType)) {
        out.println("<div style='color:red; margin: 15px 0; padding: 10px; border: 1px solid red; border-radius: 3px; background-color: #ffebee;'>"+message+"</div>");
      } else {
        out.println("<div style='color:green; margin: 15px 0; padding: 10px; border: 1px solid green; border-radius: 3px; background-color: #e8f5e8;'>"+message+"</div>");
      }
    }

    Vehicle vehicle = (Vehicle) request.getAttribute("vehicle");
    if(vehicle != null){
      out.println("<h4>Vehículo encontrado</h4>");
      out.println("<h4>Placa: "+ vehicle.getLicensePlate() + " </h4>");
      out.println("<p>Cilindraje: "+ vehicle.getCylinderSize() + " </p>");
      out.println("<p>Tipo de combustible: "+ vehicle.getFuelType() + " </p>");
      out.println("<p>Numero de motor: "+ vehicle.getEngineNumber() + " </p>");
      out.println("<p>Marca: "+ vehicle.getBrand() + " </p>");
      out.println("<p>Modelo: "+ vehicle.getModel() + " </p>");
    }

  %>


</body>
</html>
