package test.services.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import test.beans.Company;
import test.dao.ProjectDao;
import test.exceptions.DatabaseException;
import test.exceptions.BusinessLogicException;

import java.sql.SQLException;
import java.util.List;
import test.services.CompanyService;

@Service
public class CompanyServiceImpl implements CompanyService {

    @Autowired
    private ProjectDao projectDao;

    @Override
    public void registerCompany(Company c1) throws BusinessLogicException, DatabaseException, SQLException {
        // Business Logic: Check if email already exists
        List<Company> existingCompany = projectDao.checkloginDetails(c1.getEmail(), c1.getPassword());
        if (!existingCompany.isEmpty()) {
            throw new BusinessLogicException("Company with the given email already exists.");
        }

        // Validate password strength (Business logic)
        if (c1.getPassword().length() < 8) {
            throw new BusinessLogicException("Password must be at least 8 characters long.");
        }

        // Register the company (Database operation)
        try {
            projectDao.registerCompany(c1);
        } catch (DatabaseException e) {
            throw new DatabaseException("Database error while registering company: " + e.getMessage(), e);
        }
    }

    @Override
    public List<Company> checkLoginDetails(String email, String password) throws SQLException {
        return projectDao.checkloginDetails(email, password);
    }
}
