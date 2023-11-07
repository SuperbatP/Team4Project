package com.PhoenixHospital.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Service;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Random;

@Service
public class MailService {
    @Autowired
    JavaMailSenderImpl mailSender;

    public String mailSend(String email) throws MessagingException {
        MimeMessage mimeMessage = mailSender.createMimeMessage();

        String randomKey = getRamdom();
        mimeMessage.setSubject("인증번호 확인하세요.");
        mimeMessage.setText("인증번호 : " + randomKey );
        mimeMessage.addRecipient(Message.RecipientType.TO, new InternetAddress(email));

        mailSender.send(mimeMessage);
        return randomKey;

    }

    private  String getRamdom(){
        Random random = new Random();
        StringBuffer sb = new StringBuffer();
        for (int i = 0; i < 6; i++) {
            sb.append(random.nextInt(10)); //0~9값
        }

        return sb.toString();
    }
}
