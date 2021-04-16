package com.ldg.tcm.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ldg.tcm.po.Comment;
import com.ldg.tcm.service.CommentService;
import com.ldg.tcm.service.UsersService;
import com.ldg.tcm.utils.DataGridView;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author 李东阁
 * @since 2021-04-12
 */
@Controller
@RequestMapping("/comment")
public class CommentController {
    @Autowired
    private CommentService commentService;
    @Autowired
    private UsersService usersService;

    @RequestMapping("/add")
    @ResponseBody
    public Object add(String text,Integer uid,Integer goodsid){
        Comment comment =new Comment();
        comment.setContent(text);
        comment.setGoodsid(goodsid);
        comment.setUid(uid);
        comment.setUsername(usersService.getById(uid).getUsername());
        comment.setCreatetime(new Date());
        commentService.save(comment);
        return new DataGridView("评论成功");
    }
    @RequestMapping("/comment")
    @ResponseBody
    public Object comment(String content, Integer page, Integer limit){
        DataGridView dataGridView = new DataGridView();
        if (content != null) {
            QueryWrapper<Comment> wrapper = new QueryWrapper<Comment>();
            wrapper.like("username", "%" + content + "%").or().like("content", "%" + content + "%").or().like("uid", "%" + content + "%");
            Page<Comment> commentPage = new Page<>(page, limit);
            commentService.page(commentPage, wrapper);
            dataGridView.setPage(page);
            dataGridView.setLimit(limit);
            dataGridView.setData(commentPage.getRecords());
            dataGridView.setCount(commentPage.getTotal());
            return dataGridView;
        }else {
            Page<Comment> commentPage = new Page<>(page, limit);
            commentService.page(commentPage, null);
            dataGridView.setPage(page);
            dataGridView.setLimit(limit);
            dataGridView.setData(commentPage.getRecords());
            dataGridView.setCount(commentPage.getTotal());
            return dataGridView;
        }
    }
    @RequestMapping("/del")
    @ResponseBody
    public Object del(Integer id){
        commentService.removeById(id);
        return new DataGridView("删除成功");
    }

}

