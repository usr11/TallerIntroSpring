package org.example.servlet;

import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.app.AppContext;
import org.example.service.VehicleService;

import java.io.IOException;

@WebServlet("/deleteVehicleByLicensePlate")
public class DeleteVehicleByLicensePlate extends HttpServlet {

    private VehicleService vehicleService;

    @Override
    public void init(ServletConfig config) throws ServletException {
        vehicleService = AppContext.getInstance().getBean("vehicleService", VehicleService.class);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        boolean serviceResponse = vehicleService.deleteVehicleByLicensePlate(req.getParameter("licensePlate"));
        System.out.println(serviceResponse);

        req.setAttribute("messageType", serviceResponse ? "success" : "error");
        req.setAttribute("message", serviceResponse ? "Vehículo borrado exitosamente" : "No se pudo eliminar el vehículo");

        req.getRequestDispatcher("/deleteVehicleByLicensePlate.jsp").forward(req, resp);


    }
}


