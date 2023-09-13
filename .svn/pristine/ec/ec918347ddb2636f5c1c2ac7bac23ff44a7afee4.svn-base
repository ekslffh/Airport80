package kr.or.ddit.accounting.mail.controller;

import javax.mail.*;
import javax.mail.internet.MimeMessage;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.common.vo.AccountWrapper;
import kr.or.ddit.common.vo.EmployeeVO;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Properties;

@Controller
public class EmailAtchController extends HttpServlet {

	@GetMapping("/account/mail/downloadAttachment.do")
    protected void doGet(
    		HttpServletRequest request,
	        HttpServletResponse response,
	        @RequestParam int messageIndex,
	        @RequestParam int attachmentIndex,
	        Authentication authentication
    		) throws IOException {
		
    	AccountWrapper wrapper = (AccountWrapper) authentication.getPrincipal();
        EmployeeVO empVO = (EmployeeVO) wrapper.getRealUser();
        String username =empVO.getEmpEmail();
        String password =empVO.getEmpEmailPass();
        Store store = null;
        Folder inbox = null;
        Session session = null;
        attachmentIndex+=1;
 
        try {
            Properties props = new Properties();
            props.put("mail.store.protocol", "imaps");

            session = Session.getDefaultInstance(props, null);
            store = session.getStore("imaps");
            store.connect("imap.gmail.com", username, password);

            inbox = store.getFolder("INBOX");
            inbox.open(Folder.READ_ONLY);

            Message[] messages = inbox.getMessages();

            if (messages != null && messageIndex >= 0 && messageIndex < messages.length) {
                Message message = messages[messageIndex];

                if (message instanceof MimeMessage) {
                    Multipart multipart = (Multipart) ((MimeMessage) message).getContent();
                    if (multipart.getCount() > attachmentIndex) {
                        Part part = multipart.getBodyPart(attachmentIndex);
                        if (Part.ATTACHMENT.equalsIgnoreCase(part.getDisposition())) {
                            String fileName = part.getFileName();

                            try (InputStream inputStream = part.getInputStream();
                                 OutputStream outputStream = response.getOutputStream()) {

                                response.setContentType("application/octet-stream");
                                String encodedFileName = URLEncoder.encode(fileName, "UTF-8");
                                response.setHeader("Content-Disposition", "attachment; filename=\"" + encodedFileName + "\"");

                                byte[] buffer = new byte[8192];
                                int bytesRead;
                                while ((bytesRead = inputStream.read(buffer)) != -1) {
                                    outputStream.write(buffer, 0, bytesRead);
                                }

                                response.flushBuffer();
                            }
                        }
                    }
                }
            }
        } catch (MessagingException | IOException e) {
            e.printStackTrace();
            // Handle error
        } finally {
        	if (session == null) {
                closeStoreAndFolder(store, inbox);
            
        }
      }
	}
        @GetMapping("/account/mail/outdownloadAttachment.do")
        protected void out(
        		 HttpServletRequest request,
        	        HttpServletResponse response,
        	        @RequestParam int messageIndex,
        	        @RequestParam int attachmentIndex,
        	        Authentication authentication
        		) throws IOException {
       
        	AccountWrapper wrapper = (AccountWrapper) authentication.getPrincipal();
            EmployeeVO empVO = (EmployeeVO) wrapper.getRealUser();
            String username =empVO.getEmpEmail();
            String password =empVO.getEmpEmailPass();
            Store store = null;
            Folder inbox = null;
            Session session = null;
            attachmentIndex+=1;
            
            try {
                Properties props = new Properties();
                props.put("mail.store.protocol", "imaps");

                session = Session.getDefaultInstance(props, null);
                store = session.getStore("imaps");
                store.connect("imap.gmail.com", username , password);

                inbox = store.getFolder("[Gmail]/보낸편지함");
                inbox.open(Folder.READ_ONLY);

                Message[] messages = inbox.getMessages();

                if (messages != null && messageIndex >= 0 && messageIndex < messages.length) {
                    Message message = messages[messageIndex];

                    if (message instanceof MimeMessage) {
                        Multipart multipart = (Multipart) ((MimeMessage) message).getContent();
                        if (multipart.getCount() > attachmentIndex) {
                            Part part = multipart.getBodyPart(attachmentIndex);
                            if (Part.ATTACHMENT.equalsIgnoreCase(part.getDisposition())) {
                                String fileName = part.getFileName();

                                try (InputStream inputStream = part.getInputStream();
                                     OutputStream outputStream = response.getOutputStream()) {

                                    response.setContentType("application/octet-stream");
                                    String encodedFileName = URLEncoder.encode(fileName, "UTF-8");
                                    response.setHeader("Content-Disposition", "attachment; filename=\"" + encodedFileName + "\"");

                                    byte[] buffer = new byte[8192];
                                    int bytesRead;
                                    while ((bytesRead = inputStream.read(buffer)) != -1) {
                                        outputStream.write(buffer, 0, bytesRead);
                                    }

                                    response.flushBuffer();
                                }
                            }
                        }
                    }
                }
            } catch (MessagingException | IOException e) {
                e.printStackTrace();
                // Handle error
            } finally {
            	if (session == null) {
                    closeStoreAndFolder(store, inbox);
                }
            }
        
        
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
