package com.entity;

public class Hospital {
    private int id;  // Database column: id
    private String hospitalName;  // Database column: hospital_name
    
    // Default constructor
    public Hospital() {}

    // Parameterized constructor
    public Hospital(int id, String hospitalName) {
        this.id = id;
        this.hospitalName = hospitalName;
    }

    // Getter for id
    public int getId() {
        return id;
    }

    // Setter for id
    public void setId(int id) {
        this.id = id;
    }

    // Getter for hospitalName
    public String getHospitalName() {
        return hospitalName;
    }

    // Setter for hospitalName
    public void setHospitalName(String hospitalName) {
        this.hospitalName = hospitalName;
    }
}
