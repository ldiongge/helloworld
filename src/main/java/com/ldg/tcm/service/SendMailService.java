package com.ldg.tcm.service;

public interface SendMailService {
    public  void send(String subject,String text,String from,String[] to);
}
