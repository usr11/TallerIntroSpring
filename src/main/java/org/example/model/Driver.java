package org.example.model;

public class Driver {

    private String id;
    private String name;
    private String position;
    private String typeOfIdentification;
    private String identificationNumber;

    public Driver() {
    }

    public Driver(String id, String name, String position, String typeOfIdentification, String identificationNumber) {
        this.id = id;
        this.name = name;
        this.position = position;
        this.typeOfIdentification = typeOfIdentification;
        this.identificationNumber = identificationNumber;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public String getTypeOfIdentification() {
        return typeOfIdentification;
    }

    public void setTypeOfIdentification(String typeOfIdentification) {
        this.typeOfIdentification = typeOfIdentification;
    }

    public String getIdentificationNumber() {
        return identificationNumber;
    }

    public void setIdentificationNumber(String identificationNumber) {
        this.identificationNumber = identificationNumber;
    }

    @Override
    public boolean equals(Object obj) {
        if (obj instanceof Driver){
            Driver vehicle = (Driver) obj;
            return id.equals(vehicle.getId());
        }
        return false;
    }
}
