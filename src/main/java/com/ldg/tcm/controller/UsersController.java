package com.ldg.tcm.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ldg.tcm.po.Admin;
import com.ldg.tcm.po.Admintype;
import com.ldg.tcm.po.Regcode;
import com.ldg.tcm.po.Users;
import com.ldg.tcm.service.RegcodeService;
import com.ldg.tcm.service.UsersService;
import com.ldg.tcm.utils.DataGridView;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.util.DigestUtils;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;
import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author 李东阁
 * @since 2021-04-02
 */
@Controller
@RequestMapping("/users")
public class UsersController {
    @Autowired
    private UsersService usersService;
    @Autowired
    private RegcodeService regcodeService;

    @RequestMapping("/userlist")
    @ResponseBody
    public Object userlist(String content, Integer page, Integer limit){
        System.out.println("++++++++++++++++++++++"+page+"+++++++++++++++++"+limit);
        DataGridView dataGridView = new DataGridView();
        if (content != null) {
            QueryWrapper<Users> wrapper = new QueryWrapper<>();
            wrapper.like("username", "%" + content + "%").or().like("sex", "%" + content + "%").or().like("email", "%" + content + "%")
                    .or().like("phone", "%" + content + "%");

            Page<Users> usersPage = new Page<>(page, limit);
            usersService.page(usersPage, wrapper);
            dataGridView.setPage(page);
            dataGridView.setLimit(limit);
            dataGridView.setData(usersPage.getRecords());
            dataGridView.setCount(usersPage.getTotal());
            return dataGridView;
        } else {
            Page<Users> usersPage = new Page<>(page, limit);
            usersService.page(usersPage,null);
            dataGridView.setPage(page);
            dataGridView.setLimit(limit);
            dataGridView.setData(usersPage.getRecords());
            dataGridView.setCount(usersPage.getTotal());
            return dataGridView;
        }

    }
    @RequestMapping("/add")
    @ResponseBody
    public Object add(Users users){
        System.out.println("++++++++++++++++++++++");
        System.out.println(users.getId());
        users.setJointime(new Date());
        usersService.saveOrUpdate(users);
        return new DataGridView();
    }
    @RequestMapping("/del")
    @ResponseBody
    public Object add(Integer id){
        usersService.removeById(id);
        return new DataGridView("删除成功");
    }

    @RequestMapping("/regist")
    @ResponseBody
    public Object regist(Users users, String vercode) {
        DataGridView dataGridView = new DataGridView();//视图
        //匹配验证码
        Regcode emailcode = regcodeService.getOne(new QueryWrapper<Regcode>().eq("code", vercode));
        //验证码存在
        if (emailcode != null) {
            //验证码未使用 createtime==null 判断数据库中该验证码是否有createtime 如果为null 证明没有用过
            if (emailcode.getCreatetime() == null) {
                //写入createtime 表示该验证码已使用
                emailcode.setCreatetime(new Date());
                regcodeService.saveOrUpdate(emailcode);
                //密码md5加密
                users.setPassword(DigestUtils.md5DigestAsHex(users.getPassword().getBytes()));
                users.setJointime(new Date());
                usersService.save(users);
                System.out.println(users.toString());
                dataGridView.setData(users);
                return dataGridView;
            } else {
                return new DataGridView(0L, "注册码已使用", null);
            }

        } else {
            return new DataGridView(0L, "注册码无效", null);
        }

    } @RequestMapping("/login")
    @ResponseBody
    public Object login(Users users) {
        System.out.println(users.getPassword());
        Users users1 = usersService.getOne(new QueryWrapper<Users>().eq("username", users.getUsername()).eq("password", DigestUtils.md5DigestAsHex(users.getPassword().getBytes())));
        if (users1 != null) {
            //request.setAttribute("admin",admin)
            return new DataGridView(users1);

        } else {
            return new DataGridView(null);
        }
    }

    @RequestMapping("/edit")
    @ResponseBody
    public Object edit(Users users){
        usersService.saveOrUpdate(users);
        return new DataGridView(0L,"修改成功",users);
    }
    @RequestMapping("/editpassword")
    @ResponseBody
    public Object editpassword(String oldPassword, String password, Integer id) {
        Users users  = usersService.getById(id);
        //与旧密码匹配
        if (users.getPassword().equals(DigestUtils.md5DigestAsHex(oldPassword.getBytes()))) {
            //新密码加密写入
            users.setPassword(DigestUtils.md5DigestAsHex(password.getBytes()));
            usersService.saveOrUpdate(users);
            return new DataGridView(0L, null, users);
        } else {
            return new DataGridView(0L, "旧密码输入错误", users);
        }

    }

}

