package com.ldg.tcm.po;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import java.io.Serializable;
import java.util.Date;

import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * <p>
 * 
 * </p>
 *
 * @author 李东阁
 * @since 2021-04-11
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class Oder implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    private String gooddname;

    private Double price;

    private Integer num;

    private Double sum;

    private Integer ispay;

    private Integer number;

    private Integer ischeck;

    private Integer uid;

    private Date createtime;

    @TableField(exist = false)
    private String image;


}
