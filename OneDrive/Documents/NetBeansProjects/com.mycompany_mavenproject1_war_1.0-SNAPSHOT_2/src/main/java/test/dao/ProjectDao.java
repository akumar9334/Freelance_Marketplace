package test.dao;

import jakarta.resource.cci.ResultSet;
import java.sql.SQLException;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.dao.DataAccessException;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.jdbc.core.RowMapper;
import test.beans.Company;
import test.exceptions.DatabaseException;

@Repository("projectDaoBean")
public class ProjectDao {

    private static final Logger logger = LoggerFactory.getLogger(ProjectDao.class);

    @Autowired
    private JdbcTemplate t1;

    @Transactional
    public void registerCompany(Company c1) throws DatabaseException {
        if (c1 == null || c1.getName() == null || c1.getEmail() == null) {
            throw new IllegalArgumentException("Company data is invalid: name or email is null");
        }

        String query = "INSERT INTO company (name, email, number, password, confirmpassword, website, profileimg) " +
                       "VALUES (?, ?, ?, ?, ?, ?, ?)";

        try {
            int rowsAffected = t1.update(query, 
                                         c1.getName(), 
                                         c1.getEmail(), 
                                         c1.getNumber(), 
                                         c1.getPassword(), 
                                         c1.getConfirmpassword(), 
                                         c1.getWebsite(), 
                                         c1.getProfileimg());

            if (rowsAffected > 0) {
                logger.info("Successfully registered company: {}", c1);
            } else {
                logger.error("Failed to insert company data: {}", c1);
                throw new DatabaseException("Failed to insert company data into the database.", null);
            }
        } catch (DuplicateKeyException e) {
            logger.error("Duplicate entry for email {}: {}", c1.getEmail(), e.getMessage());
            throw new DatabaseException("A company with the same email already exists.", e);
        } catch (DataAccessException e) {
            logger.error("Database error while registering company with email {}: {}", c1.getEmail(), e.getMessage());
            throw new DatabaseException("Database error occurred: " + e.getMessage(), e);
        }
    }

   public List<Company> checkloginDetails(String email, String password) throws SQLException {
    try {
        return t1.query("SELECT * FROM company WHERE email='" + email + "' AND password='" + password + "'", new RowMapper<Company>() {
            @Override
            public Company mapRow(java.sql.ResultSet rs, int rowNum) throws SQLException {
                Company c1 = new Company();
                c1.setId(rs.getInt(1));
                c1.setName(rs.getString(2));
                c1.setEmail(rs.getString(3));
                c1.setNumber(rs.getString(4));
                c1.setPassword(rs.getString(5));
                c1.setConfirmpassword(rs.getString(6));
                c1.setWebsite(rs.getString(7));
                c1.setProfileimg(rs.getString(8));
                return c1;
            }
        });
    } catch (DataAccessException ex) {
        // Log the exception or handle it
        throw new RuntimeException("Error during login: " + ex.getMessage(), ex);  // This is now a RuntimeException
    }
}
}
