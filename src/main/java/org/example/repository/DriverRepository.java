package org.example.repository;

import org.example.model.Driver;
import org.example.model.Vehicle;

import java.util.ArrayList;
import java.util.UUID;

public class DriverRepository {


    private ArrayList<Driver> drivers = new ArrayList<>();



    public ArrayList<Driver> getDrivers() {
        return drivers;
    }

    public void addDriver(Driver newDriver) {
        drivers.add(newDriver);
    }

    public boolean existsByIdentificationNumber(String identificationNumber){
        for (Driver driver:drivers){
            if(driver.getIdentificationNumber().equals(identificationNumber)){
                return true;
            }
        }
        return false;
    }


    public void initRepo(){
        drivers.add(new Driver("1294759249", "Pablo", "Bus Driver", "CC", "1108559693"));
        drivers.add(new Driver("3418763908", "Miguel", "Personal Driver", "CC", "1228351693"));
        drivers.add(new Driver("9472630969", "Carlos", "Tow Truck Driver", "CC", "4118529293"));
    }

}
