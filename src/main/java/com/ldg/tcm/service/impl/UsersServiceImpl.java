package com.ldg.tcm.service.impl;

import com.ldg.tcm.po.Users;
import com.ldg.tcm.mapper.UsersMapper;
import com.ldg.tcm.service.UsersService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author 李东阁
 * @since 2021-04-02
 */
@Service
public class UsersServiceImpl extends ServiceImpl<UsersMapper, Users> implements UsersService {

}
