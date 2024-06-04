package com.fefsi.controllers;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.servlet.ModelAndView;

import com.fefsi.handler.Response;
import com.fefsi.models.LogOutRequest;
import com.fefsi.models.LoginRequest;
import com.fefsi.service.UserService;
import com.fefsi.util.ApplicationProperties;

/**
 * @author sridar
 *
 */
@Controller
public class AuthController {

    @Autowired
    UserService userService;

    @Autowired
    ApplicationProperties applicationProperties;

    @GetMapping({ "/", "/login" })
    public String login(Model model) {
        return "login";
    }

    @PostMapping("/welcome")
    public ModelAndView authenticateUser(ModelAndView model, @ModelAttribute("loginRequest") LoginRequest loginRequest) {
        boolean authenticated = userService.authenticateUser(loginRequest);
        if (authenticated) {
            model.setViewName("dashboard");
        } else {
            model.addObject("error", "Your username and password is invalid.");
            model.setViewName("login");
        }
        return model;
    }

    @PostMapping("/logout")
    public ResponseEntity<?> logoutUser(@Valid @RequestBody LogOutRequest logOutRequest) {
        return ResponseEntity.ok(new Response(HttpStatus.OK.value(), "", ""));
    }
    
    @GetMapping("/home")
    public String user(Model model) {
        return "home";
    }
    
    @GetMapping("/agent")
    public String release(Model model) {
        return "agent";
    }
    
    @GetMapping("/company")
    public String pawnmaster(Model model) {
        return "company";
    }
    
    @GetMapping("/movie")
    public String billing(Model model) {
        return "movie";
    }
    
    @GetMapping("/payconfig")
    public String reports(Model model) {
        return "payconfig";
    }
       
}
