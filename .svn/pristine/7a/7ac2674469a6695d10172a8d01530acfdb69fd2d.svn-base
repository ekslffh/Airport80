package kr.or.ddit.accounting.mail.controller;

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

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

@Controller
public class SentMailListController {

	@GetMapping("/account/mail/outbox.do")
	public String sentMail(Model model, Authentication authentication) {
	    Store store = null;
	    Folder sentFolder = null;
	    Session session = null;

	    AccountWrapper wrapper = (AccountWrapper) authentication.getPrincipal();
	    EmployeeVO empVO = (EmployeeVO) wrapper.getRealUser();

	    try {
	        Properties props = new Properties();
	        props.put("mail.store.protocol", "imaps");

	        session = Session.getDefaultInstance(props, null);
	        store = session.getStore("imaps");
	        store.connect("imap.gmail.com", empVO.getEmpEmail(), empVO.getEmpEmailPass());

	        sentFolder = store.getFolder("[Gmail]/보낸편지함");
	        sentFolder.open(Folder.READ_ONLY);

	        Message[] sentMessages = sentFolder.getMessages();

	        List<Map<String, Object>> messagesList = new ArrayList<>();
	        for (Message message : sentMessages) {
	            Map<String, Object> messageInfo = new HashMap<>();
	            messageInfo.put("message", message);
	            messageInfo.put("recipients", message.getRecipients(Message.RecipientType.TO));
	            messagesList.add(messageInfo);
	        }

	        model.addAttribute("messagesList", messagesList);

	    } catch (MessagingException e) {
	        model.addAttribute("error", "An error occurred while fetching sent emails.");
	    } finally {
	        if (session == null) {
	            closeStoreAndFolder(store, sentFolder);
	        }
	    }

	    return "accounting/mailbox/outbox";
	}
    
    @PostMapping("/account/mail/outdelete.do")
    public String moveMessagesToTrash(@RequestParam(value = "messageIndexes", required = false) String messageIndexesStr,
                                      @RequestParam(value = "selectAll", required = false) String selectAll,
                                      Model model,  Authentication authentication,
                                      HttpServletRequest request) {
        Store store = null;
        Folder outbox = null;
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

            outbox = store.getFolder("[Gmail]/보낸편지함");
            trash = store.getFolder("[Gmail]/휴지통");
            outbox.open(Folder.READ_WRITE);
            trash.open(Folder.READ_WRITE);

            Message[] messages = outbox.getMessages();

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
            
            outbox.close(true);  // 실제로 휴지통으로 이동 및 삭제 적용
            return "redirect:/account/mail/outbox.do";
            
        } catch (MessagingException e) {
            // 예외 처리
        } finally {
            closeStoreAndFolder(store, outbox);
            closeFolder(trash);
        }
        return "redirect:/account/mail/outbox.do";
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
            e.printStackTrace();
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
            e.printStackTrace();
        }
    }
}
