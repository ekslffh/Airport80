package kr.or.ddit.accounting.mail.controller;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.common.employee.service.EmpService;
import kr.or.ddit.common.schedule.service.ScheduleService;
import kr.or.ddit.common.vo.AccountWrapper;
import kr.or.ddit.common.vo.EmployeeVO;
import lombok.RequiredArgsConstructor;

import javax.mail.*;
import javax.servlet.http.HttpServletRequest;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

@Controller
@RequiredArgsConstructor
public class DeleteMailboxController {

    @GetMapping("/account/mail/deletebox.do")
	public String trash(Model model, Authentication authentication) {
	    Store store = null;
	    Folder trash = null;
	    Session session = null;

	    AccountWrapper wrapper = (AccountWrapper) authentication.getPrincipal();
	    EmployeeVO empVO = (EmployeeVO) wrapper.getRealUser();

	    try {
	        Properties props = new Properties();
	        props.put("mail.store.protocol", "imaps");

	        session = Session.getDefaultInstance(props, null);
	        store = session.getStore("imaps");
	        store.connect("imap.gmail.com", empVO.getEmpEmail(), empVO.getEmpEmailPass());

	        trash = store.getFolder("[Gmail]/휴지통");
	        trash.open(Folder.READ_ONLY);

	        Message[] messages = trash.getMessages();

	        List<Map<String, Object>> messagesList = new ArrayList<>();
	        for (Message message : messages) {
	            Map<String, Object> messageInfo = new HashMap<>();
	            messageInfo.put("message", message);
	            messageInfo.put("recipients", message.getRecipients(Message.RecipientType.TO));
	            messagesList.add(messageInfo);
	        }

	        model.addAttribute("messagesList", messagesList);

	    } catch (MessagingException e) {
	        // 메시징 익셉션 무시하고 진행
	    } finally {
	        if (session == null) {
	            closeStoreAndFolder(store, trash);
	        }
	    }

	    return "accounting/mailbox/deletebox";
	}
    @PostMapping("/account/mail/recover.do")
    public String recoverMessagesFromTrash(@RequestParam(value = "messageIndexes", required = false) String messageIndexesStr,
                                           Model model, Authentication authentication,
                                           HttpServletRequest request) {
        Store store = null;
        Folder trash = null;
        Folder inbox = null;

        AccountWrapper wrapper = (AccountWrapper) authentication.getPrincipal();
        EmployeeVO empVO = (EmployeeVO) wrapper.getRealUser();

        String username = empVO.getEmpEmail();
        String password = empVO.getEmpEmailPass();

        try {
            Properties props = new Properties();
            props.put("mail.store.protocol", "imaps");

            Session session = Session.getDefaultInstance(props, null);
            store = session.getStore("imaps");
            store.connect("imap.gmail.com", username, password);

            trash = store.getFolder("[Gmail]/휴지통");
            inbox = store.getFolder("INBOX");
            trash.open(Folder.READ_WRITE);
            inbox.open(Folder.READ_WRITE);

            Message[] messages = trash.getMessages();

            if (messageIndexesStr != null && !messageIndexesStr.isEmpty()) {
                String[] messageIndexesArr = messageIndexesStr.split(",");
                int[] messageIndexes = new int[messageIndexesArr.length];

                for (int i = 0; i < messageIndexesArr.length; i++) {
                    try {
                        messageIndexes[i] = Integer.parseInt(messageIndexesArr[i]);
                    } catch (NumberFormatException e) {
                        // 예외 처리: 유효하지 않은 인덱스는 무시하고 계속 진행
                    }
                }

                for (int messageIndex : messageIndexes) {
                    if (messageIndex >= 0 && messageIndex < messages.length) {
                        Message message = messages[messageIndex];
                        try {
                            if (!message.isSet(Flags.Flag.DELETED)) {
                                copyMessageToFolder(message, inbox);
                                message.setFlag(Flags.Flag.DELETED, true);
                            }
                        } catch (MessageRemovedException ex) {
                            // 이미 삭제된 메시지는 무시하고 계속 진행
                        }
                    }
                }
            }
            trash.close(true);  // 복구 적용

            return "redirect:/account/mail/deletebox.do";
        } catch (MessagingException e) {
            e.printStackTrace();
            model.addAttribute("error", "복구"); // api사용중
        } finally {
            closeStoreAndFolder(store, inbox);
        }

        return "redirect:/account/mail/deletebox.do";
    }

    
    @PostMapping("/account/mail/realDelete.do")
    public String deleteMessages(@RequestParam(value = "messageIndexes", required = false) String messageIndexesStr,
                                 @RequestParam(value = "selectAll", required = false) String selectAll,
                                 Model model,Authentication authentication,
                                 HttpServletRequest request) {
        Store store = null;
        Folder inbox = null;

        AccountWrapper wrapper = (AccountWrapper) authentication.getPrincipal();
        EmployeeVO empVO = (EmployeeVO) wrapper.getRealUser();
        
		String username = empVO.getEmpEmail();
		String password = empVO.getEmpEmailPass();
        
        try {
            Properties props = new Properties();
            props.put("mail.store.protocol", "imaps");

            Session session = Session.getDefaultInstance(props, null);
            store = session.getStore("imaps");
            store.connect("imap.gmail.com", username, password);

            inbox = store.getFolder("[Gmail]/휴지통");
            inbox.open(Folder.READ_WRITE);

            Message[] messages = inbox.getMessages();

            if (selectAll != null && selectAll.equals("true")) {
                for (int i = 0; i < messages.length; i++) {
                    messages[i].setFlag(Flags.Flag.DELETED, true);
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

                for (int messageIndex : messageIndexes) {
                    if (messageIndex >= 0 && messageIndex < messages.length) {
                        Message message = messages[messageIndex];
                        message.setFlag(Flags.Flag.DELETED, true);
                    }
                }
            }
            inbox.close(true);  // 실제로 삭제 적용

            try {
                String referer = request.getHeader("Referer");
                String message = URLEncoder.encode("영구 삭제가 완료되었습니다", "UTF-8");
                return "redirect:" + referer + "?message=" + message;
            } catch (UnsupportedEncodingException e) {
                return "오류 발생"; // 예외 처리 방법에 따라 적절한 응답을 반환합니다.
            }
        } catch (MessagingException e) {
            e.printStackTrace();
            model.addAttribute("error", "삭제중 에러 발생했습니다.");
        } finally {
            closeStoreAndFolder(store, inbox);
        }

        return "accounting/mailbox/inbox";
    }

    
    private void copyMessageToFolder(Message message, Folder destinationFolder) throws MessagingException {
        Folder sourceFolder = message.getFolder();
        sourceFolder.copyMessages(new Message[]{message}, destinationFolder);
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
