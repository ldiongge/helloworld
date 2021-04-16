package com.ldg.tcm.service.impl;


import com.ldg.tcm.service.SendMailService;
import com.ldg.tcm.utils.SendMailUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

@Service
public class SendMailServiceImpl implements SendMailService {
    @Autowired
    private JavaMailSender javaMailSender;
    @Override
    @Async
    public void send(String subject, String text, String from, String[] to) {
        SendMailUtil.sendMail(javaMailSender, subject, text, from, to);
    }
}
