package org.example.servlet;

import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.app.AppContext;
import org.example.model.Driver;
import org.example.service.DriverService;

import java.io.IOException;

@WebServlet("/addDriver")
public class AddDriverServlet extends HttpServlet {

    private DriverService driverService;

    @Override
    public void init(ServletConfig config) throws ServletException {
        driverService = AppContext.getInstance().getBean("driverService", DriverService.class);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        boolean serviceResponse = driverService.addDriver(new Driver("", req.getParameter("name").trim(), req.getParameter("position").trim(), req.getParameter("typeOfIdentification"), req.getParameter("identificationNumber")));
        System.out.println(serviceResponse);

        req.setAttribute("messageType", serviceResponse ? "success" : "error");
        req.setAttribute("message", serviceResponse ? "Conductor agregado exitosamente" : "Error al agregar conductor");

        req.getRequestDispatcher("/addDriver.jsp").forward(req, resp);

        //resp.sendRedirect("addDriver.jsp");
    }
}
