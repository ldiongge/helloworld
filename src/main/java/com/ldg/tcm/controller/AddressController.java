package com.ldg.tcm.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.ldg.tcm.po.Address;
import com.ldg.tcm.service.AddressService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.stereotype.Controller;

import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author 李东阁
 * @since 2021-04-07
 */
@Controller
@RequestMapping("/address")
public class AddressController {
    @Autowired
    private AddressService addressService;
    @Autowired
    private SysController sysController;

    @RequestMapping("/addaddress")
    public String add(Address address, Model model)
    {
        addressService.saveOrUpdate(address);
        QueryWrapper<Address> wrapper =new QueryWrapper<Address>().eq("user_id",address.getUserId());
        List<Address> list =addressService.list(wrapper);
        model.addAttribute("addresslist",list);
        model.addAttribute("userId",address.getUserId());
        return "Web/address";
    }

    @RequestMapping("/del")
    public String del(Integer id,Integer uid,Model model){

        Address address=addressService.getById(id);
        if(address!=null){
            addressService.removeById(id);
            QueryWrapper<Address> wrapper =new QueryWrapper<Address>().eq("user_id",address.getUserId());
            List<Address> list =addressService.list(wrapper);
            model.addAttribute("addresslist",list);
            model.addAttribute("userId",address.getUserId());
        }else {
            QueryWrapper<Address> wrapper =new QueryWrapper<Address>().eq("user_id",uid);
            List<Address> list =addressService.list();
            model.addAttribute("addresslist",list);
            model.addAttribute("userId",uid);
        }
        return "Web/address";
    }


}

