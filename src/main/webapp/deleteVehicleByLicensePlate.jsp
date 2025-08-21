<%--
  Created by IntelliJ IDEA.
  User: 1108559698
  Date: 20/08/2025
  Time: 11:05 a. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Borrar vehículo con la placa</title>
</head>
<body>

<form method="POST" action="deleteVehicleByLicensePlate">
    <input type="text" name="licensePlate" placeholder="Placa" required>
    <button>Buscar</button>
</form>

</body>
</html>
