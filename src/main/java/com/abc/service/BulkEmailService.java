package com.abc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.mail.MailProperties;
import org.springframework.boot.autoconfigure.mail.MailSenderAutoConfiguration;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.abc.model.BulkEmail;
import com.abc.model.Users;
import com.abc.repository.BulkEmailRepository;
import com.abc.repository.UsersRepository;

@Service
public class BulkEmailService {
    @Autowired
    private BulkEmailRepository repo;

    @Autowired
    private UsersRepository ur;

    @Autowired
    private JavaMailSender mailSender;

    public boolean sendEmail(String subject, String body, String email) {
        List<Users> users = ur.findAll();

        try {
            if (email == null) {
                for (Users user : users) {
                    SimpleMailMessage message = new SimpleMailMessage();
                    message.setFrom("abcjobs@clouza.net");
                    message.setTo(user.getEmail());
                    message.setSubject(subject);
                    message.setText(body);
                    mailSender.send(message);
                    System.out.println(user.getEmail() + " - OK");
                }
            } else {
                SimpleMailMessage message = new SimpleMailMessage();
                message.setFrom("abcjobs@clouza.net");
                message.setTo(email);
                message.setSubject(subject);
                message.setText(body);
                mailSender.send(message);
            }
            return true;
        } catch (Exception e) {
            System.out.println(e);
        }

        return false;
    }

    public BulkEmail saveToDB(BulkEmail be) {
        return repo.save(be);
    }

    public List<BulkEmail> getEmail() {
        return repo.findAll();
    }
}
