package org.example.model;

public class Vehicle {

    private String id;
    private String licensePlate;
    private int cylinderSize;
    private String fuelType;
    private String engineNumber;
    private String brand;
    private int model;

    private String driverId;

    public Vehicle() {}

    public Vehicle(String id, String licensePlate, int cylinderSize, String fuelType, String engineNumber, String brand, int model, String driverId) {
        this.id = id;
        this.licensePlate = licensePlate;
        this.cylinderSize = cylinderSize;
        this.fuelType = fuelType;
        this.engineNumber = engineNumber;
        this.brand = brand;
        this.model = model;
        this.driverId = driverId;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getLicensePlate() {
        return licensePlate;
    }

    public void setLicensePlate(String licensePlate) {
        this.licensePlate = licensePlate;
    }

    public int getCylinderSize() {
        return cylinderSize;
    }

    public void setCylinderSize(int cylinderSize) {
        this.cylinderSize = cylinderSize;
    }

    public String getFuelType() {
        return fuelType;
    }

    public void setFuelType(String fuelType) {
        this.fuelType = fuelType;
    }

    public String getEngineNumber() {
        return engineNumber;
    }

    public void setEngineNumber(String engineNumber) {
        this.engineNumber = engineNumber;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public int getModel() {
        return model;
    }

    public void setModel(int model) {
        this.model = model;
    }

    public String getDriverId() {
        return driverId;
    }

    public void setDriverId(String driverId) {
        this.driverId = driverId;
    }


    @Override
    public boolean equals(Object obj) {
        if(obj instanceof Vehicle){
            Vehicle vehicle = (Vehicle) obj;
            return id.equals(vehicle.getId());
        } else {
            return false;
        }
    }

}
