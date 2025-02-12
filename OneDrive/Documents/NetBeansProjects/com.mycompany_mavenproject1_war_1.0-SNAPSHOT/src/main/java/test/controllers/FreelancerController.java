/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

package test.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import test.dao.ProjectDao;

/**
 *
 * @author kumar
 */
@Controller
public class FreelancerController {
    @Autowired
    ProjectDao pd;
    
    @RequestMapping("/registerfreelancer")
    public String registerfreelancer(){
    return "registerfreelancer";
    }
    
}
