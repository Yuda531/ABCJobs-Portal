package com.abc.controller;

import javax.servlet.http.HttpSession;

import com.abc.model.*;
import com.abc.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;

@Controller
public class DashboardController {

    @Autowired
    private UserDetailsService ud;

    @Autowired
    private UsersService usersService;

    @Autowired
    private ForumThreadsService forumThreadsService;

    @Autowired
    private ExperienceService experienceService;

    @Autowired
    private EducationService educationService;

    @GetMapping("/dashboard")
    public String dashboard(HttpSession session, Model model) throws Exception {
        try {
            setModel(model, session);
            return "dashboard";
        } catch (Exception e) {
            System.out.println(e);
            String msg = "Login required";
            model.addAttribute("message", msg);
            return "login";
        }
    }

    @GetMapping("/profile")
    public String profile(HttpSession session, Model model) {
        try {
            setModel(model, session);
            return "profile";
        } catch (Exception e) {
            System.out.println(e);
            String msg = "Login required";
            model.addAttribute("message", msg);
            return "login";
        }
    }

    @GetMapping("/editprofile")
    public String updateProfile(Model model, HttpSession session) throws Exception {
        try {
            setModel(model, session);
            return "editprofile";
        } catch (Exception e) {
            System.out.println(e);
            String msg = "Login required";
            model.addAttribute("message", msg);
            return "login";
        }
    }

    @PostMapping("/profile")
    public String up(
            @ModelAttribute("profile") UserDetails userDetails,
            Model model, HttpSession session) {

        Long userDetailsId = Long.parseLong(String.valueOf(session.getAttribute("userId")));
        ud.editprofile(userDetailsId, userDetails);

        setModel(model, session);

        String msg = "Profile has been updated";
        model.addAttribute("message", msg);
        return "profile";
    }

    @PostMapping("/add_experience")
    public String addExperience(
            @ModelAttribute("experience") Experience experience,
            Model model, HttpSession session) {

        Long userDetailsId = Long.parseLong(String.valueOf(session.getAttribute("userId")));

        if (experience.getTitle().equals("") || experience.getCompanyName().equals("")
                || experience.getEx_start_date().equals("") || experience.getEx_end_date().equals("")) {
            System.out.println("Experiences Empty");
        } else {
            experience.setUserDetailsId(String.valueOf(userDetailsId));
            experienceService.addExperience(experience);
        }

        setModel(model, session);

        String msg = "Profile has been updated";
        model.addAttribute("message", msg);
        return "profile";
    }

    @PostMapping("/add_education")
    public String addEducation(
            @ModelAttribute("education") Education education,
            Model model, HttpSession session) {

        Long userDetailsId = Long.parseLong(String.valueOf(session.getAttribute("userId")));

        if (education.getUniversity().equals("") || education.getMajored().equals("")
                || education.getEd_start_date().equals("") || education.getEd_end_date().equals("")) {
            System.out.println("Education Empty");
        } else {
            education.setUserDetailsId(String.valueOf(userDetailsId));
            educationService.addEducations(education);
        }

        setModel(model, session);

        String msg = "Profile has been updated";
        model.addAttribute("message", msg);
        return "profile";
    }

    @PostMapping("/create_thread")
    public String createThread(@ModelAttribute ForumThreads forumThread, @RequestParam(value = "imageFile", required = false) MultipartFile imageFile,
                               @RequestParam("postBody") String postBody,
                               Model model, HttpSession session) {

        Long userId = (Long) session.getAttribute("userId");

        forumThread.setBody(postBody);

        try {
            if (imageFile != null && !imageFile.isEmpty()) {
                forumThread.setImage(imageFile.getBytes());
            }

            UserDetails userDetails = ud.getDetailsById(userId);
            forumThread.setUserDetails(userDetails);


            forumThreadsService.createThread(forumThread);

            setModel(model, session);

            String msg = "Thread berhasil dibuat";
            model.addAttribute("message", msg);
        } catch (IOException e) {
            String errorMsg = "Terjadi kesalahan saat mengunggah gambar.";
            model.addAttribute("error", errorMsg);
        }

        return "dashboard";
    }

    @GetMapping("/posts")
    public String showAllPosts(Model model) {
        List<ForumThreads> posts = forumThreadsService.getAllPosts(); // Ambil semua post dari service
        model.addAttribute("posts", posts); // Kirim data post ke halaman JSP

        System.out.println(posts);
        return "dashboard"; // Nama halaman JSP yang akan ditampilkan
    }



    private void setModel(Model model, HttpSession session) {
        String userId = String.valueOf(session.getAttribute("userId"));
        UserDetails userDetails = ud.getDetailsById(Long.parseLong(userId));

        model.addAttribute("f", userDetails.getFirstName().charAt(0));
        model.addAttribute("l", userDetails.getLastName().charAt(0));

        model.addAttribute("firstName", userDetails.getFirstName());
        model.addAttribute("lastName", userDetails.getLastName());

        model.addAttribute("fullName", userDetails.getFirstName() + " " + userDetails.getLastName());
        model.addAttribute("city", userDetails.getCity());
        model.addAttribute("phoneNumber", userDetails.getPhoneNumber());

        model.addAttribute("experiences", experienceService.getExperienceByUserDetailsId(userId));
        model.addAttribute("education", educationService.getEducationByUserDetailsId(userId));
        model.addAttribute("posts",forumThreadsService.getAllPosts());
    }



}
