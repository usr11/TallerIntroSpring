<%@ page import="org.example.service.VehicleService" %>
<%@ page import="org.example.app.AppContext" %><%--
  Created by IntelliJ IDEA.
  User: 1108559698
  Date: 14/08/2025
  Time: 11:40 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Taller de Spring</title>
</head>
<body>
    <h1>Sistema de gestión de estacionamiento</h1>

    <a href="vehiclesList.jsp" >Lista de todos los vehículos</a><br><br>
    <a href="vehicleByLicensePlate.jsp" >Buscar vehículo por placa</a><br><br>
    <a href="deleteVehicleByLicensePlate.jsp" >Eliminar un vehículo por placa</a><br><br>
    <a href="addDriver.jsp" >Agregar un conductor</a><br><br>
    <a href="addVehicle.jsp" >Agregar un vehículo</a><br><br>
    <a href="driverAndVehicleList.jsp" >Lista de todos los conductores con todos sus vehículos</a><br><br>
    <a href="vehiclesByDriverIdentificationServlet.jsp" >Buscar vehículos de un conductor por cedula</a><br><br>

</body>
</html>
