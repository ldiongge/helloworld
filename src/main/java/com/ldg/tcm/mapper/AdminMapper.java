package com.ldg.tcm.mapper;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ldg.tcm.po.Admin;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author 李东阁
 * @since 2021-03-25
 */
@Repository
public interface AdminMapper extends BaseMapper<Admin> {

}
