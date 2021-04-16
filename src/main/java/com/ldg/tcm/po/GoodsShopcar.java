package com.ldg.tcm.po;

import com.baomidou.mybatisplus.annotation.IdType;
import java.util.Date;

import com.baomidou.mybatisplus.annotation.TableField;
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
 * @since 2021-04-06
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class GoodsShopcar implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    private Integer uid;

    private Integer goodsid;

    private Integer num;

    private Date createtime;

    private Date updatetime;

    private String goodsname;

    private Double price;

    private Double sum;

    private Integer ischeck;

    @TableField(exist = false)
    private String image;

}
