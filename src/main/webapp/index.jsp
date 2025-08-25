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
    <title>Gestión de vehículos</title>
    <style>

        *{
            background: #d4d4d4;
        }

        body {
            padding: 20px;
        }

        a {
            color: darkblue;
            background: none;
            text-decoration: none;
        }

        p{
            font-size: large;
            font-weight: bold;
            background: none;

        }

        .general-container {
            display: flex;
            flex-direction: column;
            gap: 20px;
            max-width: 600px;
            padding: 20px 0;
        }

        .option-container {
            background: #bdbdbd;
            padding: 20px;
            display: flex;
            flex-direction: column;
            gap: 10px;
            border-radius: 20px;
            box-shadow: 3px 6px 14px -10px rgba(0,0,0,0.9);
        }

    </style>
</head>
<body>
    <h1>Sistema de gestión de estacionamiento</h1>

    <div class="general-container">
        <div class="option-container">
            <p>Opciones generales</p>
            <a href="driverAndVehicleList.jsp" >Lista de todos los conductores con todos sus vehículos</a>
            <a href="vehiclesByDriverIdentification.jsp" >Buscar vehículos de un conductor por cedula</a>

        </div>

        <div class="option-container">
            <p>Opciones para vehículo</p>
            <a href="vehiclesList.jsp" >Lista de todos los vehículos</a>
            <a href="vehicleByLicensePlate.jsp" >Buscar vehículo por placa</a>
            <a href="deleteVehicleByLicensePlate.jsp" >Eliminar un vehículo por placa</a>
            <a href="addVehicle.jsp" >Agregar un vehículo</a>
        </div>


        <div class="option-container">
            <p>Opciones para conductor</p>
            <a href="addDriver.jsp" >Agregar un conductor</a>
        </div>
    </div>

</body>
</html>
