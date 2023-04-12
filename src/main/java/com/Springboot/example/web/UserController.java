package com.Springboot.example.web;


import com.Springboot.example.model.User;
import com.Springboot.example.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.server.ServerWebExchange;
import org.springframework.web.bind.annotation.RequestMethod;

import com.Springboot.example.validator.UserValidator;
import com.Springboot.example.model.ConfirmationToken;
import com.Springboot.example.repository.ConfirmationTokenRepository;
import com.Springboot.example.service.EmailSenderService;
@RestController
@RequestMapping("/account") 
@CrossOrigin(origins = "*", allowedHeaders = "*")
public class UserController {
    @Autowired
    private UserService userService;
    @Autowired
    private ConfirmationTokenRepository confirmationTokenRepository;
    @Autowired
    private UserValidator userValidator;
    @Autowired
    private EmailSenderService emailSenderService;
    @Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
    @RequestMapping(value = "/users", method = RequestMethod.GET,produces = MediaType.APPLICATION_JSON_VALUE)
    public String whoiamWs() {
    	return "ijij";
    }
    
    @RequestMapping(value = "/registrationv2", method = RequestMethod.POST,produces = MediaType.APPLICATION_JSON_VALUE)
    public String registrationv2(@RequestBody User userForm) {

    	User foundUser = userService.findByEmail(userForm.getEmail());
        if (foundUser ==null){
        userService.save(userForm);
        ConfirmationToken confirmationToken = new ConfirmationToken(userForm);


        confirmationTokenRepository.save(confirmationToken);
        return "account registered";}
        else {
        	return "EMAIL IN USE";
        }

    }
    

  
    

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String login(@RequestBody User user) {
        User foundUser = userService.findByEmail(user.getEmail());
        if (foundUser ==null){
     	   return "Email invalide";

        }
      
        else if(bCryptPasswordEncoder.matches(user.getPassword(), foundUser.getPassword())){

    	    ConfirmationToken confirmationToken = new ConfirmationToken(foundUser);


    	       confirmationTokenRepository.save(confirmationToken);
    	        return confirmationToken.getConfirmationToken();
    	   
       }
       else {
    	   return "Mot de passe incorrecte";
       }
    
    }

   


    /**
     * Receive email of the user, create token and send it via email to the user
     */

    @RequestMapping(value = "/forgotPassword", method = RequestMethod.POST,produces = MediaType.APPLICATION_JSON_VALUE)
    public String forgotUserPassword( @RequestBody User user) {
        User existingUser = userService.findByEmail(user.getEmail());
        System.out.println(existingUser);
        if (existingUser != null) {
            // create token
            ConfirmationToken confirmationToken = new ConfirmationToken(existingUser);
            // save it
            confirmationTokenRepository.save(confirmationToken);
            // create the email
            SimpleMailMessage mailMessage = new SimpleMailMessage();
            mailMessage.setTo(existingUser.getEmail());
            mailMessage.setSubject("Complete Password Reset!");
            mailMessage.setFrom("smidaamine8@gmail.com");
            mailMessage.setText("To complete the password reset process, please click here: "
                    + "http://localhost:6060/confirm-reset?token=" + confirmationToken.getConfirmationToken());
            emailSenderService.sendEmail(mailMessage);
            return "Email sent";
        } else {
            System.out.println("email not found");
            return "Email not found";
        }

    }
    @RequestMapping(value = "/confirm-reset", method = {RequestMethod.GET, RequestMethod.POST},produces = MediaType.APPLICATION_JSON_VALUE)
    public String validateResetToken( @RequestParam("token") String confirmationToken) {
        ConfirmationToken token = confirmationTokenRepository.findByConfirmationToken(confirmationToken);
        if (token != null) {
            User user = userService.findByEmail(token.getUser().getEmail());
            userService.save(user);
           
            return "resetPassword";
        } else {
            
            return ("The link is invalid or broken!");

        }
    }
    /**
     * Receive the token from the link sent via email and display form to reset password
     */
    @RequestMapping(value = "/reset-password", method = RequestMethod.POST,produces = MediaType.APPLICATION_JSON_VALUE)
    public String resetUserPassword(@RequestBody User user) {
        // ConfirmationToken token = confirmationTokenRepository.findByConfirmationToken(confirmationToken);
        if (user.getEmail() != null) {
            // use email to find user
            User tokenUser = userService.findByEmail(user.getEmail());
            tokenUser.setPassword(user.getPassword());

            userService.save(tokenUser);

            return "successResetPassword";

        } else {
            return "error";

        }
    }
}
