<%@ page import="org.example.service.DriverService" %>
<%@ page import="org.example.app.AppContext" %>
<%@ page import="org.example.service.VehicleService" %>
<%@ page import="org.example.model.Driver" %>
<%@ page import="org.example.model.Vehicle" %><%--
  Created by IntelliJ IDEA.
  User: 1108559698
  Date: 21/08/2025
  Time: 11:47 a. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Lista de los conductores y sus vehículos</title>
</head>
<body>
    <h1>Lista de los conductores y sus vehículos:</h1>

<%
    DriverService driverService =  AppContext.getInstance().getBean("driverService", DriverService.class);
    VehicleService vehicleService =  AppContext.getInstance().getBean("vehicleService", VehicleService.class);

    boolean hasVehicles = false;
    out.println("<ul>");
    for(Driver driver: driverService.getDrivers()){
        out.println("<li><h4>"+ driver.getName()+"<h4></li>");

        for(Vehicle vehicle: vehicleService.getVehicles()){
            if (vehicle.getDriverId().equals(driver.getId())){
                out.println("<p>Vehiculo:"+ vehicle.getLicensePlate()+"<p>");
                hasVehicles = true;
            }
        }
        if (!hasVehicles) {
            out.println("<p><em>No tiene vehículos asignados</em></p>");
        }
    }
    out.println("</ul>");

%>
</body>
</html>
