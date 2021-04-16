package com.ldg.tcm.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ldg.tcm.po.Goods;
import com.ldg.tcm.po.GoodsShopcar;
import com.ldg.tcm.service.GoodsService;
import com.ldg.tcm.service.GoodsShopcarService;
import com.ldg.tcm.utils.DataGridView;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ResponseBody;

import java.sql.Time;
import java.util.Date;
import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author 李东阁
 * @since 2021-04-06
 */
@Controller
@RequestMapping("/goodsShopcar")
public class GoodsShopcarController {

    @Autowired
    private GoodsShopcarService goodsShopcarService;
    @Autowired
    private GoodsService goodsService;

    @RequestMapping("/addcar")
    @ResponseBody
    public Object addcar(Integer id,Integer uid){
        Goods goods = goodsService.getById(id);
       GoodsShopcar shopcar =new GoodsShopcar();
       shopcar.setNum(1);
       shopcar.setCreatetime(new Date());
       shopcar.setGoodsid(goods.getId());
       shopcar.setImage(goods.getImage());
       shopcar.setPrice(goods.getPrice());
       shopcar.setSum(goods.getPrice());
       shopcar.setUid(uid);
       shopcar.setGoodsname(goods.getZyname());
       goodsShopcarService.saveOrUpdate(shopcar);
        return new DataGridView("加入购物车成功");
    }
    @RequestMapping("/del")
    @ResponseBody
    public Object del(Integer id){
        goodsShopcarService.removeById(id);

        return new DataGridView("删除成功");
    }
    @RequestMapping("/add")
    public String add(GoodsShopcar shopcar,Integer uid,Model model){
        shopcar.setCreatetime(new Date());
        goodsShopcarService.saveOrUpdate(shopcar);
        QueryWrapper<GoodsShopcar> wrapper =new QueryWrapper<GoodsShopcar>().eq("uid",uid);
        List<GoodsShopcar> shopcars=goodsShopcarService.list(wrapper);
        model.addAttribute("shopcar",shopcars);
        return "MallWeb/shopcar";
    }

    @RequestMapping("/updown")
    @ResponseBody
    public Object upcart(String id){
        GoodsShopcar shopcar= goodsShopcarService.getById(id);
        shopcar.setNum(shopcar.getNum()+1);
        shopcar.setSum(shopcar.getNum()*shopcar.getPrice());
        goodsShopcarService.saveOrUpdate(shopcar);
        return new DataGridView(shopcar);
    }

    @RequestMapping("/down")
    @ResponseBody
    public Object down(String id){
        GoodsShopcar shopcar= goodsShopcarService.getById(id);
        if(shopcar.getNum()==1){
            return new DataGridView("最少购买一个");
        }else{
            shopcar.setNum(shopcar.getNum()-1);
            shopcar.setSum(shopcar.getNum()*shopcar.getPrice());
            goodsShopcarService.saveOrUpdate(shopcar);
            return new DataGridView(shopcar);
        }

    }
    @RequestMapping("/edit")
    @ResponseBody
    public Object edit(String id,Integer num){
        GoodsShopcar shopcar= goodsShopcarService.getById(id);
        if(num<1){
            return new DataGridView("最少购买一个");
        }else{
            shopcar.setNum(num);
            shopcar.setSum(shopcar.getNum()*shopcar.getPrice());
            goodsShopcarService.saveOrUpdate(shopcar);
            return new DataGridView(shopcar);
        }

    }

    @RequestMapping("/balance")
    @ResponseBody
    public Object balance(Integer[] ids){
            GoodsShopcar goodsShopcar =new GoodsShopcar();
        for (int i = 0; i < ids.length; i++) {
            goodsShopcar= goodsShopcarService.getById(ids[i]);
           // goodsShopcar.setIscheck(1);
            goodsShopcarService.saveOrUpdate(goodsShopcar);
        }

        return new DataGridView("test 成功");
    }

    @RequestMapping("/itemadd")
    public String itemadd(GoodsShopcar goodsShopcar,Integer uid){
        Goods goods =new Goods();
        goods =goodsService.getById(goodsShopcar.getGoodsid());
        goodsShopcar.setGoodsname(goods.getZyname());
        goodsShopcar.setUid(uid);
        goodsShopcar.setPrice(goods.getPrice());
        goodsShopcar.setImage(goods.getImage());
        goodsShopcar.setCreatetime(new Date());
        goodsShopcar.setSum(goodsShopcar.getPrice()*goodsShopcar.getNum());
        goodsShopcarService.saveOrUpdate(goodsShopcar);
        return "redirect:/web/cart?uid="+uid;
    }
}

