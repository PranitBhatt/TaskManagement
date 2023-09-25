package com.springbootproject.mywebapp.user;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
//import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import jakarta.servlet.http.HttpSession;

@Controller
public class UsersControllerJpa {
	
	
	private UserRepository userRepository;
	
	
	//Constructor 
	 public UsersControllerJpa(UserRepository userRepository) {
		super();	
		this.userRepository = userRepository;
	 }
	 
	
	
	
	@GetMapping("register")
	public String registerUser() {
		
	    return "register";
	}
	@PostMapping("/register")
	public String registerUser(Users user ,Model model) {
		
		  Users existingUser = userRepository.findByUsername(user.getUsername());
	        if (existingUser != null) {
	            model.addAttribute("message", "User already exists with the same username");
	            return "register"; // Return to the registration page with an error message
	        }

	        // Save the user if not already registered
	        userRepository.save(user);
	        return "redirect:/login"; // Redirect to the login page
	}
	
	@GetMapping("/login")
    public String login() {
		
		return "login";
    }
	@PostMapping("/login")
    public String login(@RequestParam String username, @RequestParam String password,  Model model,HttpSession session) {

        Users existuser = userRepository.findByUsername(username);
        
        if (existuser != null && existuser.getPassword().equals(password)) { //checking if user already exists
            model.addAttribute("message", "Login successful!");// message for login successfull
            model.addAttribute("name", username);// Save the username value in model to show on the welcome page
            
            session.setAttribute("username", username); // Save the Username value in session attribute
            return "welcome"; // To the login page
        } else {
            model.addAttribute("message", "Wrong credentials. Please try again."); 
            return "login"; // Showing the credentials are wrong on the login page
        }
    }
	
}
