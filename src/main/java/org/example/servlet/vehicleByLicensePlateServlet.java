package org.example.servlet;

import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.app.AppContext;
import org.example.model.Vehicle;
import org.example.repository.VehicleRepository;
import org.example.service.VehicleService;

import java.io.IOException;

@WebServlet("/vehicleByLicensePlate")
public class vehicleByLicensePlateServlet extends HttpServlet {

    private VehicleService vehicleService;

    @Override
    public void init(ServletConfig config) throws ServletException {
        vehicleService = AppContext.getInstance().getBean("vehicleService", VehicleService.class);

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String licensePlate = req.getParameter("licensePlate");

        if(licensePlate != null && !licensePlate.trim().isEmpty()){
            Vehicle vehicle = vehicleService.getVehicleByLicensePlate(licensePlate.trim());
            //System.out.println(vehicle.getLicensePlate());

            if(vehicle == null){
                req.setAttribute("message", "Vehículo no encontrado");
                req.setAttribute("messageType", "error");
            } else {
                req.setAttribute("vehicle", vehicle);
            }

        }

        req.getRequestDispatcher("/vehicleByLicensePlate.jsp").forward(req, resp);

    }
}
