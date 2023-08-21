package com.abc.controller;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.servlet.http.HttpSession;

import com.abc.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.abc.model.BulkEmail;
import com.abc.model.Education;
import com.abc.model.Experience;
import com.abc.model.UserDetails;
//import com.abc.service.BulkEmailService;

import helper.Profile;

@Controller
public class AdminController {

    @Autowired
    private UsersService us;

    @Autowired
    private UserDetailsService ud;

    @Autowired
    private BulkEmailService bs;

    @Autowired
    private EducationService eds;

    @Autowired
    private ExperienceService exs;

    @GetMapping("/admin")
    public ModelAndView index(Model model, HttpSession session) {
        if (session.getAttribute("roleId").toString().equals("2")) {
            return new ModelAndView("redirect:/dashboard");
        }

        String name = ud.getDetailsById(session.getAttribute("userId").toString()).split(",")[1];
        model.addAttribute("adminName", name);
        return new ModelAndView("admin/index");

    }

    @GetMapping("/send-bulk")
    public String showSendBulkPage(Model model) {
        model.addAttribute("sendBulk", new BulkEmail());
        return "admin/send-bulk";
    }

    @PostMapping("/send-bulk")
    public String sendBulk(@ModelAttribute("sendBulk") BulkEmail bulkEmail, HttpSession session) {
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
        LocalDateTime now = LocalDateTime.now();

        bulkEmail.setSendBy("1");
        bulkEmail.setCreatedAt(dtf.format(now));
        bs.sendEmail(bulkEmail.getEmailSubject(), bulkEmail.getEmailBody(), null);

        bs.saveToDB(bulkEmail);
        return "redirect:/admin";
    }

    @GetMapping("/all-users")
    public ModelAndView allUsers(Model model, HttpSession session) {
        List<UserDetails> users = ud.getAllUserDetails();
        String cd = null;
        System.out.println("OK " + cd);
        model.addAttribute("users", users);
        return new ModelAndView("admin/alluser");
    }

    @GetMapping("/delete/{id}")
    public String deleteUserById(@PathVariable("id") Long id, Model model) {
        boolean isDeleted = us.deleteUserById(id);
        if (!isDeleted) {
            model.addAttribute("err", "Cannot delete this user");
        }

        return "redirect:/all-users";
    }

    @GetMapping("/user-profile/{id}")
    public ModelAndView profile(@PathVariable("id") Long id, Model model, HttpSession session, Profile profile) {
        UserDetails userDetails = ud.getDetailsById(id);
        List<Experience> experiences = exs.getExperienceByUserDetailsId(userDetails.getUserDetailsId().toString());
        List<Education> educations = eds.getEducationByUserDetailsId(userDetails.getUserDetailsId().toString());

        profile.setId(userDetails.getUserDetailsId());
        profile.setFirstName(userDetails.getFirstName());
        profile.setLastName(userDetails.getLastName());
        profile.setFullName(userDetails.getFirstName() + " " + userDetails.getLastName());
        profile.setCity(userDetails.getCity());
        profile.setEmail(userDetails.getUser().getEmail());
        profile.setPhoneNumber(userDetails.getPhoneNumber());

        profile.setEx(experiences);
        profile.setEd(educations);

        this.setModel(profile, model, session);
        return new ModelAndView("admin/user-profile");
    }

    @PostMapping("/user-profile/editprofile")
    public String up(@ModelAttribute("profile") UserDetails userDetails, Model model, HttpSession session) {
        Long userDetailsId = userDetails.getUserDetailsId();
        ud.editprofile(userDetailsId, userDetails);
        return "redirect:/all-users";
    }

    @GetMapping("/adminJobs")
    public ModelAndView adminJobs(Model model, HttpSession session) {
        if (session.getAttribute("roleId").toString().equals("2")) {
            return new ModelAndView("redirect:/dashboard");
        }

        String name = ud.getDetailsById(session.getAttribute("userId").toString()).split(",")[1];
        model.addAttribute("adminName", name);
        return new ModelAndView("admin/adminJobs");

    }

    private void setModel(Profile profile, Model model, HttpSession session) {
        model.addAttribute("id", profile.getId());
        model.addAttribute("f", profile.getFirstName().charAt(0));
        model.addAttribute("l", profile.getLastName().charAt(0));

        model.addAttribute("firstName", profile.getFirstName());
        model.addAttribute("lastName", profile.getLastName());

        model.addAttribute("fullName", profile.getFullName());
        model.addAttribute("city", profile.getCity());
        model.addAttribute("phoneNumber", profile.getPhoneNumber());
        model.addAttribute("email", profile.getEmail());

        model.addAttribute("ex", profile.getEx()); // Experiences[]
        model.addAttribute("ed", profile.getEd()); // Educations[]
    }

}
