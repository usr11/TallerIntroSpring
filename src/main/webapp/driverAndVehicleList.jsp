<%@ page import="org.example.service.DriverService" %>
<%@ page import="org.example.app.AppContext" %>
<%@ page import="org.example.model.Driver" %>
<%@ page import="org.example.model.Vehicle" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Map" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Gestión de vehículos</title>
    <style>
        * {
            background: #d4d4d4;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }

        body {
            padding: 20px;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        h1 {
            margin-bottom: 20px;
            text-align: center;
            background: none;
        }

        a {
            color: darkblue;
            text-decoration: none;
            margin-bottom: 20px;
        }

        .grid-container {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
            gap: 20px;
            width: 100%;
            max-width: 1000px;
        }

        .driver-card {
            background: #bdbdbd;
            padding: 20px;
            border-radius: 20px;
            box-shadow: 3px 6px 14px -10px rgba(0,0,0,0.9);
            display: flex;
            flex-direction: column;
            gap: 10px;
        }

        .driver-card h3 {
            margin: 0 0 10px 0;
        }

        .vehicles-container {
            display: flex;
            flex-direction: column;
            gap: 5px;
        }

        .vehicle-card {
            background: #d0d0d0;
            padding: 10px;
            border-radius: 10px;
            font-size: 14px;
        }

        .vehicle-card em {
            color: #555;
            font-style: italic;
        }

        h3, h4 {
            background: none;
        }
    </style>
</head>
<body>
<h1>Lista de los conductores y sus vehículos</h1>
<a href="./">Volver</a>

<%
    DriverService driverService = AppContext.getInstance().getBean("driverService", DriverService.class);
    Map<Driver, ArrayList<Vehicle>> data = driverService.getDriversWithVehicles();

    out.println("<div class='grid-container'>");

    for (Map.Entry<Driver, ArrayList<Vehicle>> entry : data.entrySet()) {
        Driver driver = entry.getKey();
        ArrayList<Vehicle> vehicles = entry.getValue();

        out.println("<div class='driver-card'>");
        out.println("<h3>Conductor: " + driver.getName() + " - " +driver.getTypeOfIdentification()+": "+driver.getIdentificationNumber()+"</h3>");
        out.println("<h4>Vehículos:</h4>");
        out.println("<div class='vehicles-container'>");

        if (vehicles.isEmpty()) {
            out.println("<div class='vehicle-card'><em>No tiene vehículos asignados</em></div>");
        } else {
            for (Vehicle vehicle : vehicles) {
                out.println("<div class='vehicle-card'>");
                out.println("<strong>Placa:</strong> " + vehicle.getLicensePlate() + "<br>");
                out.println("<strong>Cilindraje:</strong> " + vehicle.getCylinderSize() + "<br>");
                out.println("<strong>Combustible:</strong> " + vehicle.getFuelType() + "<br>");
                out.println("<strong>Motor:</strong> " + vehicle.getEngineNumber() + "<br>");
                out.println("<strong>Marca:</strong> " + vehicle.getBrand() + "<br>");
                out.println("<strong>Modelo:</strong> " + vehicle.getModel() + "<br>");
                out.println("</div>");
            }
        }

        out.println("</div>");
        out.println("</div>");
    }

    out.println("</div>");
%>

</body>
</html>
