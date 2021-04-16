package com.ldg.tcm.service.impl;

import com.ldg.tcm.po.Comment;
import com.ldg.tcm.mapper.CommentMapper;
import com.ldg.tcm.service.CommentService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author 李东阁
 * @since 2021-04-12
 */
@Service
public class CommentServiceImpl extends ServiceImpl<CommentMapper, Comment> implements CommentService {

}
