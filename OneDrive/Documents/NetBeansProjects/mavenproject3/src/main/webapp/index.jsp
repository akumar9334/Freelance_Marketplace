<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Country, State, City Selection</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
    <div class="container">
        <h3>Select Country, State, and City</h3>
        
        <div class="form-group">
            <select class="form-select country" id="countrySelect" onchange="loadStates()">
                <option selected>Select Country</option>
            </select>
        </div>
        <div class="form-group">
            <select class="form-select state" id="stateSelect" onchange="loadCities()" disabled>
                <option selected>Select State</option>
            </select>
        </div>
        <div class="form-group">
            <select class="form-select city" id="citySelect" disabled>
                <option selected>Select City</option>
            </select>
        </div>
        <a href="takenhospital.jsp">gotohospital</a>
    </div>

    <script>
        // Load countries on page load
        $(document).ready(function() {
            loadCountries();
        });

        // Function to load countries from servlet
        function loadCountries() {
            $.get("CountryStateCityServlet", { type: "countries" }, function(data) {
                if (data && !data.error) {
                    var countrySelect = $("#countrySelect");
                    countrySelect.empty();
                    countrySelect.append('<option selected>Select Country</option>');
                    $.each(data, function(index, country) {
                        countrySelect.append('<option value="' + country.iso2 + '">' + country.name + '</option>');
                    });
                }
            }).fail(function() {
                alert('Error loading countries');
            });
        }

        // Function to load states based on selected country
        function loadStates() {
            var countryCode = $("#countrySelect").val();
            if (countryCode) {
                $.get("CountryStateCityServlet", { type: "states", code: countryCode }, function(data) {
                    var stateSelect = $("#stateSelect");
                    stateSelect.empty();
                    stateSelect.append('<option selected>Select State</option>');
                    $.each(data, function(index, state) {
                        stateSelect.append('<option value="' + state.iso2 + '">' + state.name + '</option>');
                    });
                    stateSelect.prop('disabled', false);
                }).fail(function() {
                    alert('Error loading states');
                });
            }
        }

        // Function to load cities based on selected state
        function loadCities() {
            var countryCode = $("#countrySelect").val();
            var stateCode = $("#stateSelect").val();
            if (stateCode) {
                $.get("CountryStateCityServlet", { type: "cities", countryCode: countryCode, code: stateCode }, function(data) {
                    var citySelect = $("#citySelect");
                    citySelect.empty();
                    citySelect.append('<option selected>Select City</option>');
                    $.each(data, function(index, city) {
                        citySelect.append('<option value="' + city.iso2 + '">' + city.name + '</option>');
                    });
                    citySelect.prop('disabled', false);
                }).fail(function() {
                    alert('Error loading cities');
                });
            }
        }
    </script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>
