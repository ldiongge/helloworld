package com.ldg.tcm.controller;


import com.ldg.tcm.po.Admintype;
import com.ldg.tcm.service.AdmintypeService;
import com.ldg.tcm.utils.DataGridView;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author 李东阁
 * @since 2021-04-02
 */
@RestController
@RequestMapping("/admintype")
public class AdmintypeController {

    @Autowired
    private AdmintypeService admintypeService;

    @RequestMapping("/torolelist")
    public Object torolelist(){
        List<Admintype> list= admintypeService.list();
        System.out.println(list.toString());
        return new DataGridView(list);
    }
    @RequestMapping("/del")
    public Object del(Integer id){
        admintypeService.removeById(id);
        return new DataGridView("删除成功");
    }
    @RequestMapping("/add")
    public Object add(Admintype admintype){

        admintypeService.saveOrUpdate(admintype);
        return new DataGridView("添加成功");
    }
}

