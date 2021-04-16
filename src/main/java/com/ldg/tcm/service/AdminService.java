package com.ldg.tcm.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ldg.tcm.po.Admin;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author 李东阁
 * @since 2021-03-25
 */
public interface AdminService extends IService<Admin> {
    public void checkStatus(Page<Admin> page);
    public void checkStatusone(Admin admin);
}
