<%@ page import="org.example.app.AppContext" %>
<%@ page import="org.example.service.VehicleService" %>
<%@ page import="org.example.service.DriverService" %>
<%@ page import="org.example.model.Driver" %><%--
  Created by IntelliJ IDEA.
  User: 1108559698
  Date: 20/08/2025
  Time: 9:35 a. m.
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

        input, button, select {
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
  <h1>Formulario para agregar vehículo</h1>
  <a href="./">Volver</a>
  <form method="POST" action="addVehicle">
    <input type="text" placeholder="Placa" name="licensePlate" required>
    <input type="number" placeholder="Cilindraje" name="cylinderSize" min="1000" max="10000" required>

    <select name="fuelType" required>
        <option value="" disabled selected>Seleccione una opción</option>
        <option value="Gasolina">Gasolina</option>
        <option value="Diesel">Diesel</option>
        <option value="Electrico">Electrico</option>
        <option value="Hibrido">Hibrido</option>
        <option value="Gas">Gas</option>
    </select>
    <input type="text" placeholder="Número de motor" name="engineNumber" required>
    <input type="text" placeholder="Marca" name="brand" required>
    <input type="number" placeholder="Modelo" name="model" min="1900" max="2030" required>

    <%

      DriverService driverService =  AppContext.getInstance().getBean("driverService", DriverService.class);

      out.println("<select name='driverId' required>");
      out.println("<option value='' disabled selected>Seleccione una opción</option>");
      for(Driver driver : driverService.getDrivers()){
        out.println("<option value='" + driver.getId() + "'>" + driver.getName() + "</option>");
      }
      out.println("</select><br><br>");

    %>


    <button type="submit">Agregar vehículo</button>
  </form>

  <%

    String message = (String) request.getAttribute("message");
    String messageType = (String) request.getAttribute("messageType");
    if(message != null){

      if(messageType.equals("error")){
        out.println("<div style='color:red'>"+message+"</div>");
      } else {
        out.println("<div style='color:green'>"+message+"</div>");
      }

    }
  %>

</body>
</html>
