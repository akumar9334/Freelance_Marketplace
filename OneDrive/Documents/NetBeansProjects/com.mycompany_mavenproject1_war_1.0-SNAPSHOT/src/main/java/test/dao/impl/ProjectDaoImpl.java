/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package test.dao.impl;

/**
 *
 * @author kumar
 */


import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.dao.DataAccessException;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import test.beans.Company;
import test.dao.ProjectDao;
import test.exceptions.DatabaseException;

@Repository
public class ProjectDaoImpl implements ProjectDao {

    private static final Logger logger = LoggerFactory.getLogger(ProjectDaoImpl.class);

    @Autowired
    private JdbcTemplate jdbcTemplate;

    // Inject SQL queries from properties file
    @Value("${REGISTER_COMPANY}")
    private String REGISTER_COMPANY;

    @Value("${CHECK_LOGIN}")
    private String CHECK_LOGIN;

    @Transactional
    @Override
    public void registerCompany(Company c1) throws DatabaseException {
        if (c1 == null || c1.getName() == null || c1.getEmail() == null) {
            throw new IllegalArgumentException("Company data is invalid: name or email is null");
        }

        try {
            int rowsAffected = jdbcTemplate.update(REGISTER_COMPANY, 
                c1.getName(), c1.getEmail(), c1.getNumber(), 
                c1.getPassword(), c1.getConfirmpassword(), 
                c1.getWebsite(), c1.getProfileimg());

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
            logger.error("Database error while registering company: {}", e.getMessage());
            throw new DatabaseException("Database error occurred: " + e.getMessage(), e);
        }
    }

    @Override
    public List<Company> checkloginDetails(String email, String password) throws SQLException {
        try {
            return jdbcTemplate.query(CHECK_LOGIN, new Object[]{email, password}, (rs, rowNum) -> {
                Company c1 = new Company();
                c1.setId(rs.getInt("id"));
                c1.setName(rs.getString("name"));
                c1.setEmail(rs.getString("email"));
                c1.setNumber(rs.getString("number"));
                c1.setPassword(rs.getString("password"));
                c1.setConfirmpassword(rs.getString("confirmpassword"));
                c1.setWebsite(rs.getString("website"));
                c1.setProfileimg(rs.getString("profileimg"));
                return c1;
            });
        } catch (DataAccessException ex) {
            logger.error("Login failed for email {}: {}", email, ex.getMessage());
            throw new RuntimeException("Error during login: " + ex.getMessage(), ex);
        }
    }
}

