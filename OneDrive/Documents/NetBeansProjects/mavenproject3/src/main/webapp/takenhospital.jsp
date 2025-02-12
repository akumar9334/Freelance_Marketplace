<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Select Hospital</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container">
        <h2>Select Hospital</h2>

        <!-- Hospital Dropdown -->
        <div class="form-group mt-4">
            <label for="hospitalSelect" class="form-label">Select Hospital</label>
            <select id="hospitalSelect" name="hospital_id" class="form-control" required>
                <option value="">Select Hospital</option>
                <!-- Hospitals will be populated dynamically -->
            </select>
        </div>

        <script>
            // On page load, fetch hospitals and populate the dropdown
            $(document).ready(function() {
                $.ajax({
                    url: 'GetHospitalsServlet', // Servlet URL to get the hospitals
                    method: 'GET',
                    dataType: 'json',  // Expect JSON response from the servlet
                    success: function(data) {
                        // Empty the dropdown first
                        $('#hospitalSelect').empty();

                        // Add default option
                        $('#hospitalSelect').append('<option value="">Select Hospital</option>');

                        // Check if hospitals are returned
                        if (data.length > 0) {
                            // Populate dropdown with hospitals
                            $.each(data, function(index, hospital) {
                                $('#hospitalSelect').append('<option value="' + hospital.id + '">' + hospital.name + '</option>');
                            });
                        } else {
                            alert('No hospitals found.');
                        }
                    },
                    error: function(xhr, status, error) {
                        // Handle error if the servlet call fails
                        alert('Error loading hospitals: ' + error);
                    }
                });
            });
        </script>
    </div>
</body>
</html>
