package com.ldg.tcm.service.impl;

import com.ldg.tcm.po.Status;
import com.ldg.tcm.mapper.StatusMapper;
import com.ldg.tcm.service.StatusService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author 李东阁
 * @since 2021-03-30
 */
@Service
public class StatusServiceImpl extends ServiceImpl<StatusMapper, Status> implements StatusService {

}
