package com.ldg.tcm.controller;


import com.ldg.tcm.po.GoodsShopcar;
import com.ldg.tcm.po.Oder;
import com.ldg.tcm.service.GoodsShopcarService;
import com.ldg.tcm.service.OderService;
import com.ldg.tcm.utils.DataGridView;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author 李东阁
 * @since 2021-04-11
 */
@Controller
@RequestMapping("/oder")
public class OderController {

    @Autowired
    private OderService oderService;
    @Autowired
    private GoodsShopcarService goodsShopcarService;

    @RequestMapping("/balance")
    @ResponseBody
    public Object balance(Integer[] ids){
        GoodsShopcar shopcar =new GoodsShopcar();
        Oder oder =new Oder();
        for (int i = 0; i < ids.length; i++) {

        }

        return new DataGridView();

    }
}

