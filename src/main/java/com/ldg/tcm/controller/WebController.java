package com.ldg.tcm.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.ldg.tcm.po.Address;
import com.ldg.tcm.po.Comment;
import com.ldg.tcm.po.Goods;
import com.ldg.tcm.po.GoodsShopcar;
import com.ldg.tcm.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.List;


@Controller
@RequestMapping("/web")
public class WebController {
    @Autowired
    private GoodsService goodsService;
    @Autowired
private CommentService commentService;
    @Autowired
    private GoodsShopcarService goodsShopcarService;
    @Autowired
    private AddressService addressService;

    @RequestMapping("/item")
    public String item(Integer id, Model model){
        Goods goods = goodsService.getById(id);
        QueryWrapper<Comment> queryWrapper=new QueryWrapper<Comment>().eq("goodsid",id);
        queryWrapper.orderByDesc("id");
        List<Comment> list =commentService.list(queryWrapper);
        model.addAttribute("goods",goods);
        model.addAttribute("list",list);
        return "Web/item";
    }

    @RequestMapping("/cart")
    public String cart(Integer uid,Model model){
        QueryWrapper<GoodsShopcar> wrapper =new QueryWrapper<GoodsShopcar>().eq("uid",uid);
        List<GoodsShopcar> list= goodsShopcarService.list(wrapper);
        for (int i = 0; i < list.size(); i++) {
            list.get(i).setSum(list.get(i).getPrice()*list.get(i).getNum());
            list.get(i).setImage(goodsService.getById(list.get(i).getGoodsid()).getImage());
           // goodsShopcarService.saveOrUpdate(list.get(i));
        }
            model.addAttribute("cartlist",list);
        return "Web/cart";
    }
    @RequestMapping("/address")
    public String address(Integer id,Model model){
        QueryWrapper<Address> wrapper =new QueryWrapper<Address>().eq("user_id",id);
        List<Address> list =addressService.list(wrapper);
        model.addAttribute("addresslist",list);
        model.addAttribute("userId",id);
        return "Web/address";
    }

    @RequestMapping("/checkout")
    public String checkout(Integer[] ids, Model model){
        List<GoodsShopcar> list =new ArrayList<>();
        Double sum=0.0;
        GoodsShopcar goodsShopcar =new GoodsShopcar();
        for (int i = 0; i < ids.length; i++) {
            goodsShopcar= goodsShopcarService.getById(ids[i]);
             goodsShopcar.setIscheck(1);
             list.add(goodsShopcar);
             sum=sum+goodsShopcar.getSum();
            goodsShopcarService.saveOrUpdate(goodsShopcar);
        }


//            QueryWrapper<GoodsShopcar> wrapper =new QueryWrapper<GoodsShopcar>().eq("uid",id).eq("ischeck",1);
//            List<GoodsShopcar> list= goodsShopcarService.list(wrapper);
           QueryWrapper<Address> adwrapper = new QueryWrapper<Address>().eq("user_id",list.get(0).getUid()).eq("isdef",1);
            List<Address> addressList = addressService.list(adwrapper);
        for (int i = 0; i < list.size(); i++) {
            list.get(i).setSum(list.get(i).getPrice()*list.get(i).getNum());
            list.get(i).setImage(goodsService.getById(list.get(i).getGoodsid()).getImage());
        }


            model.addAttribute("order",list);
        model.addAttribute("ordersum",sum);
        model.addAttribute("addresslist",addressList);
        return "Web/checkout";
    }






}
