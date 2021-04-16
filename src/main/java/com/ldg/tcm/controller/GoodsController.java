package com.ldg.tcm.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ldg.tcm.po.Admin;
import com.ldg.tcm.po.Goods;
import com.ldg.tcm.po.Goodstype;
import com.ldg.tcm.service.GoodsService;
import com.ldg.tcm.service.GoodstypeService;
import com.ldg.tcm.utils.DataGridView;
import org.springframework.beans.factory.annotation.Autowired;
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
@RequestMapping("/goods")
public class GoodsController {

    @Autowired
    private GoodsService goodsService;
    @Autowired
    private GoodstypeService goodstypeService;

    @RequestMapping("/goodslist")
    @ResponseBody
    public Object goodslist(String params, Integer page, Integer limit){
        DataGridView dataGridView =new DataGridView();
        System.out.println("++++++++++++++++++++++"+params);
//        dataGridView.setLimit(limit);
//        dataGridView.setPage(page);
if(params!=null&&!"".equals(params)){
    QueryWrapper<Goods> wrapper =new QueryWrapper<>();
    wrapper.like("zyname",params);
    Page<Goods> goodsPage =new Page<>(page,limit);
   goodsService.page(goodsPage,wrapper);

    for (int i = 0; i < goodsPage.getRecords().size(); i++) {
        goodsPage.getRecords().get(i).setTypename(goodstypeService.getById( goodsPage.getRecords().get(i).getTypeid()).getTypename());
    }
    dataGridView.setCount((long)goodsService.list().size());
    dataGridView.setData(goodsPage);
    return dataGridView;
}else {
    List<Goods> list =goodsService.list();
    for (int i = 0; i < list.size(); i++) {
        list.get(i).setTypename(goodstypeService.getById(  list.get(i).getTypeid()).getTypename());
    }
    dataGridView.setCount((long)goodsService.list().size());
    dataGridView.setData(list);
    return dataGridView;
}

    }
    @RequestMapping("/delete")
    @ResponseBody
    public Object delete(Integer id){
        goodsService.removeById(id);
        return new DataGridView();
    }
    @RequestMapping("/addGoods")
    @ResponseBody
    public Object addGoods(Goods goods){

           goods .setCreatetime(new Date());
            //如果不是默认图片就去掉图片的_temp的后缀
          goodsService.saveOrUpdate(goods);
            return new DataGridView("修改成功");

    }
    @RequestMapping("/del")
    @ResponseBody
    public Object del(Integer id){

        goodsService.removeById(id);
        return new DataGridView();
    }


}

