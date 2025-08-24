package org.example.repository;

import org.example.model.Driver;
import org.example.model.Vehicle;
import java.util.UUID;

import java.util.ArrayList;

public class VehicleRepository {

    //IMPORTANTE !!!!!!!!!!!!!!!!!!!!
    //Mejorar el acceso a la lista de vehículos
    private ArrayList<Vehicle> vehicles = new ArrayList<>();

    //Obtener todos los vehículos
    public ArrayList<Vehicle> getVehicles() {
        return vehicles;
    }


    //Obtener vehículo por placa
    public Vehicle getVehicleByLicensePlate(String licensePlate) {

        for (Vehicle vehicle : vehicles) {
            if (vehicle.getLicensePlate().equals(licensePlate)) {
                return vehicle;
            }
        }
        return null;
    }


    //Ver si es agregar vehiculo nuevo o si el vehiculo ya existe y no tiene conductor agregarlo
    public boolean addVehicle(Vehicle newVehicle) {
        newVehicle.setId(UUID.randomUUID().toString());
        for (Vehicle vehicle : vehicles) {
            //Validaciónes por ID o placa igual
            if (vehicle.equals(newVehicle) || vehicle.getLicensePlate().equals(newVehicle.getLicensePlate())) {
                return false;
            }
        }
        vehicles.add(newVehicle);
        return true;
    }

    //Eliminar vehículo por placa
    public boolean deleteVehicleByLicensePlate(String licensePlate) {
        for (Vehicle vehicle : vehicles) {
            if (vehicle.getLicensePlate().equals(licensePlate)) {
                vehicles.remove(vehicle);
                return true;
            }
        }
        return false;
    }

    public void initRepo(){
        vehicles.add(new Vehicle("V001", "DER142", 5000, "Gasoline", "AS9483048294", "Marcopolo", 2010, "A001"));
        vehicles.add(new Vehicle("V002", "KJD583", 3000, "Diesel", "BS2839475612", "Volvo", 2015, "A001"));
        vehicles.add(new Vehicle("V003", "PLM927", 7000, "Gasoline", "CS9384756210", "Mercedes-Benz", 2012, "A001"));
        vehicles.add(new Vehicle("V004", "TRX314", 2000, "Electric", "DS2847593847", "Tesla", 2020, "A002"));
        vehicles.add(new Vehicle("V005", "HJK728", 3000, "Gasoline", "ES1029384756", "BMW", 2018, "A002"));
        vehicles.add(new Vehicle("V006", "BNM645", 2500, "Gasoline", "FS9182736450", "Toyota", 2011, "A002"));
        vehicles.add(new Vehicle("V007", "QWE852", 8000, "Diesel", "GS8374659201", "Kenworth", 2019, "A003"));
        vehicles.add(new Vehicle("V008", "ZXC139", 9000, "Diesel", "HS2938475619", "Mack", 2013, "A003"));
        vehicles.add(new Vehicle("V009", "RTY476", 9000, "Diesel", "IS5647382910", "International", 2016, "A003"));
    }

}
