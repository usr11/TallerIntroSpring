package org.example.service;

import org.example.model.Driver;
import org.example.model.Vehicle;
import org.example.repository.DriverRepository;
import org.example.repository.VehicleRepository;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

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

    public boolean addDriver(Driver newDriver){

        newDriver.setId(UUID.randomUUID().toString());

        if(!driverRepository.existsByIdentificationNumber(newDriver.getIdentificationNumber())){
            driverRepository.addDriver(newDriver);
            return true;
        }
        return false;


    }

    public Map<Driver, ArrayList<Vehicle>> getDriversWithVehicles() {
        Map<Driver, ArrayList<Vehicle>> result = new HashMap<>();
        ArrayList<Driver> drivers = driverRepository.getDrivers();
        ArrayList<Vehicle> vehicles = vehicleRepository.getVehicles();

        for (Driver driver : drivers) {
            ArrayList<Vehicle> driverVehicles = new ArrayList<>();
            for (Vehicle vehicle : vehicles) {
                if (vehicle.getDriverId().equals(driver.getId())) {
                    driverVehicles.add(vehicle);
                }
            }
            result.put(driver, driverVehicles);
        }
        return result;
    }
}
