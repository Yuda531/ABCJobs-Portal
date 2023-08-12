package com.abc.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.abc.model.UserDetails;
import com.abc.service.EducationService;
import com.abc.service.ExperienceService;
import com.abc.service.UserDetailsService;

@Controller
public class SearchController {

    @Autowired
    private UserDetailsService ud;

    @Autowired
    private ExperienceService experienceService;

    @Autowired
    private EducationService educationService;

    @GetMapping("/search")
    public ModelAndView search(HttpServletRequest req, Model model) throws Exception {
        String q = req.getParameter("q");

        if (q != null && !q.equals("")) {
            q = q.split(" ")[0];
            List<UserDetails> selectedUser = ud.searchByKey(q);
            model.addAttribute("selected", selectedUser);

            if (selectedUser.size() == 0) {
                model.addAttribute("notFound", true);
            }
        }

        return new ModelAndView("search");
    }

    @PostMapping("/result") // view other profile
    public ModelAndView searchProfile(@RequestParam("uId") String uId, Model model, HttpSession session) throws Exception {
        this.setModel(model, session, uId);
        return new ModelAndView("result");
    }

    @GetMapping("/profileThread") // view other profile
    public ModelAndView viewProfile(@RequestParam("uId") String uId, Model model, HttpSession session) throws Exception {
        this.setModel(model, session, uId);
        return new ModelAndView("result");
    }


    private void setModel(Model model, HttpSession session, String uId) {
        String userId = String.valueOf(uId);
        String[] userDetails = ud.getDetailsById(userId).replaceAll("null", "-").split(",");
        String udID = userDetails[0];

        model.addAttribute("f", userDetails[1].charAt(0));
        model.addAttribute("l", userDetails[2].charAt(0));

        model.addAttribute("firstName", userDetails[1]);
        model.addAttribute("lastName", userDetails[2]);

        model.addAttribute("fullName", userDetails[1] + " " + userDetails[2]);
        model.addAttribute("city", userDetails[3]);
        model.addAttribute("phoneNumber", userDetails[4]);

        model.addAttribute("experiences", experienceService.getExperienceByUserDetailsId(udID));
        model.addAttribute("education", educationService.getEducationByUserDetailsId(udID));
    }
}
