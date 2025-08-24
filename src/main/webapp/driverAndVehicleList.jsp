<%@ page import="org.example.service.DriverService" %>
<%@ page import="org.example.app.AppContext" %>
<%@ page import="org.example.model.Driver" %>
<%@ page import="org.example.model.Vehicle" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Map" %><%--
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

    Map<Driver, ArrayList<Vehicle>> data = driverService.getDriversWithVehicles();

    out.println("<ul>");
    for (Map.Entry<Driver, ArrayList<Vehicle>> entry : data.entrySet()) {
        Driver driver = entry.getKey();
        ArrayList<Vehicle> vehicles = entry.getValue();

        out.println("<li><h4>" + driver.getName() + "</h4></li>");

        if (vehicles.isEmpty()) {
            out.println("<p><em>No tiene vehículos asignados</em></p>");
        } else {
            for (Vehicle vehicle : vehicles) {
                out.println("<p>Vehiculo: " + vehicle.getLicensePlate() + "</p>");
            }
        }
    }
    out.println("</ul>");

%>
</body>
</html>
