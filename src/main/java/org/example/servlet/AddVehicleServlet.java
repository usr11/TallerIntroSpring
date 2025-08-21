package org.example.servlet;

import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.app.AppContext;
import org.example.model.Vehicle;
import org.example.service.VehicleService;

import java.io.IOException;

@WebServlet("/addVehicle")
public class AddVehicleServlet extends HttpServlet {

    private VehicleService vehicleService;

    @Override
    public void init(ServletConfig config) throws ServletException {
        vehicleService = AppContext.getInstance().getBean("vehicleService", VehicleService.class);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/addVehicle.jsp").forward(req, resp); // o la ruta correcta de tu JSP
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String licensePlate = req.getParameter("licensePlate");
        String cylinderSizeStr = req.getParameter("cylinderSize");
        String fuelType = req.getParameter("fuelType");
        String engineNumber = req.getParameter("engineNumber");
        String brand = req.getParameter("brand");
        String modelStr = req.getParameter("model");

        if (licensePlate == null || licensePlate.trim().isEmpty() ||
                cylinderSizeStr == null || cylinderSizeStr.trim().isEmpty() ||
                fuelType == null || fuelType.trim().isEmpty() ||
                engineNumber == null || engineNumber.trim().isEmpty() ||
                brand == null || brand.trim().isEmpty() ||
                modelStr == null || modelStr.trim().isEmpty()) {

            req.setAttribute("message", "Todos los campos son obligatorios");
            req.setAttribute("messageType", "error");
            doGet(req, resp);
            return;
        }

        int cylinderSize;
        int model;
        try {
            cylinderSize = Integer.parseInt(cylinderSizeStr.trim());
            model = Integer.parseInt(modelStr.trim());
        } catch (NumberFormatException e) {
            req.setAttribute("message", "Cilindraje y Modelo deben ser números válidos");
            req.setAttribute("messageType", "error");
            doGet(req, resp);
            return;
        }


        boolean response = vehicleService.addVehicle(new Vehicle(null, licensePlate.trim(), cylinderSize, fuelType.trim(), engineNumber.trim(), brand.trim(), model, "a"));

        if(response){
            req.setAttribute("message", "Vehículo agregado exitosamente");
            req.setAttribute("messageType", "success");
        } else {
            req.setAttribute("message", "El vehículo ya existe o no se pudo registrar");
            req.setAttribute("messageType", "error");
        }


        //resp.sendRedirect("vehicles");
        doGet(req, resp);
    }
}
