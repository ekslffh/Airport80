package kr.or.ddit.common.interceptor;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import kr.or.ddit.common.chat.service.ChatRoomMsgService;

@Component
public class NotificationInterceptor implements HandlerInterceptor {

    @Inject
    private ChatRoomMsgService chatRoomMsgService;

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response,
                           Object handler, ModelAndView modelAndView) throws Exception {
    	if (modelAndView != null) {
            Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
            String username = authentication.getName(); // 현재 사용자의 아이디
            int unreadNotificationCount = chatRoomMsgService.cntUnreadListByMember(username);
            modelAndView.addObject("unreadNotificationCount", unreadNotificationCount == 0 ? null : unreadNotificationCount);
        }
    }
}