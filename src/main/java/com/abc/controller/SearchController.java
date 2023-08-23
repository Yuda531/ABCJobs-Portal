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
        Long userId = Long.parseLong(uId);
        this.setModel(model, session, userId);
        return new ModelAndView("result");
    }

    @GetMapping("/profileThread") // view other profile
    public ModelAndView viewProfile(@RequestParam("uId") String uId, Model model, HttpSession session) throws Exception {
        Long userId = Long.parseLong(uId);
        this.setModel(model, session, userId);
        return new ModelAndView("result");
    }


    private void setModel(Model model, HttpSession session, Long uId) {
        UserDetails userAsep = ud.findById(uId);



        String userId = String.valueOf(userAsep.getUserDetailsId());
//        String[] userDetails = ud.getDetailsById(userId).replaceAll("null", "-").split(",");
//        String udID = userDetails[0];

        model.addAttribute("f", userAsep.getFirstName().charAt(0));
        model.addAttribute("l", userAsep.getLastName().charAt(0));

        model.addAttribute("firstName", userAsep.getFirstName());
        model.addAttribute("lastName", userAsep.getLastName());

        model.addAttribute("fullName", userAsep.getFirstName() + " " + userAsep.getLastName());
        model.addAttribute("city", userAsep.getCity());
        model.addAttribute("phoneNumber", userAsep.getPhoneNumber());

        model.addAttribute("experiences", experienceService.getExperienceByUserDetailsId(userId));
        model.addAttribute("education", educationService.getEducationByUserDetailsId(userId));
    }
}
