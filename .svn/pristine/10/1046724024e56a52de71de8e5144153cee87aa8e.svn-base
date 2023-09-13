package kr.or.ddit.accounting.mail.controller;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.common.vo.AccountWrapper;
import kr.or.ddit.common.vo.EmployeeVO;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.mail.internet.MimePart;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;
import javax.mail.Folder;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.Part;
import javax.mail.Session;
import javax.mail.Store;

@Controller
public class SentMailDetailController {

	@GetMapping("/account/mail/outdetail.do")
	public String mailDetail(
	        @RequestParam("messageIndex") int messageIndex,
	        Model model,
	        Authentication authentication
	) {
	    Store store = null;
	    Folder inbox = null;
	    Session session = null;

	    AccountWrapper wrapper = (AccountWrapper) authentication.getPrincipal();
	    EmployeeVO empVO = (EmployeeVO) wrapper.getRealUser();

	    try {
	        Properties props = new Properties();
	        props.put("mail.store.protocol", "imaps");

	        session = Session.getDefaultInstance(props, null);
	        store = session.getStore("imaps");
	        store.connect("imap.gmail.com", empVO.getEmpEmail(), empVO.getEmpEmailPass());

	        inbox = store.getFolder("[Gmail]/보낸편지함");
	        inbox.open(Folder.READ_ONLY);

	        Message[] messages = inbox.getMessages();

	        if (messages != null && messageIndex >= 0 && messageIndex < messages.length) {
	            Message message = messages[messageIndex];

	            String from = InternetAddress.toString(message.getFrom());
	            String subject = message.getSubject();
	            String sentDate = message.getSentDate().toString();
	            String content = "";
	            List<String> attachments = new ArrayList<>();
	            List<String> recipients = new ArrayList<>();

	            Address[] recipientAddresses = message.getRecipients(Message.RecipientType.TO);
	            if (recipientAddresses != null) {
	                for (Address recipientAddress : recipientAddresses) {
	                    if (recipientAddress instanceof InternetAddress) {
	                        recipients.add(((InternetAddress) recipientAddress).getAddress());
	                    }
	                }
	            }

	            Object messageContent = message.getContent();
	            if (messageContent instanceof String) {
	                content = (String) messageContent;
	            } else if (messageContent instanceof MimeMultipart) {
	                MimeMultipart mimeMultipart = (MimeMultipart) messageContent;
	                for (int i = 0; i < mimeMultipart.getCount(); i++) {
	                    MimePart part = (MimePart) mimeMultipart.getBodyPart(i);
	                    if (Part.ATTACHMENT.equalsIgnoreCase(part.getDisposition())) {
	                        attachments.add(part.getFileName());
	                    } else {
	                        content = part.getContent().toString();
	                    }
	                }
	            }

	            model.addAttribute("from", from);
	            model.addAttribute("subject", subject);
	            model.addAttribute("sentDate", sentDate);
	            model.addAttribute("content", content);
	            model.addAttribute("attachments", attachments);
	            model.addAttribute("recipients", recipients);
	            model.addAttribute("messageIndex", messageIndex);

	        } else {
	            model.addAttribute("error", "유효하지 않은 메시지 인덱스입니다.");
	        }
	    } catch (MessagingException | IOException e) {
	        e.printStackTrace();
	        model.addAttribute("error", "이메일 세부 내용을 불러오는 중 오류가 발생했습니다.");
	    } finally {
	        if (session != null) {
	            closeStoreAndFolder(store, inbox);
	        }
	    }

	    return "accounting/mailbox/outboxDetail";
	}


    private void closeStoreAndFolder(Store store, Folder folder) {
        try {
            if (folder != null && folder.isOpen()) {
                folder.close(false);
            }
            if (store != null && store.isConnected()) {
                store.close();
            }
        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }
}
