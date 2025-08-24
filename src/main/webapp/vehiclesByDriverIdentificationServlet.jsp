<%@ page import="org.example.service.VehicleService" %>
<%@ page import="org.example.app.AppContext" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="org.example.model.Vehicle" %><%--
  Created by IntelliJ IDEA.
  User: 1108559698
  Date: 24/08/2025
  Time: 11:05 a. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Vehículos de un conductor por su identificación</title>
</head>
<body>
    <h1>Vehículos de un conductor por su identificación</h1>
    <form>
        <input name="driverId" placeholder="Numero de identificación">
        <button>Buscar</button>
    </form>

    <%

        //HACER LA VALIDACIÓN O NO DE QUE EL CONDUCTOR EXISTE
        String driverId = (String) request.getParameter("driverId");

        if(driverId != null && !driverId.trim().isEmpty()){
            VehicleService vehicleService = AppContext.getInstance().getBean("vehicleService", VehicleService.class);

            boolean hasVehicles = false;
            for (Vehicle vehicle: vehicleService.getVehicles()){
                if(vehicle.getDriverId().equals(driverId)){
                    out.println("<p>Vehiculo: "+vehicle.getLicensePlate()+"</p>");
                    hasVehicles = true;
                }
            }
            if(!hasVehicles){
                out.println("<h4>No tiene vehículos</h4>");
            }

        }



    %>


</body>
</html>
