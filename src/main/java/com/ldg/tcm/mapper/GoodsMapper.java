package com.ldg.tcm.mapper;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ldg.tcm.po.Goods;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author 李东阁
 * @since 2021-04-02
 */
@Repository
public interface GoodsMapper extends BaseMapper<Goods> {
    public List<Goods> selectGoodsAll(List<Goods> page, String content) ;

}
