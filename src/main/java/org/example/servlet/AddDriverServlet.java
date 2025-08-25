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

        String name = req.getParameter("name");
        String position = req.getParameter("position");
        String typeOfIdentification = req.getParameter("typeOfIdentification");
        String identificationNumber = req.getParameter("identificationNumber").toUpperCase();

        if(name == null || name.trim().isEmpty()||
                position == null || position.trim().isEmpty()||
                typeOfIdentification == null || typeOfIdentification.trim().isEmpty()||
                identificationNumber == null || identificationNumber.trim().isEmpty()){

            req.setAttribute("messageType", "error");
            req.setAttribute("message", "Todos los campos son obligatorios");

            req.getRequestDispatcher("/addDriver.jsp").forward(req, resp);
            return;
        }

        if(!identificationNumber.matches("^[a-zA-Z0-9]{6,15}$")){
            req.setAttribute("message", "Formato de numero de identificación no valido");
            req.setAttribute("messageType", "error");
            req.getRequestDispatcher("/addDriver.jsp").forward(req, resp);
            return;
        }

        boolean serviceResponse = driverService.addDriver(new Driver("", req.getParameter("name").trim(), req.getParameter("position").trim(), req.getParameter("typeOfIdentification"), req.getParameter("identificationNumber")));
        System.out.println(serviceResponse);

        req.setAttribute("messageType", serviceResponse ? "success" : "error");
        req.setAttribute("message", serviceResponse ? "Conductor agregado exitosamente" : "Este numero de identificación ya existe");

        req.getRequestDispatcher("/addDriver.jsp").forward(req, resp);

        //resp.sendRedirect("addDriver.jsp");
    }
}
