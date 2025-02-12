package test.dao;

import java.sql.SQLException;
import java.util.List;
import test.beans.Company;
import test.exceptions.DatabaseException;

public interface ProjectDao {

    void registerCompany(Company c1) throws DatabaseException;

    List<Company> checkloginDetails(String email, String password) throws SQLException;
}
