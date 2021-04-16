package com.ldg.tcm.service.impl;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ldg.tcm.po.Admintype;
import com.ldg.tcm.po.Goods;
import com.ldg.tcm.mapper.GoodsMapper;
import com.ldg.tcm.po.Goodstype;
import com.ldg.tcm.service.GoodsService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ldg.tcm.service.GoodstypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author 李东阁
 * @since 2021-04-02
 */
@Service
public class GoodsServiceImpl extends ServiceImpl<GoodsMapper, Goods> implements GoodsService {
@Autowired
private GoodsMapper goodsMapper;
@Autowired
private GoodstypeService goodstypeService;

    @Override
    public List<Goods> selectGoodsAll(List<Goods> page, String content) {
        if(content!=null&&!"".equals(content)){
            List<Goods> list =   goodsMapper.selectGoodsAll(page,"%"+content+"%");
           for (int i = 0; i < list.size(); i++) {
               page.get(i).setTypename( page.get(i).getType().getTypename());
           }
            return list;
        }else {
            List<Goods> list =   goodsMapper.selectGoodsAll(page,"%");
          for (int i = 0; i < list.size(); i++) {
              page.get(i).setTypename( page.get(i).getType().getTypename());
          }
            return list;
        }
    }
}
