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
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.io.IOException;
import java.time.LocalDateTime;
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
    private CommentThreadsService commentThreadsService;

    @Autowired
    private JobsService jobsService;

    @Autowired
    private ApplyJobService applyJobService;

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

        return "redirect:/dashboard";
    }

    @GetMapping("/posts")
    public String showAllPosts(Model model) {
        List<ForumThreads> posts = forumThreadsService.getAllPosts(); // Ambil semua post dari service
        model.addAttribute("posts", posts); // Kirim data post ke halaman JSP

        System.out.println(posts);
        return "dashboard"; // Nama halaman JSP yang akan ditampilkan
    }

    @PostMapping("/add_comment")
    public String addComment(
            @RequestParam("comment") String commentText,
            @RequestParam("threadId") Long threadId,
            Model model, HttpSession session){

        Long userId = (Long) session.getAttribute("userId");

        CommentThreads comment = new CommentThreads();
        comment.setUserDetails(ud.getDetailsById(userId));
        comment.setDateComment(LocalDateTime.now());
        comment.setComment(commentText);

        ForumThreads forumThread = forumThreadsService.getForumThreadById(threadId);
        comment.setParentForumThread(forumThread);

        commentThreadsService.createComment(comment);

        setModel(model, session);

        String msg = "Comment added successfully";
        model.addAttribute("message", msg);

        return "redirect:/dashboard";
    }


    @GetMapping("/getComment")
    public String showAllComment(Model model) {
        List<CommentThreads> comments = commentThreadsService.getAllComment(); // Ambil semua post dari service
        model.addAttribute("comments", comments); // Kirim data post ke halaman JSP

        System.out.println(comments);
        return "dashboard"; // Nama halaman JSP yang akan ditampilkan
    }

    @GetMapping("/jobs")
    public String jobs(HttpSession session, Model model) {
        try {
            setModel(model, session);
            return "jobs";
        } catch (Exception e) {
            System.out.println(e);
            String msg = "Login required";
            model.addAttribute("message", msg);
            return "login";
        }
    }

    @GetMapping("/getJobs")
    public String showAllJobs(Model model) {
        List<Jobs> getJobs = jobsService.getAllJobs(); // Ambil semua post dari service
        model.addAttribute("getJobs", getJobs); // Kirim data post ke halaman JSP

        System.out.println(getJobs);
        return "jobs"; // Nama halaman JSP yang akan ditampilkan
    }

    @PostMapping("/apply_job")
    public String applyJob(@RequestParam("jobId") Long jobId, HttpSession session, RedirectAttributes redirectAttributes) {
        try {
            UserDetails userDetails = ud.getDetailsById((Long) session.getAttribute("userId"));
            Jobs job = jobsService.getJobsById(jobId);

            if (userDetails != null && job != null) {
                ApplyJob applyJob = new ApplyJob();
                applyJob.setUserDetails(userDetails);
                applyJob.setJobs(job);
                applyJob.setCreatedAt(LocalDateTime.now());

                applyJobService.saveApplyJob(applyJob);

                redirectAttributes.addFlashAttribute("message", "Job applied successfully!");
            } else {
                redirectAttributes.addFlashAttribute("error", "Error applying job.");
            }
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", "Error applying job.");
        }

        return "redirect:/jobs"; // Redirect kembali ke halaman jobs setelah mengajukan apply
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
        model.addAttribute("comments", commentThreadsService.getAllComment());
        model.addAttribute("getJobs", jobsService.getAllJobs());
        model.addAttribute("getJobsAdmin", jobsService.getAllJobs());


    }



}
