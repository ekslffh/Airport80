package kr.or.ddit.accounting.mail.controller;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.common.vo.AccountWrapper;
import kr.or.ddit.common.vo.EmployeeVO;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.Properties;

@Controller
public class EmailSendMailController {

    @GetMapping("/account/mail/send.do")
    public String showSendMailForm() {
        return "accounting/mailbox/sendMail";
    }

    @PostMapping("/account/mail/send.do")
    public String sendMail(@RequestParam("recipient") String recipient,
                           @RequestParam("subject") String subject,
                           @RequestParam("content") String content,
                           @RequestParam("files") MultipartFile[] files, // 배열로 변경
                           Model model,
                           Authentication authentication
    ) throws UnsupportedEncodingException {

        AccountWrapper wrapper = (AccountWrapper) authentication.getPrincipal();
        EmployeeVO empVO = (EmployeeVO) wrapper.getRealUser();
        String username = empVO.getEmpEmail();
        String password = empVO.getEmpEmailPass();

        try {
            Properties props = new Properties();
            props.put("mail.smtp.host", "smtp.gmail.com");
            props.put("mail.smtp.port", "587");
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.starttls.enable", "true");

            Session session = Session.getInstance(props, new Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(username, password);
                }
            });

            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(username));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(recipient));
            message.setSubject(subject);

            MimeBodyPart mimeBodyPart = new MimeBodyPart();
            mimeBodyPart.setContent(content, "text/plain; charset=UTF-8");

            Multipart multipart = new MimeMultipart();
            multipart.addBodyPart(mimeBodyPart);

            if (files != null && files.length > 0) {
                for (MultipartFile file : files) {
                    if (!file.isEmpty()) {
                        MimeBodyPart fileBodyPart = new MimeBodyPart();
                        fileBodyPart.attachFile(convertToFile(file));
                        multipart.addBodyPart(fileBodyPart);
                    }
                }
            }

            message.setContent(multipart);

            Transport.send(message);

            model.addAttribute("success", "Email sent successfully.");
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("error", "An error occurred while sending the email.");
        }

        String successMessage = URLEncoder.encode("메일 전송 성공", "UTF-8");
        return "redirect:/account/mail/outbox.do?message=" + successMessage;
    }

    // MultipartFile을 파일로 변환하는 메서드
    private java.io.File convertToFile(MultipartFile file) throws IOException {
        java.io.File convFile = new java.io.File(file.getOriginalFilename());
        file.transferTo(convFile);
        return convFile;
    }
}
