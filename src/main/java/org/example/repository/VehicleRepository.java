package org.example.repository;

import org.example.model.Driver;
import org.example.model.Vehicle;
import java.util.UUID;

import java.util.ArrayList;

public class VehicleRepository {


    private ArrayList<Vehicle> vehicles = new ArrayList<>();



    public ArrayList<Vehicle> getVehicles() {
        return vehicles;
    }



    public void addVehicle(Vehicle newVehicle) {

        vehicles.add(newVehicle);

    }

    public boolean existsByLicensePlate(String licensePlate){
        for (Vehicle vehicle: vehicles){
            if(vehicle.getLicensePlate().equals(licensePlate)){
                return true;
            }
        }
        return false;
    }

    public Vehicle getVehicleByLicensePlate(String licensePlate) {

        for (Vehicle vehicle : vehicles) {
            if (vehicle.getLicensePlate().equals(licensePlate)) {
                return vehicle;
            }
        }
        return null;
    }


    public boolean deleteByLicensePlate(String licensePlate) {

        return vehicles.removeIf(vehicle -> vehicle.getLicensePlate().equals(licensePlate));

    }


    public void initRepo(){
        vehicles.add(new Vehicle("V001", "DER142", 5000, "Gasolina", "AS9483048294", "Marcopolo", 2010, "1294759249"));
        vehicles.add(new Vehicle("V002", "KJD583", 3000, "Diesel", "BS2839475612", "Volvo", 2015, "1294759249"));
        vehicles.add(new Vehicle("V003", "PLM927", 7000, "Gasolina", "CS9384756210", "Mercedes-Benz", 2012, "1294759249"));
        vehicles.add(new Vehicle("V004", "TRX314", 2000, "Electrico", "DS2847593847", "Tesla", 2020, "3418763908"));
        vehicles.add(new Vehicle("V005", "HJK728", 3000, "Gasolina", "ES1029384756", "BMW", 2018, "3418763908"));
        vehicles.add(new Vehicle("V006", "BNM645", 2500, "Gasolina", "FS9182736450", "Toyota", 2011, "3418763908"));
        vehicles.add(new Vehicle("V007", "QWE852", 8000, "Diesel", "GS8374659201", "Kenworth", 2019, "9472630969"));
        vehicles.add(new Vehicle("V008", "ZXC139", 9000, "Diesel", "HS2938475619", "Mack", 2013, "9472630969"));
        vehicles.add(new Vehicle("V009", "RTY476", 9000, "Diesel", "IS5647382910", "International", 2016, "9472630969"));
    }

}
