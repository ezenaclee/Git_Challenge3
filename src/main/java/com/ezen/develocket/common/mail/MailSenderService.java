package com.ezen.develocket.common.mail;

import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

@Service("mailSenderService")
public class MailSenderService {

	@Autowired
    private JavaMailSenderImpl mailSender;
	private int size;

    //인증키 생성
    private String getKey(int size) {
        this.size = size;
    	return getAuthCode();
    }

    //인증코드 난수 발생
    private String getAuthCode() {
        Random random = new Random();
        StringBuffer buffer = new StringBuffer();
        int num = 0;

        while(buffer.length() < size) {
            num = random.nextInt(10);
            buffer.append(num);
        }

        return buffer.toString();
    }

    //인증메일 보내기
    public String sendAuthMail(String email) {
        //6자리 난수 인증번호 생성 
        String authKey = getKey(6);

        //인증메일 보내기
        try {
            MailUtils sendMail = new MailUtils(mailSender);
            sendMail.setSubject("회원가입 이메일 인증");
            sendMail.setText(new StringBuffer().append("<h1>[이메일 인증]</h1>")
            .append("<p>아래 링크를 클릭하시면 이메일 인증이 완료됩니다.</p>")
            .append("<a href='http://localhost:9080/member/signUpConfirm?email=")
            .append(email)
            .append("&authKey=")
            .append(authKey)
            .append("' target='_blenk'>이메일 인증 확인</a>")
            .toString());
            sendMail.setFrom("이메일 주소", "관리자");
            sendMail.setTo(email);
            sendMail.send();
        } catch (MessagingException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }

          return authKey;
    }
	
	
	
	/*
	 * //mail-context.xml에서 설정한 빈을 자동으로 주입함
	 * 
	 * @Autowired private JavaMailSender mailSender;
	 * 
	 * @Autowired private SimpleMailMessage preConfiguredMessage;
	 * 
	 * @Async public void sendMail(String to, String subject, String body) {
	 * //MimeMessage 타입 객체 생성 MimeMessage message = mailSender.createMimeMessage();
	 * 
	 * try { //메일을 보내기 위해 MimeMessageHelper 객체 생성함. MimeMessageHelper messageHelper
	 * = new MimeMessageHelper(message, true, "UTF-8");
	 * messageHelper.setCc("ezenac2021@naver.com"); //메일 수신 시 지정한 이름으로 표시되게 함.
	 * messageHelper.setFrom("ezenac2021@naver.com", "이젠 IT 아카데미"); //제목, 수신처, 내용
	 * 설정해 메일 보냄 messageHelper.setSubject(subject); messageHelper.setTo(to);
	 * messageHelper.setText(body);
	 * 
	 * mailSender.send(message); } catch (Exception e) {
	 * System.out.println("메일송신 중 오류"); e.printStackTrace(); }
	 * 
	 * }
	 * 
	 * // mail-context.xml에서 미리 설정한 수신 주소로 메일 내용 보냄
	 * 
	 * @Async public void sendPreConfiguredMail(String message) { SimpleMailMessage
	 * mailMessage = new SimpleMailMessage(preConfiguredMessage);
	 * mailMessage.setText(message); mailSender.send(mailMessage); }
	 */
	
}

















