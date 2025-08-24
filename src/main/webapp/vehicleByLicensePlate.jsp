<%@ page import="org.example.model.Vehicle" %>
<%@ page import="org.example.app.AppContext" %>
<%@ page import="org.example.service.VehicleService" %><%--
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

  <form method="GET">
    <input type="text" name="licensePlate" placeholder="Placa" required>
    <button>Buscar</button>
  </form>

  <%

    String licensePlate = (String) request.getParameter("licensePlate");

    if(licensePlate != null && !licensePlate.trim().isEmpty()){

      VehicleService vehicleService = AppContext.getInstance().getBean("vehicleService", VehicleService.class);
      Vehicle vehicle = vehicleService.getVehicleByLicensePlate(licensePlate);

      if(vehicle != null) {
        out.println("<h4 style='color:green'>Vehículo encontrado</h4>");
        out.println("<h4>Placa: "+ vehicle.getLicensePlate() + " </h4>");
        out.println("<p>Cilindraje: "+ vehicle.getCylinderSize() + " </p>");
        out.println("<p>Tipo de combustible: "+ vehicle.getFuelType() + " </p>");
        out.println("<p>Numero de motor: "+ vehicle.getEngineNumber() + " </p>");
        out.println("<p>Marca: "+ vehicle.getBrand() + " </p>");
        out.println("<p>Modelo: "+ vehicle.getModel() + " </p>");
      } else {
        out.println("<h4 style='color:red'>Vehículo no encontrado</h4>");
      }
    }


  %>


</body>
</html>
