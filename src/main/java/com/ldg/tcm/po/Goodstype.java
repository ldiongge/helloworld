package com.ldg.tcm.po;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import java.io.Serializable;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * <p>
 * 
 * </p>
 *
 * @author 李东阁
 * @since 2021-04-03
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class Goodstype implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "typeid", type = IdType.AUTO)
    private Integer typeid;

    private String typename;


}
