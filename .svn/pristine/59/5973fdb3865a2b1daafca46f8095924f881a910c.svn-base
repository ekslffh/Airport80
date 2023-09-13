package kr.or.ddit.accounting.mail.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.common.vo.AccountWrapper;
import kr.or.ddit.common.vo.EmployeeVO;

import javax.mail.*;
import javax.servlet.http.HttpServletRequest;
import java.util.Arrays;
import java.util.Properties;

@Controller
public class ReceiveMailListController {

    @GetMapping("/account/mail/inbox.do")
    public String inbox(Model model, Authentication authentication) {
        Store store = null;
        Folder inbox = null;
        Session session = null;
        AccountWrapper wrapper = (AccountWrapper) authentication.getPrincipal();
        EmployeeVO empVO = (EmployeeVO) wrapper.getRealUser();
        
        try {
            Properties props = new Properties();
            props.put("mail.store.protocol", "imaps");
            session = Session.getDefaultInstance(props, null);
            
            String EmailAddress = empVO.getEmpEmail();
            String EmailPass = empVO.getEmpEmailPass();
            
            store = session.getStore("imaps");
            store.connect("imap.gmail.com", EmailAddress, EmailPass);
            
            inbox = store.getFolder("INBOX");
            inbox.open(Folder.READ_ONLY);

            Message[] messages = inbox.getMessages();

            model.addAttribute("messages", messages);
        } catch (MessagingException e) {
            
            model.addAttribute("error", "An error occurred while fetching emails.");
        } finally {
        	if(session==null)
            closeStoreAndFolder(store, inbox);
        }
        return "accounting/mailbox/inbox";
    }
    
    
    @PostMapping("/account/mail/inboxdelete.do")
    public String moveMessagesToTrash(@RequestParam(value = "inboxMessageIndexes", required = false) String messageIndexesStr,
                                      @RequestParam(value = "selectAll", required = false) String selectAll,
                                      Model model,  Authentication authentication,
                                      HttpServletRequest request) {
        Store store = null;
        Folder inbox = null;
        Folder trash = null;
        AccountWrapper wrapper = (AccountWrapper) authentication.getPrincipal();
        EmployeeVO empVO = (EmployeeVO) wrapper.getRealUser();
        

        try {
            Properties props = new Properties();
            props.put("mail.store.protocol", "imaps");

            Session session = Session.getDefaultInstance(props, null);
            store = session.getStore("imaps");
        	String username = empVO.getEmpEmail();
    		String password = empVO.getEmpEmailPass();
            store.connect("imap.gmail.com", username, password);

            inbox = store.getFolder("INBOX");
            trash = store.getFolder("[Gmail]/휴지통");
            inbox.open(Folder.READ_WRITE);
            trash.open(Folder.READ_WRITE);

            Message[] messages = inbox.getMessages();

            if (selectAll != null && selectAll.equals("true")) {
                copyMessagesToFolder(messages, trash);
                
                for (Message message : messages) {
                    if (!message.isSet(Flags.Flag.DELETED)) {
                        message.setFlag(Flags.Flag.DELETED, true);
                    }
                }
            } else if (messageIndexesStr != null && !messageIndexesStr.isEmpty()) {
                String[] messageIndexesArr = messageIndexesStr.split(",");
                int[] messageIndexes = new int[messageIndexesArr.length];
                
                for (int i = 0; i < messageIndexesArr.length; i++) {
                    try {
                        messageIndexes[i] = Integer.parseInt(messageIndexesArr[i]);
                    } catch (NumberFormatException e) {
                        // 예외 처리: 유효하지 않은 인덱스는 무시하고 계속 진행
                    }
                }

                Message[] selectedMessages = new Message[messageIndexes.length];
                for (int i = 0; i < messageIndexes.length; i++) {
                    int messageIndex = messageIndexes[i];
                    if (messageIndex >= 0 && messageIndex < messages.length) {
                        selectedMessages[i] = messages[messageIndex];
                    }
                }
                
                copyMessagesToFolder(selectedMessages, trash);
                
                for (Message message : selectedMessages) {
                    if (message != null && !message.isSet(Flags.Flag.DELETED)) {
                        message.setFlag(Flags.Flag.DELETED, true);
                    }
                }
            }
            
            inbox.close(true);  // 실제로 휴지통으로 이동 및 삭제 적용

            return "redirect:/account/mail/inbox.do";
        } catch (MessagingException e) {
            // 예외 처리
        } finally {
            closeStoreAndFolder(store, inbox);
            closeFolder(trash);
        }
        return "redirect:/account/mail/inbox.do";
    }

    private void copyMessagesToFolder(Message[] messages, Folder destinationFolder) throws MessagingException {
        Folder sourceFolder = messages[0].getFolder();
        sourceFolder.copyMessages(messages, destinationFolder);
    }

    private void closeFolder(Folder folder) {
        try {
            if (folder != null && folder.isOpen()) {
                folder.close(false);
            }
        } catch (MessagingException e) {
           
        }
    }

    private void closeStoreAndFolder(Store store, Folder folder) {
        try {
            if (folder != null && folder.isOpen()) {
                folder.close(false); // 메일 메시지를 읽은 후에 폴더를 닫습니다.
            }
            if (store != null && store.isConnected()) {
                store.close();
            }
        } catch (MessagingException e) {
           
        }
    }
}