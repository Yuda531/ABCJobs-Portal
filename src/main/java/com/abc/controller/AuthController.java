package com.abc.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.abc.model.UserDetails;
import com.abc.model.Users;
import com.abc.service.UserDetailsService;
import com.abc.service.UsersService;

@Controller
public class AuthController {

    @Autowired
    private UsersService us;

    @Autowired
    private UserDetailsService ud;

    @GetMapping("/registration")
    public String registrationForm(HttpSession session) throws Exception {
        return "registration";
    }

    @PostMapping("/registration")
    public String registration(
            @RequestParam("email") String email,
            @RequestParam("password") String password,
            @RequestParam("firstName") String firstName,
            @RequestParam("lastName") String lastName,
            @RequestParam("city") String city,
            Users user, UserDetails userDetails, Model model) throws Exception {
        try {
            user.setEmail(email);
            user.setPassword(password);
            user.setRoleId("2");
            user.setCreatedAt(java.time.LocalDate.now().toString());
            us.register(user);

            userDetails.setUserId(us.getLastUser().split(",")[0]);
            userDetails.setFirstName(firstName);
            userDetails.setLastName(lastName);
            userDetails.setCity(city);
            ud.register(userDetails);

            model.addAttribute("email", user.getEmail());
            return "thankyou";
        } catch (Exception e) {
            System.out.println(e);
        }
        model.addAttribute("errMsg", "Email is currently in use!");
        return "registration";
    }

    @GetMapping("/login")
    public String loginForm(HttpSession session) throws Exception {
        return "login";
    }

    @PostMapping("/login")
    public String login(
            @ModelAttribute("login") Users user, Model model,
            HttpServletRequest req, HttpServletResponse res) {

        HttpSession session = req.getSession();
        Users isLogin = us.login(user);

        if (isLogin != null) {
            session.setAttribute("email", isLogin.getEmail());
            session.setAttribute("userId", isLogin.getUserId());
            session.setAttribute("roleId", isLogin.getRoleId());
            session.setAttribute("isLogin", true);

            // Perubahan berdasarkan roleId
            int roleId = Integer.parseInt(isLogin.getRoleId());
            if (roleId == 1) {
                return "redirect:/admin";
            } else if (roleId == 2) {
                return "redirect:/dashboard";
            }
        }

        String msg = "Credentials is incorrect !";
        model.addAttribute("message", msg);
        return "login";
    }

    @GetMapping("/logout")
    public String logout(HttpServletResponse res, HttpSession session) throws Exception {
        session.invalidate();

        Cookie eCookie = new Cookie("email", "");
        eCookie.setMaxAge(0); // 10 minute
        res.addCookie(eCookie);

        Cookie iCookie = new Cookie("userId", "");
        iCookie.setMaxAge(0);
        res.addCookie(iCookie);

        return "login";
    }

    @GetMapping("/forgotpass")
    public String forgotPasswordForm(HttpServletResponse res) throws Exception {
        return "forgotpass";
    }

    @PostMapping("/forgotpass")
    public String forgotPassword(@RequestParam("email") String email, Model model, HttpServletRequest req) throws Exception {
        HttpSession session = req.getSession();
        String checkEmail = us.checkEmail(email);

        if (checkEmail != null) {
            session.setAttribute("isReset", true);
            session.setAttribute("email", email);
            return "resetpass";
        }

        String msg = "Email not found";
        model.addAttribute("message", msg);
        return "forgotpass";
    }

    @GetMapping("/resetpass")
    public String resetPasswordForm(Model model, HttpSession session) throws Exception {
        if ((Boolean) session.getAttribute("isReset")) {
            return "resetpass";
        }

        String msg = "Email required";
        model.addAttribute("message", msg);
        return "forgotpass";
    }

    @PostMapping("/resetpass")
    public String resetPassword(@RequestParam("password") String password, Model model, HttpSession session) throws Exception {
        try {
            us.updatePassword(password, (String) session.getAttribute("email"));

            String msg = "Password has been changed";
            model.addAttribute("scMessage", msg);
            session.invalidate();
        } catch (Exception e) {
            System.out.println(e);
            return "resetpass";
        }

        return "login";
    }
}
