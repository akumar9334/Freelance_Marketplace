package test.controllers;

import jakarta.servlet.http.HttpSession;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import test.beans.Company;
import test.dao.ProjectDao;
import test.exceptions.DatabaseException;

@Controller
public class CompanyController {

    @Autowired
    private ProjectDao pd;

    // Mapping for login page (GET)
    @RequestMapping("/loginCompany")
    public String loginPage() {
        System.out.println("Reached loginCompany page");
        return "loginCompany"; // Return the login page (JSP)
    }

    // Mapping for registration page (GET)
    @RequestMapping("/registerCompany")
    public String registerPage() {
        System.out.println("Reached registerCompany page");
        return "registerCompany"; // Return the registration page (JSP)
    }

    // Registration method (POST)
   @RequestMapping(value = "/registerCompany", method = RequestMethod.POST)
public String registerCompanyData(
        @ModelAttribute("c1") Company c1,
        @RequestParam("filename") MultipartFile file,
        Model model
) {
    System.out.println("Company registration data: " + c1);

    try {
        // Validate password match
        if (!c1.getPassword().equals(c1.getConfirmpassword())) {
            model.addAttribute("errorMsg", "Passwords do not match!");
            return "registerCompany"; // Stay on the registration page
        }

        // File upload logic
        if (!file.isEmpty()) {
            String fileName = file.getOriginalFilename();
            String uploadDir = "C:\\Users\\kumar\\OneDrive\\Documents\\NetBeansProjects\\com.mycompany_mavenproject1_war_1.0-SNAPSHOT_2\\src\\main\\webapp\\files\\webimages";

            // Ensure the directory exists
            File dir = new File(uploadDir);
            if (!dir.exists()) {
                dir.mkdirs();
            }

            // Save the file
            File uploadFile = new File(dir, fileName);
            try (BufferedOutputStream outputStream = new BufferedOutputStream(new FileOutputStream(uploadFile))) {
                outputStream.write(file.getBytes());
            }

            // Set the profile image path
            c1.setProfileimg(fileName);
        } else {
            model.addAttribute("errorMsg", "File upload failed! Please select a valid file.");
            return "registerCompany"; // Stay on the registration page
        }

        // Save company data
        pd.registerCompany(c1); // Assuming this method persists the company data in the database

        model.addAttribute("succMsg", "Company registration successful!");
        return "loginCompany"; // Redirect to login page on success

    } catch (IOException e) {
        model.addAttribute("errorMsg", "File upload error: " + e.getMessage());
        e.printStackTrace();
    } catch (DatabaseException e) {
        model.addAttribute("errorMsg", "Database error: " + e.getMessage());
        e.printStackTrace();
    } catch (Exception e) {
        model.addAttribute("errorMsg", "Unexpected error: " + e.getMessage());
        e.printStackTrace();
    }

    // If any exception occurs, stay on the registration page and show the error message
    return "registerCompany";
}
@RequestMapping(value = "/LoginCompany", method = RequestMethod.POST)
public String loginCompany(@RequestParam("email") String email,
                           @RequestParam("password") String password,
                           Model model) throws SQLException {
    try {
        System.out.println("Login attempt with email: " + email);
        List<Company> companydata = pd.checkloginDetails(email, password);

        if (companydata == null || companydata.isEmpty()) {
            model.addAttribute("errorMsg", "Invalid email or password. Please try again!");
            System.out.println("Login failed");
            return "loginCompany";
        }

        model.addAttribute("successMsg", "Login successful!");
        System.out.println("Login successful, redirecting to homeCompany");
        return "homeCompany";

    } catch (RuntimeException e) {
        model.addAttribute("errorMsg", "Something went wrong, please try again later.");
        System.out.println("Exception: " + e.getMessage());
        return "loginCompany";
    }
}


}
	
	

	