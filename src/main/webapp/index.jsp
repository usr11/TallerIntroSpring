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

    <a href="vehiclesList" >Lista de todos los vehículos</a><br><br>
    <a href="vehicleByLicensePlate" >Buscar vehículo por placa</a><br><br>
    <a href="#" >Eliminar un vehículo por placa</a><br><br>
    <a href="#" >Agregar un conductor</a><br><br>
    <a href="addVehicle" >Agregar un vehículo</a><br><br>
    <a href="driverAndVehicleList" >Lista de todos los conductores con todos sus vehículos</a><br><br>
    <a href="#" >Buscar vehículos de un conductor por cedula</a><br><br>

</body>
</html>
