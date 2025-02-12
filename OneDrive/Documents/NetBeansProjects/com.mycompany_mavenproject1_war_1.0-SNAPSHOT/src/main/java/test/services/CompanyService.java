package test.services;

import test.beans.Company;
import test.exceptions.DatabaseException;
import test.exceptions.BusinessLogicException;

import java.sql.SQLException;
import java.util.List;

public interface CompanyService {

    void registerCompany(Company company) throws BusinessLogicException, DatabaseException, SQLException;

    List<Company> checkLoginDetails(String email, String password) throws SQLException;
}
