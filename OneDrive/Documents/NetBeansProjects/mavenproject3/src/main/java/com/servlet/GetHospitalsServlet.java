package com.servlet;

import com.dao.HospitalDao;
import com.entity.Hospital;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONArray;
import org.json.JSONObject;

@WebServlet("/GetHospitalsServlet") // Annotation for mapping the servlet to a URL pattern
public class GetHospitalsServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        // Create an instance of HospitalDao
        HospitalDao hospitalDao = new HospitalDao();

        // Get the list of hospitals from the database
        List<Hospital> hospitals = hospitalDao.getAllHospitals();

        // Convert the list of hospitals to JSON format
        JSONArray jsonArray = new JSONArray();
        for (Hospital hospital : hospitals) {
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("id", hospital.getId());
            jsonObject.put("name", hospital.getHospitalName());
            jsonArray.put(jsonObject);
        }

        // Send the JSON response
        PrintWriter out = response.getWriter();
        out.print(jsonArray.toString());
        out.flush();
    }
}
