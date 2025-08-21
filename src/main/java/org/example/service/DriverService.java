package org.example.service;

import org.example.repository.DriverRepository;
import org.example.repository.VehicleRepository;

public class DriverService {

    private VehicleRepository vehicleRepository;
    private DriverRepository driverRepository;

    public DriverService(VehicleRepository vehicleRepository, DriverRepository driverRepository) {
        this.vehicleRepository = vehicleRepository;
        this.driverRepository = driverRepository;
    }
}
