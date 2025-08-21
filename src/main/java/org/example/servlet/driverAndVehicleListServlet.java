package org.example.servlet;

import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.app.AppContext;
import org.example.service.DriverService;
import org.example.service.VehicleService;

import java.io.IOException;

@WebServlet("/driverAndVehicleList")
public class driverAndVehicleListServlet extends HttpServlet {

    private VehicleService vehicleService;
    private DriverService driverService;

    @Override
    public void init(ServletConfig config) throws ServletException {
        vehicleService = AppContext.getInstance().getBean("vehicleService", VehicleService.class);
        driverService = AppContext.getInstance().getBean("driverService", DriverService.class);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.setAttribute("driverService", driverService);
        req.setAttribute("vehicleService", vehicleService);

        req.getRequestDispatcher("/driverAndVehicleList.jsp").forward(req, resp);
    }
}
