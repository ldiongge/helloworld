package com.ldg.tcm.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ldg.tcm.po.DbOrder;
import com.ldg.tcm.po.GoodsShopcar;
import com.ldg.tcm.po.Oder;
import com.ldg.tcm.po.Users;
import com.ldg.tcm.service.DbOrderService;
import com.ldg.tcm.service.GoodsShopcarService;
import com.ldg.tcm.service.OderService;
import com.ldg.tcm.utils.DataGridView;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.annotation.Order;
import org.springframework.ui.Model;
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
 * @since 2021-04-04
 */
@Controller
@RequestMapping("/order")
public class DbOrderController {

    @Autowired
    private DbOrderService dbOrderService;
    @Autowired
    private GoodsShopcarService goodsShopcarService;
    @Autowired
    private OderService oderService;

    @RequestMapping("/orderlist")
    @ResponseBody
    private Object orderlist(String content, Integer page, Integer limit){
        DataGridView dataGridView = new DataGridView();
        if (content != null) {
            QueryWrapper<Oder> wrapper = new QueryWrapper<>();
            wrapper.like("gooddname", "%" + content + "%").or().like("id", "%" + content + "%").or().like("email", "%" + content + "%")
                    .or().like("phone", "%" + content + "%");

            Page<Oder> orderPage = new Page<>(page, limit);
            oderService.page(orderPage, wrapper);
            dataGridView.setPage(page);
            dataGridView.setLimit(limit);
            dataGridView.setData(orderPage.getRecords());
            dataGridView.setCount(orderPage.getTotal());
            return dataGridView;
        } else {
            Page<Oder> orderPage = new Page<Oder>(page, limit);
            oderService.page(orderPage,null);
            dataGridView.setPage(page);
            dataGridView.setLimit(limit);
            dataGridView.setData(orderPage.getRecords());
            dataGridView.setCount(orderPage.getTotal());
            return dataGridView;
        }


    }
    @RequestMapping("/add")
    public String add(Integer cid, Integer uid, Model model){
       GoodsShopcar shopcar = goodsShopcarService.getById(cid);
       DbOrder order= new DbOrder();
       order.setUid(shopcar.getUid());
       order.setIsPay(1);
       order.setCreatetime(new Date());
       order.setOrderid(shopcar.getId().toString());
       order.setPayPrice(shopcar.getPrice()*shopcar.getNum());
       dbOrderService.save(order);
       QueryWrapper<DbOrder> wrapper =new QueryWrapper<DbOrder>().eq("uid",uid);
       List<DbOrder> dbOrders=dbOrderService.list(wrapper);
       model.addAttribute("shopcar",shopcar);
       model.addAttribute("list",dbOrders);
        return "MallWeb/orderlist";
    }
    @RequestMapping("/editform")
    public Object edit(Oder order){

        System.out.println(  order.getNumber()+"++++++++++++++++++++++++++++++++++++++++");
        oderService.saveOrUpdate(order);
        return new DataGridView();
    }
    @RequestMapping("/del")
    @ResponseBody
    public Object del(Integer id){
        oderService.removeById(id);
        return new DataGridView("删除成功");
    }
}

