package org.example.repository;

import org.example.model.Driver;

import java.util.ArrayList;
import java.util.UUID;

public class DriverRepository {


    //IMPORTANTE !!!!!!!!!!!!!!!!!!!!
    //Mejorar el acceso a la lista de drivers
    private ArrayList<Driver> drivers = new ArrayList<>();

    //Obtener todos los conductores
    public ArrayList<Driver> getDrivers() {
        return drivers;
    }

    //Agregar un conductor
    public boolean addDriver(Driver newDriver) {
        newDriver.setId(UUID.randomUUID().toString());
        for(Driver driver: drivers){
            if(driver.equals(newDriver)||driver.getIdentificationNumber().equals(newDriver.getIdentificationNumber())){
                return false;
            }
        }
        drivers.add(newDriver);
        return true;
    }


    //PREGUNTAR SI MANEJO TRAER PRIMERO A EL CONDUCTOR Y POR APARTE A SUS VEHÍCULOS
    //DIRECTAMENTE DE LOS SERVICE
    //EN SERVICE TRAER TODOS LOS VEHÍCULOS Y RECORRER TODA LA LISTA DE VEHÍCULOS QUE COINCIDAN CON EL Id del conductor y guardarlos 1 a 1
    public Driver getDriverById (String id) {
        for (Driver driver : drivers) {
            if (driver.getId().equals(id)) {
                return driver;
            }
        }
        return null;
    }

    public void initRepo(){
        drivers.add(new Driver("A001", "Pablo", "Bus Driver", "CC", "1108559693"));
        drivers.add(new Driver("A002", "Miguel", "Personal Driver", "CC", "1228351693"));
        drivers.add(new Driver("A003", "Carlos", "Tow Truck Driver", "CC", "4118529293"));
    }

}
