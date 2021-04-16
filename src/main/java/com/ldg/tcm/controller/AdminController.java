package com.ldg.tcm.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ldg.tcm.po.Admin;
import com.ldg.tcm.po.Admintype;
import com.ldg.tcm.po.Regcode;
import com.ldg.tcm.service.AdminService;
import com.ldg.tcm.service.AdmintypeService;
import com.ldg.tcm.service.RegcodeService;
import com.ldg.tcm.utils.DataGridView;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.util.DigestUtils;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;
import java.util.List;

/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author 李东阁
 * @since 2021-03-25
 */
@Controller
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    private AdminService adminService;
    @Autowired
    private RegcodeService regcodeService;
    @Autowired
    private AdmintypeService admintypeService;


    @RequestMapping("/login")
    @ResponseBody
    public Object login(Admin admin) {
        System.out.println(admin.getPassword());
        Admin admin1 = adminService.getOne(new QueryWrapper<Admin>().eq("username", admin.getUsername()).eq("password", DigestUtils.md5DigestAsHex(admin.getPassword().getBytes())));
        if (admin1 != null) {
             //request.setAttribute("admin",admin);
            Admintype type = admintypeService.getById(admin1.getRole());

            admin1.setRolename(type.getTypename());
            return new DataGridView(admin1);

        } else {
            return new DataGridView(null);
        }
    }

    @RequestMapping("/Adminlist")
    @ResponseBody
    public Object Adminlist(String content, Integer page, Integer limit) {
        DataGridView dataGridView = new DataGridView();
        if (content != null) {
            QueryWrapper<Admin> wrapper = new QueryWrapper<>();
            wrapper.like("username", "%" + content + "%").or().like("nickname", "%" + content + "%").or().like("email", "%" + content + "%")
                    .or().like("phone", "%" + content + "%");

         //   List<Admin> admins =adminService.list();

            Page<Admin> adminPage = new Page<>(page, limit);
            adminService.page(adminPage, wrapper);
            System.out.println(adminPage.getTotal()+"++++++++++++++++++++++++++++++++++++++++");
            for (int i = 0; i < adminPage.getRecords().size(); i++) {
                Admintype type = admintypeService.getById(adminPage.getRecords().get(i).getRole());

                adminPage.getRecords().get(i).setRolename(type.getTypename());
                if( adminPage.getRecords().get(i).getStatusid()!=0&&null!=adminPage.getRecords().get(i).getStatusid()){
                    adminPage.getRecords().get(i).setCheck(true);
                }else {
                    adminPage.getRecords().get(i).setCheck(false);

                }
                System.out.println( adminPage.getRecords().get(i).getCheck()+"++++++++++++++++++++++++++++++++++");
            }
            dataGridView.setPage(page);
            dataGridView.setLimit(limit);
            dataGridView.setData(adminPage.getRecords());
            dataGridView.setCount(adminPage.getTotal());
            return dataGridView;
        } else {
            Page<Admin> adminPage = new Page<>(page, limit);
            adminService.page(adminPage,null);
            for (int i = 0; i < adminPage.getRecords().size(); i++) {
                Admintype type = admintypeService.getById(adminPage.getRecords().get(i).getRole());

                adminPage.getRecords().get(i).setRolename(type.getTypename());
                if( adminPage.getRecords().get(i).getStatusid()!=0&&null!=adminPage.getRecords().get(i).getStatusid()){
                    adminPage.getRecords().get(i).setCheck(true);
                }else {
                    adminPage.getRecords().get(i).setCheck(false);

                }
                System.out.println( adminPage.getRecords().get(i).getCheck()+"++++++++++++++++++++++++++++++++++");
            }

            dataGridView.setPage(page);
            dataGridView.setLimit(limit);
            dataGridView.setData(adminPage.getRecords());
            dataGridView.setCount(adminPage.getTotal());
            return dataGridView;
        }

    }

    @RequestMapping("/regist")
    @ResponseBody
    public Object regist(Admin admin, String vercode) {
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
                admin.setPassword(DigestUtils.md5DigestAsHex(admin.getPassword().getBytes()));
                admin.setCreatetime(new Date());
                admin.setStatusid(0);
                admin.setRole(5);
                adminService.save(admin);
                System.out.println(admin.toString());
                dataGridView.setData(admin);
                return dataGridView;
            } else {
                return new DataGridView(0L, "注册码已使用", null);
            }

        } else {
            return new DataGridView(0L, "注册码无效", null);
        }

    }

    @RequestMapping("/editinfo")
    @ResponseBody
    public Object editinfo(Admin admin) {
        System.out.println("+++++++++++++++++++++++++++++++++++");
        System.out.println(admin.toString());
        System.out.println("+++++++++++++++++++++++++++++++++++");
        admin.setUpdatetime(new Date());
        adminService.saveOrUpdate(admin);
        Admintype type = admintypeService.getById(admin.getRole());

        admin.setRolename(type.getTypename());
        return new DataGridView(0L, "修改成功", admin);

    }

    @RequestMapping("/editpassword")
    @ResponseBody
    public Object editpassword(String oldPassword, String password, Integer id) {
        Admin admin = adminService.getById(id);
        //与旧密码匹配
        if (admin.getPassword().equals(DigestUtils.md5DigestAsHex(oldPassword.getBytes()))) {
            //新密码加密写入
            admin.setPassword(DigestUtils.md5DigestAsHex(password.getBytes()));
            admin.setUpdatetime(new Date());
            adminService.saveOrUpdate(admin);
            Admintype type = admintypeService.getById(admin.getRole());
            admin.setRolename(type.getTypename());
            return new DataGridView(0L, null, admin);
        } else {
            Admintype type = admintypeService.getById(admin.getRole());
            admin.setRolename(type.getTypename());
            return new DataGridView(0L, "旧密码输入错误", admin);
        }

    }

    @RequestMapping("/delete")
    @ResponseBody
    public Object delete(String id) {

        System.out.println("+++++++++++++++++++++" + id);
        adminService.removeById(id);

        return new DataGridView("删除成功");
    }

    @RequestMapping("/delAll")
    @ResponseBody
    public Object removes(String isStr) {
        if (isStr != null && !isStr.equals("")) {

            String[] ids = isStr.split(",");
            for (String id : ids) {
                if (id != null && !id.equals("")) {
                    adminService.removeById(id);

                }
            }
        }
          DataGridView dataGridView =new DataGridView();
        dataGridView.setMsg("删除成功");
        return dataGridView;
    }

    @RequestMapping("/add")
    @ResponseBody
    public Object add(Admin admin){
        if(admin.getCheck()!=null){
            admin.setCreatetime(new Date());
            admin.setStatusid(1);
        }else {
            admin.setCreatetime(new Date());

            admin.setStatusid(0);

        }
        adminService.saveOrUpdate(admin);
        return new DataGridView("添加成功");
    }

}

