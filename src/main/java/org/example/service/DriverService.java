package org.example.service;

import org.example.model.Driver;
import org.example.repository.DriverRepository;
import org.example.repository.VehicleRepository;

import java.util.ArrayList;

public class DriverService {

    private VehicleRepository vehicleRepository;
    private DriverRepository driverRepository;

    public DriverService(VehicleRepository vehicleRepository, DriverRepository driverRepository) {
        this.vehicleRepository = vehicleRepository;
        this.driverRepository = driverRepository;
    }

    public ArrayList<Driver> getDrivers(){
        return driverRepository.getDrivers();
    }
}
