package com.ldg.tcm.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ldg.tcm.po.Goods;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author 李东阁
 * @since 2021-04-02
 */
public interface GoodsService extends IService<Goods> {
    public List<Goods> selectGoodsAll(List<Goods> page, String content);

}
