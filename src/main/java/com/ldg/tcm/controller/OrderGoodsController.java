package com.ldg.tcm.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.ldg.tcm.po.Goods;
import com.ldg.tcm.po.GoodsShopcar;
import com.ldg.tcm.po.Oder;
import com.ldg.tcm.po.Users;
import com.ldg.tcm.service.*;
import com.sun.org.apache.xpath.internal.operations.Or;
import lombok.AllArgsConstructor;
import org.omg.CORBA.ORB;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.stereotype.Controller;

import java.util.Date;
import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author 李东阁
 * @since 2021-04-11
 */
@Controller
@RequestMapping("/order")
public class OrderGoodsController {
    @Autowired
   private GoodsService goodsService;
    @Autowired
    private GoodsShopcarService goodsShopcarService;
    @Autowired
    private OderService oderService;
    @Autowired
    private SendMailService sendMailService;
    @Autowired
    private UsersService usersService;
    @RequestMapping("/pay")
    public String pay(Integer id, Model model){
        QueryWrapper<GoodsShopcar> wrapper =new QueryWrapper<GoodsShopcar>().eq("uid",id).eq("ischeck",1);
        List<GoodsShopcar> goodsShopcarList = goodsShopcarService.list(wrapper);
        Double sum=0.0;
        Oder oder=new Oder();
        for (int i = 0; i < goodsShopcarList.size(); i++) {
            oder.setGooddname(goodsShopcarList.get(i).getGoodsname());
            oder.setNum(goodsShopcarList.get(i).getNum());
            oder.setIscheck(goodsShopcarList.get(i).getIscheck());
            oder.setSum(goodsShopcarList.get(i).getSum());
            oder.setPrice(goodsShopcarList.get(i).getPrice());
            oder.setIscheck(1);
            oder.setUid(id);
            oder.setCreatetime(new Date());
            oderService.save(oder);
            sum+=goodsShopcarList.get(i).getSum();
        }
        QueryWrapper<Oder> oderQueryWrapper =new QueryWrapper<Oder>().eq("uid",id).eq("ischeck",1);
        List<Oder> oderList = oderService.list(oderQueryWrapper);
        model.addAttribute("orderlist",oderList);
        model.addAttribute("ordersum",sum);
        return "Web/pay";
    }

    @RequestMapping("/ispay")
    public String ispay(Integer id,Model model){
        Double sum=0.0;
        Users user = usersService.getById(id);
        QueryWrapper<Oder> wrapper =new QueryWrapper<Oder>().eq("uid",id).eq("ischeck",1);
        List<Oder> oderList= oderService.list(wrapper);
        for (int i = 0; i < oderList.size(); i++) {
            sum+=oderList.get(i).getSum();
        }
        sendMailService.send("【中药材交易平台】", "用户:"+user.getUsername()+"用户id"+user.getId()+"购买了产品共计"+sum+"元,请及时发货", "lidonggeywzq@163.com", new String[]{"1737776316@qq.com"});
            sum=0.0;
        QueryWrapper<GoodsShopcar> queryWrapper =new QueryWrapper<GoodsShopcar>().eq("uid",id).eq("ischeck",1);
        goodsShopcarService.remove(queryWrapper);

        for (int i = 0; i < oderList.size(); i++) {
                oderList.get(i).setIspay(1);
                QueryWrapper<Goods> wrapper1 = new QueryWrapper<Goods>().eq("zyname",oderList.get(i).getGooddname());
                oderList.get(i).setImage(goodsService.getOne(wrapper1).getImage());
                oderService.saveOrUpdate(oderList.get(i));
                sum+=oderList.get(i).getSum();
        }
        model.addAttribute("orderlist",oderList);
        model.addAttribute("ordersum",sum);
        return "Web/order";
    }

}

