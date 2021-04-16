package com.ldg.tcm.service.impl;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ldg.tcm.po.Admin;
import com.ldg.tcm.mapper.AdminMapper;
import com.ldg.tcm.service.AdminService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 * 服务实现类
 * </p>
 *
 * @author 李东阁
 * @since 2021-03-25
 */
@Service
public class AdminServiceImpl extends ServiceImpl<AdminMapper, Admin> implements AdminService {
    @Autowired
    private AdminMapper adminMapper;



    @Override
    public void checkStatus(Page<Admin> Page) {
        for (int i = 0; i < Page.getTotal(); i++) {
            if( Page.getRecords().get(i).getStatusid()!=0&&!"".equals(Page.getRecords().get(i).getStatusid())){
                Page.getRecords().get(i).setCheck(true);
            }else {
                Page.getRecords().get(i).setCheck(false);

            }
            System.out.println( Page.getRecords().get(i).getCheck()+"++++++++++++++++++++++++++++++++++");
        }
    }
    public void checkStatusone(Admin admin) {
       if (admin.getStatusid()!=0&&"".equals(admin.getStatusid())){
           admin.setCheck(true);
       }else{
           admin.setCheck(false);

       }
    }
}

