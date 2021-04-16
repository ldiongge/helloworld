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
 * @since 2021-04-02
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class Goods implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    private String zyname;

    private Integer typeid;

    private Double price;

    private String spec;

    private String address;

    private String image;

    private String description;

    private Integer valid;

    private Integer stock;

    private Date createtime;

    private Date updatetime;

    @TableField(exist = false)
    private Goodstype type;
    @TableField(exist = false)
    private String typename;
}
