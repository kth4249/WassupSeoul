package com.kh.wassupSeoul.common;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.kh.wassupSeoul.member.model.vo.Member;

public class ChatHandler extends TextWebSocketHandler {

	private List<WebSocketSession> sessionList = new ArrayList();
	private Logger logger = LoggerFactory.getLogger(ChatHandler.class);

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		sessionList.add(session);
		Member loginMember = (Member)session.getAttributes().get("loginMember");
		System.out.println("채팅방 입장자 :"+ loginMember.getMemberNickname());
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		Member loginMember = null;
		System.out.println("보낸 메시지 :" + message);
										// 받을놈 번호, 룸번호, 메시지 내용
		
		for (WebSocketSession sss : sessionList) {
			loginMember = (Member)sss.getAttributes().get("loginMember");
		
			if(loginMember.getMemberNo() == Integer.parseInt(message.getPayload())) {
			sss.sendMessage(message);
		}
			
		}
			
			
	}
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		sessionList.remove(session);
	}
}
