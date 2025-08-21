<%@ page import="org.example.model.Vehicle" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Taller de Spring</title>
</head>
<body>
<h1>Lista de vehículos:</h1>

<!-- Mostrar la lista de vehículos que viene del servlet -->
<div>
    <%
    ArrayList<Vehicle> vehicles = (ArrayList<Vehicle>) request.getAttribute("vehiclesList");
    if(vehicles == null || vehicles.isEmpty()){
        out.println("<p>No hay vehículos registrados</p>");
    } else {
        out.println("<ul>");

        for(Vehicle vehicle: vehicles){
            out.println("<li>");
            out.println("<h4>Placa: "+ vehicle.getLicensePlate() + " </h4>");
            out.println("<p>Cilindraje: "+ vehicle.getCylinderSize() + " </p>");
            out.println("<p>Tipo de combustible: "+ vehicle.getFuelType() + " </p>");
            out.println("<p>Numero de motor: "+ vehicle.getEngineNumber() + " </p>");
            out.println("<p>Marca: "+ vehicle.getBrand() + " </p>");
            out.println("<p>Modelo: "+ vehicle.getModel() + " </p>");
            out.println("<p>ID del conductor: "+ vehicle.getDriverId() + " </p>");


            out.println("</li>");
        }

        out.println("</ul>");
    }

    %>
</div>

</body>
</html>
