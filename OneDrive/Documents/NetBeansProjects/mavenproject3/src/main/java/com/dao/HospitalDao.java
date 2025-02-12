package com.dao;

import com.Db.DbConnect;
import com.entity.Hospital;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class HospitalDao {

    // Method to get all hospitals from the database
    public List<Hospital> getAllHospitals() {
        List<Hospital> hospitals = new ArrayList<>();
        String sql = "SELECT * FROM hospital";  // Replace with the actual table name and column names
        
        try (Connection conn = DbConnect.getConn();  // Use the connection from DbConnect
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            // Process the result set and populate the hospitals list
            while (rs.next()) {
                Hospital hospital = new Hospital();
                hospital.setId(rs.getInt("id"));  // Get the hospital ID from the result set
                hospital.setHospitalName(rs.getString("hospital_name"));  // Get the hospital name
                hospitals.add(hospital);
            }

        } catch (SQLException e) {
            e.printStackTrace();  // Handle exceptions properly
        }

        return hospitals;
    }
}
