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
 * @since 2021-03-25
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class Admin implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    private String username;

    private String password;

    private String nickname;

    private String phone;

    private String email;

    private Date createtime;

    private Date updatetime;

    private Integer role;

    private Integer statusid;

    private  String remarks;
    @TableField(exist = false)
    private Boolean check;

   @TableField(exist = false)
   private String rolename;
    @TableField(exist = false)
    private Status status;



}
