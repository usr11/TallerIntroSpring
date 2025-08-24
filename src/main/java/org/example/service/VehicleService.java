package org.example.service;

import org.example.model.Vehicle;
import org.example.repository.DriverRepository;
import org.example.repository.VehicleRepository;

import java.util.ArrayList;

public class VehicleService {

    private VehicleRepository vehicleRepository;
    private DriverRepository driverRepository;

    public VehicleService(VehicleRepository vehicleRepository, DriverRepository driverRepository) {
        this.vehicleRepository = vehicleRepository;
        this.driverRepository = driverRepository;
    }

    public ArrayList<Vehicle> getVehicles() {
        return vehicleRepository.getVehicles();
    }

    public boolean addVehicle(Vehicle vehicle) {

        //Validaciones
        //Validación de placa
        if (vehicle.getLicensePlate() == null || vehicle.getLicensePlate().length() < 6) {
            return false;
        }
        //Validación de cilindraje
        if (vehicle.getCylinderSize() <= 0) {
            return false;
        }

        return vehicleRepository.addVehicle(vehicle);
    }

    public Vehicle getVehicleByLicensePlate(String licensePlate) {
        return vehicleRepository.getVehicleByLicensePlate(licensePlate);
    }

    public boolean deleteVehicleByLicensePlate(String licensePlate){

        return vehicleRepository.deleteVehicleByLicensePlate(licensePlate);

    }
}
