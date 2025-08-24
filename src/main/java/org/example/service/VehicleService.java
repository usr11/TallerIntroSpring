package org.example.service;


import org.example.model.Vehicle;
import org.example.repository.DriverRepository;
import org.example.repository.VehicleRepository;

import java.util.ArrayList;
import java.util.UUID;

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

    public boolean addVehicle(Vehicle newVehicle) {

        newVehicle.setId(UUID.randomUUID().toString());

        if(!vehicleRepository.existsByLicensePlate(newVehicle.getLicensePlate())){
            vehicleRepository.addVehicle(newVehicle);
            return true;
        }
        return false;


    }

    public Vehicle getVehicleByLicensePlate(String licensePlate) {
        return vehicleRepository.getVehicleByLicensePlate(licensePlate);
    }

    public boolean deleteVehicleByLicensePlate(String licensePlate){

        return vehicleRepository.deleteByLicensePlate(licensePlate);

    }

    public ArrayList<Vehicle> getVehiclesByDriverIdentification(String driverIdentification){

        ArrayList<Vehicle> result = new ArrayList<>();

        for(Vehicle vehicle: vehicleRepository.getVehicles()){
            if (vehicle.getDriverId().equals(driverIdentification)){
                result.add(vehicle);
            }
        }
        return result;

    }

}
