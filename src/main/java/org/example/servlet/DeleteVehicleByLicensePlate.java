package org.example.servlet;

import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import org.example.app.AppContext;
import org.example.service.VehicleService;

@WebServlet("/deleteVehicleByLicensePlate")
public class DeleteVehicleByLicensePlate extends HttpServlet {

    private VehicleService vehicleService;

    @Override
    public void init(ServletConfig config) throws ServletException {
        vehicleService = AppContext.getInstance().getBean("vehicleService", VehicleService.class);
    }
}
