package com.ezen.develocket.common.mail;

import java.io.PrintWriter;
import java.util.Map;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@EnableAsync /*@EnableAsync를 지정해서 메서드 호출할 경우 => 비동기로 동작하게 하는 @Async 애너테이션 기능 사용 가능*/
public class MailSendController {

	//mail-context.xml에서 설정한 빈을 자동으로 주입함
	@Autowired
	private JavaMailSender mailSender;
	
	@RequestMapping(value = "/email/mailCheck", method = RequestMethod.POST) 
	@ResponseBody 
	public String mailCheck(@RequestParam("email") String email) throws Exception{ 
		int serti = (int)((Math.random()* (99999 - 10000 + 1)) + 10000); 
		String from = "develocket@naver.com";
		System.out.println("email:!!!!!!! "+ email);
		//보내는 이 메일주소 
		String to = email; 
		String title = "회원가입시 필요한 인증번호 입니다."; 
		String content = "[인증번호] "+ serti +" 입니다. <br/> 인증번호 확인란에 기입해주십시오."; 
		String num = ""; 
		try { 
			MimeMessage mail = mailSender.createMimeMessage(); 
			MimeMessageHelper mailHelper = new MimeMessageHelper(mail, true, "UTF-8"); 
			mailHelper.setFrom(from); 
			mailHelper.setTo(to); 
			mailHelper.setSubject(title); 
			mailHelper.setText(content, true); 
			mailSender.send(mail); 
			num = Integer.toString(serti); 
		} catch(Exception e) { 
			num = "error";
		 } 
		return num; 
	}







	 
	

}
