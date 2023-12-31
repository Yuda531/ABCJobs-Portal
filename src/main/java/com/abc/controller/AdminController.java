package com.abc.controller;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.servlet.http.HttpSession;

import com.abc.model.*;
import com.abc.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

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

    @Autowired
    private JobsService jobsService;

    @Autowired
    private ApplyJobService applyJobService;

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
    public String adminJobs(Model model, HttpSession session) {
        if (session.getAttribute("roleId").toString().equals("2")) {
            return "redirect:/dashboard";
        }

        String name = ud.getDetailsById(session.getAttribute("userId").toString()).split(",")[1];
        model.addAttribute("adminName", name);

        List<Jobs> getJobsAdmin = jobsService.getAllJobs();
        model.addAttribute("getJobsAdmin", getJobsAdmin); // Add the list of jobs to the model

        return "admin/adminJobs"; // Return the view name
    }


    @PostMapping("/post-job")
    public String postJob(@ModelAttribute Jobs jobs, @RequestParam(value = "imageFile", required = false) MultipartFile imageFile,
                          Model model, HttpSession session) {

        Long userId = (Long) session.getAttribute("userId");

        try {
            if (imageFile != null && !imageFile.isEmpty()) {
                jobs.setImageCompany(imageFile.getBytes());
            }

            UserDetails userDetails = ud.getDetailsById(userId);
            jobs.setUserDetails(userDetails);

            jobsService.addJobs(jobs);

            String msg = "Pekerjaan berhasil diposting";
            model.addAttribute("message", msg);
        } catch (IOException e) {
            String errorMsg = "Terjadi kesalahan saat mengunggah gambar.";
            model.addAttribute("error", errorMsg);
        }

        return "redirect:/adminJobs";
    }

    @GetMapping("/getJobsAdmin")
    public String showAllJobsAdmin(Model model) {
        List<Jobs> getJobsAdmin = jobsService.getAllJobs(); // Ambil semua post dari service
        model.addAttribute("getJobsAdmin", getJobsAdmin); // Kirim data post ke halaman JSP

        System.out.println(getJobsAdmin);
        return "adminJobs"; // Nama halaman JSP yang akan ditampilkan
    }

    @GetMapping("/applicant-list")
    public ModelAndView allApplicant(Model model, HttpSession session) {
        List<ApplyJob> applicant = applyJobService.getAllApplyJobs();
        String cd = null;
        System.out.println("OK " + cd);
        model.addAttribute("applicant", applicant);
        return new ModelAndView("admin/applicantList");
    }


    @DeleteMapping("/delete-apply/{applyJobId}")
    public String deleteApplyJob(@PathVariable("applyJobId") Long applyJobId, Model model) {
        try {
            applyJobService.deleteApplyJob(applyJobId);
        } catch (EmptyResultDataAccessException e) {
            model.addAttribute("error", "Apply job with ID " + applyJobId + " not found");
        }
        return "redirect:/applicant-list";
    }




    private void setModel(Profile profile, Model model, HttpSession session) {
        List<ApplyJob> applicant = applyJobService.getAllApplyJobs();

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
        model.addAttribute("jb", profile.getJb());
        model.addAttribute("applicant", applicant);


    }


}
