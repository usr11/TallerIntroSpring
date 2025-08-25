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
        }

        a {
            color: darkblue;
            text-decoration: none;
            margin-bottom: 20px;
        }

        form {
            display: flex;
            flex-direction: column;
            gap: 15px;
            background: #bdbdbd;
            padding: 20px;
            border-radius: 20px;
            box-shadow: 3px 6px 14px -10px rgba(0,0,0,0.9);
            width: 100%;
            max-width: 500px;
        }

        input, button {
            padding: 10px;
            border-radius: 10px;
            border: 1px solid #999;
            font-size: 16px;
        }

        button {
            background-color: darkblue;
            color: white;
            border: none;
            cursor: pointer;
            font-weight: bold;
            transition: background 0.3s;
        }

        button:hover {
            background-color: #003366;
        }

    </style>
</head>
<body>
    <h1>Vehículos de un conductor por su identificación</h1>
    <a href="./">Volver</a>
    <form>
        <input name="driverId" placeholder="Numero de identificación">
        <button>Buscar</button>
    </form>

    <%

        String driverId = (String) request.getParameter("driverId");

        if(driverId != null && !driverId.trim().isEmpty()){
            VehicleService vehicleService = AppContext.getInstance().getBean("vehicleService", VehicleService.class);

            ArrayList<Vehicle> vehicles = vehicleService.getVehiclesByDriverIdentification(driverId);

            if (!vehicles.isEmpty()){
                out.println("<h4>Vehiculos:</h4>");
                for (Vehicle vehicle: vehicles){
                    out.println("<p>"+vehicle.getLicensePlate()+"</p>");
                }
            } else {
                out.println("<h4>No hay vehículos asignados a el numero de identificación: "+driverId+"</h4>");
            }


        }



    %>

</body>
</html>
