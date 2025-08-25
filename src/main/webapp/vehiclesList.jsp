<%@ page import="org.example.model.Vehicle" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="org.example.service.VehicleService" %>
<%@ page import="org.example.app.AppContext" %>
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
        }

        a {
            color: darkblue;
            text-decoration: none;
            margin-bottom: 20px;
        }

        ul {
            list-style-type: none;
            padding: 0;
            width: 100%;
            max-width: 1000px;
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
            gap: 20px;
        }

        li {
            background: #bdbdbd;
            padding: 20px;
            border-radius: 20px;
            box-shadow: 3px 6px 14px -10px rgba(0,0,0,0.9);
            display: flex;
            flex-direction: column;
            gap: 8px;
        }

        li h4 {
            margin: 0 0 5px 0;
        }

        li p {
            margin: 0;
            font-size: 16px;
        }

        p, h4 {
            background: none;
        }

        strong{
            background: none;
        }

    </style>
</head>
<body>
<h1>Lista de vehículos</h1>
<a href="./">Volver</a>
<div>
    <%
        VehicleService vehicleService = AppContext.getInstance().getBean("vehicleService", VehicleService.class);
        ArrayList<Vehicle> vehicles = vehicleService.getVehicles();
        if(vehicles == null || vehicles.isEmpty()){
            out.println("<p>No hay vehículos registrados</p>");
        } else {
            out.println("<ul>");

            for(Vehicle vehicle: vehicles){
                out.println("<li>");
                out.println("<h4>Placa: "+ vehicle.getLicensePlate() + " </h4>");
                out.println("<strong><p>Cilindraje:</strong> "+ vehicle.getCylinderSize() + " </p>");
                out.println("<strong><p>Tipo de combustible:</strong> "+ vehicle.getFuelType() + " </p>");
                out.println("<strong><p>Numero de motor:</strong> "+ vehicle.getEngineNumber() + " </p>");
                out.println("<strong><p>Marca:</strong> "+ vehicle.getBrand() + " </p>");
                out.println("<strong><p>Modelo:</strong> "+ vehicle.getModel() + " </p>");

                out.println("</li>");
            }

            out.println("</ul>");
        }

    %>
</div>
</body>
</html>
